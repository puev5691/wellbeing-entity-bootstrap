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

old_block = '''    service_query_cmd.add_argument(
        "query_type",
        choices=["active-step", "entity-summary", "recent-artifacts"],
        help="Type of structured query",
    )
    service_query_group = service_query_cmd.add_mutually_exclusive_group(required=True)
'''
new_block = '''    service_query_cmd.add_argument(
        "query_type",
        choices=[
            "active-step",
            "entity-summary",
            "recent-artifacts",
            "bootstrap-packages",
            "bootstrap-package-summary",
        ],
        help="Type of structured query",
    )
    service_query_group = service_query_cmd.add_mutually_exclusive_group(required=False)
'''
if old_block not in text:
    raise SystemExit("service_query parser block not found exactly")
text = text.replace(old_block, new_block, 1)

pattern = re.compile(
    r'def cmd_service_query\(args\) -> int:\n(?:    .*\n)+?(?=\ndef |\Z)',
    re.S,
)

replacement = '''def cmd_service_query(args) -> int:
    entity_queries = {"active-step", "entity-summary", "recent-artifacts"}
    if args.query_type in entity_queries:
        if not getattr(args, "callsign", None) and getattr(args, "entity_id", None) is None:
            payload = {
                "ok": False,
                "query_type": args.query_type,
                "error": "callsign_or_entity_id_required",
            }
            print(json.dumps(payload, ensure_ascii=False, indent=2))
            return 2

    db = _db_from_args(args)
    payload, status = build_service_query_payload(
        db,
        query_type=args.query_type,
        callsign=getattr(args, "callsign", None),
        entity_id=getattr(args, "entity_id", None),
        limit=getattr(args, "limit", 10),
        packages_root=getattr(args, "packages_root", None),
        package_dir=getattr(args, "package_dir", None),
    )
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return status
'''
text, count = pattern.subn(replacement + "\n", text, count=1)
if count != 1:
    raise SystemExit("cmd_service_query function block not found")

path.write_text(text, encoding="utf-8")
print("patched", path)
PY_EOF

cat > "$SERVICE_FILE" <<'PY_EOF'
from __future__ import annotations

from typing import Any

from .bootstrap_packages import (
    collect_bootstrap_package_summary,
    list_bootstrap_packages,
)
from .db import Database
from .entities_registry import ensure_entities_table, get_entity_state
from .steps_registry import (
    ensure_steps_table,
    get_active_step,
    get_last_confirmed_step,
    list_recent_artifacts,
)


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


def build_service_query_payload(
    db: Database,
    *,
    query_type: str,
    callsign: str | None = None,
    entity_id: int | None = None,
    limit: int = 10,
    packages_root: str | None = None,
    package_dir: str | None = None,
) -> tuple[dict[str, Any], int]:
    if query_type == "bootstrap-packages":
        items = list_bootstrap_packages(packages_root or "")
        compact_items = [_compact_bootstrap_item(item) for item in items[:limit]]
        payload = {
            "ok": True,
            "query_type": query_type,
            "packages_root": packages_root,
            "total": len(items),
            "returned": len(compact_items),
            "data": {
                "items": compact_items,
            },
        }
        return payload, 0

    if query_type == "bootstrap-package-summary":
        if not package_dir:
            payload = {
                "ok": False,
                "query_type": query_type,
                "error": "package_dir_required",
            }
            return payload, 2

        item = collect_bootstrap_package_summary(package_dir)
        payload = {
            "ok": True,
            "query_type": query_type,
            "package_dir": package_dir,
            "data": item,
        }
        return payload, 0

    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    entity = get_entity_state(
        db,
        entity_id=entity_id,
        callsign=callsign,
    )
    if entity is None:
        payload = {
            "ok": False,
            "query_type": query_type,
            "error": "entity_not_found",
            "callsign": callsign,
            "entity_id": entity_id,
        }
        return payload, 1

    real_entity_id = int(entity["id"])
    active_step = get_active_step(db, entity_id=real_entity_id)
    last_confirmed_step = get_last_confirmed_step(db, entity_id=real_entity_id)

    if active_step is not None:
        operational_state_text = "active step present"
    elif last_confirmed_step is not None:
        operational_state_text = "idle with confirmed history"
    else:
        operational_state_text = "no active step"

    if query_type == "active-step":
        data: dict[str, Any] = {
            "active_step": active_step,
        }
    elif query_type == "entity-summary":
        data = {
            "active_step": active_step,
            "last_confirmed_step": last_confirmed_step,
            "operational_state_text": operational_state_text,
        }
    elif query_type == "recent-artifacts":
        items = list_recent_artifacts(
            db,
            entity_id=real_entity_id,
            limit=limit,
        )
        data = {
            "items": items,
            "count": len(items),
        }
    else:
        payload = {
            "ok": False,
            "query_type": query_type,
            "error": "unsupported_query_type",
        }
        return payload, 2

    payload = {
        "ok": True,
        "query_type": query_type,
        "entity": {
            "id": entity.get("id"),
            "callsign": entity.get("callsign"),
            "contour": entity.get("contour"),
            "role": entity.get("role"),
            "status": entity.get("status"),
            "current_phase": entity.get("current_phase"),
            "package_path": entity.get("package_path"),
        },
        "data": data,
    }
    return payload, 0
PY_EOF

echo "Patched:"
echo "  $CLI_FILE"
echo "  $SERVICE_FILE"
echo
echo "Backups:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
echo "  $BACKUP_DIR/service_layer.py.$STAMP.bak"
