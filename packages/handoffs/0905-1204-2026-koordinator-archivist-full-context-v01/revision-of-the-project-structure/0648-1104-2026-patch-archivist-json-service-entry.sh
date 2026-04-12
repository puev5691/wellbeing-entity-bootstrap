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

if "import json" not in text:
    if "import argparse\n" not in text:
        raise SystemExit("import argparse not found in cli.py")
    text = text.replace("import argparse\n", "import argparse\nimport json\n", 1)

if "service-query" not in text:
    parser_anchor = """    list_recent_artifacts_cmd.add_argument("--callsign", help="Entity callsign")
    list_recent_artifacts_cmd.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")
    list_recent_artifacts_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results")

    return parser
"""
    parser_addition = """    list_recent_artifacts_cmd.add_argument("--callsign", help="Entity callsign")
    list_recent_artifacts_cmd.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")
    list_recent_artifacts_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results")

    service_query_cmd = subparsers.add_parser(
        "service-query",
        help="Return machine-readable JSON for selected archivist query type",
    )
    service_query_cmd.add_argument(
        "query_type",
        choices=["active-step", "entity-summary", "recent-artifacts"],
        help="Type of structured query",
    )
    service_query_group = service_query_cmd.add_mutually_exclusive_group(required=True)
    service_query_group.add_argument("--callsign", help="Entity callsign")
    service_query_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")
    service_query_cmd.add_argument("--limit", type=int, default=10, help="Maximum number of results for list-style queries")

    return parser
"""
    if parser_anchor not in text:
        raise SystemExit("Parser anchor for service-query not found in cli.py")
    text = text.replace(parser_anchor, parser_addition, 1)

    dispatch_anchor = """    if args.command == "list-recent-artifacts":
        return cmd_list_recent_artifacts(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    dispatch_addition = """    if args.command == "list-recent-artifacts":
        return cmd_list_recent_artifacts(args)
    if args.command == "service-query":
        return cmd_service_query(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    if dispatch_anchor not in text:
        raise SystemExit("Dispatch anchor for service-query not found in cli.py")
    text = text.replace(dispatch_anchor, dispatch_addition, 1)

    handler_anchor = """

def _db_from_args(args) -> Database:
"""
    handler_addition = """

def cmd_service_query(args) -> int:
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


def _db_from_args(args) -> Database:
"""
    if handler_anchor not in text:
        raise SystemExit("Handler anchor for service-query not found in cli.py")
    text = text.replace(handler_anchor, handler_addition, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "  $CLI_FILE"
echo "Backup:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
