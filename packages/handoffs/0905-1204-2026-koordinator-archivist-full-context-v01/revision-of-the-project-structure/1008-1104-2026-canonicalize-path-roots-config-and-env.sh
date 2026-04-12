#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

CONFIG="/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/configs/big-swamp-config.json"
DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"

CANON_DOCUMENTS="/storage/emulated/0/Documents"
CANON_REPOS="/storage/emulated/0/Documents/repos"
CANON_PROJECT="/storage/emulated/0/Documents/Blagopoluchie"

mkdir -p "$DOC_DIR"

if [ ! -f "$CONFIG" ]; then
  echo "Config not found: $CONFIG" >&2
  exit 1
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CONFIG" "$CONFIG.$STAMP.bak"

python3 - "$CONFIG" "$CANON_DOCUMENTS" "$CANON_REPOS" "$CANON_PROJECT" <<'PY_EOF'
from pathlib import Path
import json
import sys

config_path = Path(sys.argv[1])
documents_root = sys.argv[2]
repos_root = sys.argv[3]
project_root = sys.argv[4]

data = json.loads(config_path.read_text(encoding="utf-8"))
if not isinstance(data, dict):
    raise SystemExit("Config JSON root is not an object")

path_roots = data.get("path_roots")
if not isinstance(path_roots, dict):
    path_roots = {}

path_roots["documents_root"] = documents_root
path_roots["repos_root"] = repos_root
path_roots["project_root"] = project_root

data["path_roots"] = path_roots

config_path.write_text(
    json.dumps(data, ensure_ascii=False, indent=2) + "\n",
    encoding="utf-8",
)
PY_EOF

for f in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile"; do
  [ -f "$f" ] || continue
  cp "$f" "$f.$STAMP.bak"
  python3 - "$f" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
lines = path.read_text(encoding="utf-8").splitlines()

out = []
changed = False
for line in lines:
    stripped = line.strip()
    if (
        "WB_PROJECT_ROOT" in stripped
        and not stripped.startswith("#")
    ):
        out.append("# DISABLED by path-roots normalization: " + line)
        changed = True
    else:
        out.append(line)

text = "\n".join(out) + "\n"
path.write_text(text, encoding="utf-8")
print(f"{path}: {'changed' if changed else 'no_change'}")
PY_EOF
done

unset WB_PROJECT_ROOT || true

cat > "$DOC_DIR/1008-1104-2026-path-roots-canonicalization-success-log.md" <<MD_EOF
# Журнал шага: canonicalize path roots config and env

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать канонизацию path_roots в config и нейтрализацию конфликтующего WB_PROJECT_ROOT

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: local_config_and_shell_updated
handoff_to: not_applicable
related_docs:
- 0738-1104-2026-cycle-open-path-abstraction-layer.md
- 0748-1104-2026-technical-task-path-abstraction-layer.md

## Что сделано

В config записаны канонические корни:

- documents_root = $CANON_DOCUMENTS
- repos_root = $CANON_REPOS
- project_root = $CANON_PROJECT

Также в стартовых shell-файлах были закомментированы активные упоминания `WB_PROJECT_ROOT`, если они там присутствовали.

## Зачем это сделано

Чтобы `project_root` перестал тихо приезжать из случайной старой среды и начал жить по канону path_roots.

## Следующий шаг

Перезапустить shell или открыть новый Termux-сеанс и перепроверить `show-path-roots`.
MD_EOF

echo "Updated config:"
echo "  $CONFIG"
echo "Backup:"
echo "  $CONFIG.$STAMP.bak"
echo
echo "Created:"
echo "  $DOC_DIR/1008-1104-2026-path-roots-canonicalization-success-log.md"
echo
echo "Current shell variable:"
printf 'WB_PROJECT_ROOT=%s\n' "${WB_PROJECT_ROOT-}"
