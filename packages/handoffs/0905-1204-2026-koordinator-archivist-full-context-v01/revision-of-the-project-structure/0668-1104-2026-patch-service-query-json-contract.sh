#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$BACKUP_DIR"

if [ ! -f "$CLI_FILE" ]; then
  echo "CLI file not found: $CLI_FILE" >&2
  exit 1
fi

PYBIN=""
if command -v python3 >/dev/null 2>&1; then
  PYBIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYBIN="python"
else
  echo "Neither python3 nor python is available." >&2
  exit 127
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

old_block = """def cmd_service_query(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    entity = get_entity_state(
        db,
        entity_id=getattr(args, "entity_id", None),
        callsign=getattr(args, "callsign", None),
    )
    if entity is None:
        payload = {
            "ok": False,
            "query_type": args.query_type,
            "error": "entity_not_found",
            "callsign": getattr(args, "callsign", None),
            "entity_id": getattr(args, "entity_id", None),
        }
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return 1

    entity_id = int(entity["id"])

    if args.query_type == "active-step":
        data = get_active_step(db, entity_id=entity_id)
    elif args.query_type == "entity-summary":
        data = {
            "entity": entity,
            "active_step": get_active_step(db, entity_id=entity_id),
            "last_confirmed_step": get_last_confirmed_step(db, entity_id=entity_id),
        }
    elif args.query_type == "recent-artifacts":
        data = list_recent_artifacts(
            db,
            entity_id=entity_id,
            limit=getattr(args, "limit", 10),
        )
    else:
        payload = {
            "ok": False,
            "query_type": args.query_type,
            "error": "unsupported_query_type",
        }
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return 2

    payload = {
        "ok": True,
        "query_type": args.query_type,
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
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return 0
"""

new_block = """def cmd_service_query(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    entity = get_entity_state(
        db,
        entity_id=getattr(args, "entity_id", None),
        callsign=getattr(args, "callsign", None),
    )
    if entity is None:
        payload = {
            "ok": False,
            "query_type": args.query_type,
            "error": "entity_not_found",
            "callsign": getattr(args, "callsign", None),
            "entity_id": getattr(args, "entity_id", None),
        }
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return 1

    entity_id = int(entity["id"])
    active_step = get_active_step(db, entity_id=entity_id)
    last_confirmed_step = get_last_confirmed_step(db, entity_id=entity_id)

    if active_step is not None:
        operational_state_text = "active step present"
    elif last_confirmed_step is not None:
        operational_state_text = "idle with confirmed history"
    else:
        operational_state_text = "no active step"

    if args.query_type == "active-step":
        data = {
            "active_step": active_step,
        }
    elif args.query_type == "entity-summary":
        data = {
            "active_step": active_step,
            "last_confirmed_step": last_confirmed_step,
            "operational_state_text": operational_state_text,
        }
    elif args.query_type == "recent-artifacts":
        items = list_recent_artifacts(
            db,
            entity_id=entity_id,
            limit=getattr(args, "limit", 10),
        )
        data = {
            "items": items,
            "count": len(items),
        }
    else:
        payload = {
            "ok": False,
            "query_type": args.query_type,
            "error": "unsupported_query_type",
        }
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return 2

    payload = {
        "ok": True,
        "query_type": args.query_type,
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
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return 0
"""

if old_block not in text:
    raise SystemExit("cmd_service_query block not found for replacement")

text = text.replace(old_block, new_block, 1)
path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "  $CLI_FILE"
echo "Backup:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
