#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
SERVICE_FILE="$REPO/src/archivist/service_layer.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$BACKUP_DIR"

for f in "$CLI_FILE" "$SERVICE_FILE"; do
  if [ ! -f "$f" ]; then
    echo "Required file not found: $f" >&2
    exit 1
  fi
done

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"
cp "$SERVICE_FILE" "$BACKUP_DIR/service_layer.py.$STAMP.bak"

python3 - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

# 1) make service-query selector group optional for bootstrap queries
text = re.sub(
    r'(\w+\s*=\s*service_query_cmd\.add_mutually_exclusive_group\()required=True(\))',
    r'\1required=False\2',
    text,
    count=1,
)

# 2) replace query_type choices block
pattern = re.compile(
    r'service_query_cmd\.add_argument\(\s*"query_type",\s*choices=\[[^\]]*\],\s*help="[^"]*"\s*\)',
    re.S,
)
replacement = '''service_query_cmd.add_argument(
        "query_type",
        choices=[
            "active-step",
            "entity-summary",
            "recent-artifacts",
            "bootstrap-packages",
            "bootstrap-package-summary",
        ],
        help="Machine-readable query type",
    )'''
text, count = pattern.subn(replacement, text, count=1)
if count != 1:
    raise SystemExit("service_query query_type block not found")

# 3) ensure packages-root and package-dir args exist
if "--packages-root" not in text:
    marker = '    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")\n'
    addition = '''    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")
    service_query_cmd.add_argument(
        "--packages-root",
        default=DEFAULT_BOOTSTRAP_PACKAGES_ROOT,
        help="Bootstrap packages root for bootstrap service queries",
    )
    service_query_cmd.add_argument(
        "--package-dir",
        help="Bootstrap package directory for bootstrap package summary query",
    )
'''
    if marker not in text:
        raise SystemExit("service_query limit marker not found")
    text = text.replace(marker, addition, 1)

path.write_text(text, encoding="utf-8")
print("patched", path)
PY_EOF

python3 - "$SERVICE_FILE" <<'PY_EOF'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

# 1) import bootstrap helpers if absent
import_block = '''from .bootstrap_packages import (
    collect_bootstrap_package_summary,
    list_bootstrap_packages,
)
'''
if import_block not in text:
    anchor = 'from typing import Any\n'
    if anchor not in text:
        raise SystemExit("typing import anchor not found in service_layer.py")
    text = text.replace(anchor, anchor + import_block, 1)

# 2) add helpers if absent
if "def build_bootstrap_packages_query_payload(args) -> dict[str, Any]:" not in text:
    anchor = 'def build_service_query_payload(args) -> dict[str, Any]:\n'
    if anchor not in text:
        raise SystemExit("build_service_query_payload definition not found")

    helpers = '''
def _compact_bootstrap_item(item: dict[str, Any]) -> dict[str, Any]:
    return {
        "package_name": item.get("package_name"),
        "package_id": item.get("package_id"),
        "entity_author": item.get("entity_author"),
        "entity_role": item.get("entity_role"),
        "entity_contour": item.get("entity_contour"),
        "approval_status": item.get("approval_status"),
        "human_responsible": item.get("human_responsible"),
        "tooling_origin": item.get("tooling_origin"),
        "is_minimally_complete": item.get("is_minimally_complete"),
        "required_files_total": item.get("required_files_total"),
        "existing_files": item.get("existing_files", []),
        "missing_files": item.get("missing_files", []),
    }


def build_bootstrap_packages_query_payload(args) -> dict[str, Any]:
    items = list_bootstrap_packages(getattr(args, "packages_root", ""))
    limit = int(getattr(args, "limit", 10) or 10)
    compact_items = [_compact_bootstrap_item(item) for item in items[:limit]]
    return {
        "ok": True,
        "query_type": "bootstrap-packages",
        "packages_root": getattr(args, "packages_root", ""),
        "total": len(items),
        "returned": len(compact_items),
        "data": {
            "items": compact_items,
        },
    }


def build_bootstrap_package_summary_query_payload(args) -> dict[str, Any]:
    package_dir = getattr(args, "package_dir", None)
    if not package_dir:
        return {
            "ok": False,
            "query_type": "bootstrap-package-summary",
            "error": "package_dir is required",
        }
    item = collect_bootstrap_package_summary(package_dir)
    return {
        "ok": True,
        "query_type": "bootstrap-package-summary",
        "package_dir": package_dir,
        "data": item,
    }


'''
    text = text.replace(anchor, helpers + anchor, 1)

# 3) extend dispatch inside build_service_query_payload
if 'if query_type == "bootstrap-packages":' not in text:
    raise_marker = 'raise ValueError(f"Unsupported service query type: {query_type}")'
    insertion = '''    if query_type == "bootstrap-packages":
        return build_bootstrap_packages_query_payload(args)
    if query_type == "bootstrap-package-summary":
        return build_bootstrap_package_summary_query_payload(args)
'''
    if raise_marker not in text:
        raise SystemExit("unsupported-query raise marker not found in service_layer.py")
    text = text.replace(raise_marker, insertion + '    ' + raise_marker, 1)

path.write_text(text, encoding="utf-8")
print("patched", path)
PY_EOF

echo "Backups:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
echo "  $BACKUP_DIR/service_layer.py.$STAMP.bak"
