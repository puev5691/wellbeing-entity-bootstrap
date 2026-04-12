#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
PATH_FILE="$REPO/src/archivist/path_abstraction.py"
CONFIG="/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/configs/big-swamp-config.json"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$BACKUP_DIR"

if [ ! -f "$PATH_FILE" ]; then
  echo "Missing file: $PATH_FILE" >&2
  exit 1
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$PATH_FILE" "$BACKUP_DIR/path_abstraction.py.$STAMP.bak"

python3 - "$PATH_FILE" <<'PY'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

text = text.replace('"\\\\n".join(lines) + "\\\\n"', '"\\n".join(lines) + "\\n"')
text = text.replace('return "Split absolute path\\\\n  state: no matching root\\\\n"', 'return "Split absolute path\\n  state: no matching root\\n"')
text = text.replace('"\\\\n".join(lines)', '"\\n".join(lines)')

path.write_text(text, encoding="utf-8")
PY

echo "=== PATH ROOTS FROM CONFIG ==="
python3 - "$CONFIG" <<'PY'
from pathlib import Path
import json, sys

cfg_path = Path(sys.argv[1])
if not cfg_path.exists():
    print("config_missing")
    raise SystemExit(0)

data = json.loads(cfg_path.read_text(encoding="utf-8"))
roots = data.get("path_roots")
if roots is None:
    print("path_roots: <missing>")
elif isinstance(roots, dict):
    print("path_roots:")
    for k, v in roots.items():
        print(f"  {k}: {v}")
else:
    print(f"path_roots: <non-dict> {type(roots).__name__}")
PY

echo
echo "=== ENV ROOTS ==="
printf 'WB_DOCUMENTS_ROOT=%s\n' "${WB_DOCUMENTS_ROOT-}"
printf 'WB_REPOS_ROOT=%s\n' "${WB_REPOS_ROOT-}"
printf 'WB_PROJECT_ROOT=%s\n' "${WB_PROJECT_ROOT-}"

echo
echo "=== RECHECK ==="
python /storage/emulated/0/Documents/repos/wellbeing-archivist/archivist.py \
  --config "$CONFIG" show-path-roots

python /storage/emulated/0/Documents/repos/wellbeing-archivist/archivist.py \
  --config "$CONFIG" resolve-logical-path documents_root Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/work-with-SMI

python /storage/emulated/0/Documents/repos/wellbeing-archivist/archivist.py \
  --config "$CONFIG" split-absolute-path /storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/work-with-SMI
