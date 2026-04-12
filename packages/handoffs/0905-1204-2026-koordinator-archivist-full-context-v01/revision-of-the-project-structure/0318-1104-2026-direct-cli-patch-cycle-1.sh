#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
BACKUP_DIR="$REPO/.wb-backups-cycle1-cli-direct"

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

import_anchor = "from .repo_start_context import build_repo_start_context, render_repo_start_context, default_repo_start_context_output_path\n"
import_block = """from .entities_registry import (
    ensure_entities_table,
    get_entity_state,
    list_entities,
    register_entity,
    render_entities_list,
    render_entity_state,
)
"""

if "from .entities_registry import (" not in text:
    if import_anchor not in text:
        raise SystemExit("Import anchor not found")
    text = text.replace(import_anchor, import_anchor + import_block, 1)

parser_anchor = """    build_copy_map_append_patch_cmd.add_argument(
        "--write",
        action="store_true",
        help="Write append-ready patch to .wb-copy-map.append.tsv inside the package",
    )

    return parser
"""

parser_block = """    register_entity_cmd = subparsers.add_parser(
        "register-entity",
        help="Register or update entity in the entities registry",
    )
    register_entity_cmd.add_argument("callsign", help="Entity callsign")
    register_entity_cmd.add_argument("--contour", required=True, help="Entity contour")
    register_entity_cmd.add_argument("--role", required=True, help="Entity role")
    register_entity_cmd.add_argument("--package-path", required=True, help="Entity package path")
    register_entity_cmd.add_argument("--status", default="active", help="Entity status")
    register_entity_cmd.add_argument("--current-phase", default="bootstrap", help="Current phase")
    register_entity_cmd.add_argument("--current-step-title", default="", help="Current step title")
    register_entity_cmd.add_argument("--next-allowed-action", default="", help="Next allowed action")
    register_entity_cmd.add_argument("--notes", default="", help="Entity notes")

    subparsers.add_parser("list-entities", help="List registered entities")

    show_entity_state_cmd = subparsers.add_parser(
        "show-entity-state",
        help="Show entity state by callsign or id",
    )
    show_group = show_entity_state_cmd.add_mutually_exclusive_group(required=True)
    show_group.add_argument("--callsign", help="Entity callsign")
    show_group.add_argument("--id", dest="entity_id", type=int, help="Entity id")

    return parser
"""

if '"register-entity"' not in text:
    if parser_anchor not in text:
        raise SystemExit("Parser anchor not found")
    text = text.replace(parser_anchor, parser_block, 1)

dispatch_anchor = """    if args.command == "build-copy-map-append-patch":
        return cmd_build_copy_map_append_patch(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""

dispatch_block = """    if args.command == "build-copy-map-append-patch":
        return cmd_build_copy_map_append_patch(args)
    if args.command == "register-entity":
        return cmd_register_entity(args)
    if args.command == "list-entities":
        return cmd_list_entities(args)
    if args.command == "show-entity-state":
        return cmd_show_entity_state(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""

if 'if args.command == "register-entity":' not in text:
    if dispatch_anchor not in text:
        raise SystemExit("Dispatch anchor not found")
    text = text.replace(dispatch_anchor, dispatch_block, 1)

handler_anchor = "def _db_from_args(args) -> Database:\n"
handlers_block = """
def cmd_register_entity(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    entity_id = register_entity(
        db,
        callsign=args.callsign,
        contour=args.contour,
        role=args.role,
        package_path=args.package_path,
        status=args.status,
        current_phase=args.current_phase,
        current_step_title=args.current_step_title,
        next_allowed_action=args.next_allowed_action,
        notes=args.notes,
    )
    print(f"Entity registered: {args.callsign} (id={entity_id})")
    return 0


def cmd_list_entities(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    items = list_entities(db)
    print(render_entities_list(items), end="")
    return 0


def cmd_show_entity_state(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    item = get_entity_state(
        db,
        entity_id=getattr(args, "entity_id", None),
        callsign=getattr(args, "callsign", None),
    )
    if item is None:
        print("Entity not found.")
        return 1
    print(render_entity_state(item), end="")
    return 0


def _db_from_args(args) -> Database:
"""

if "def cmd_register_entity(args) -> int:" not in text:
    if handler_anchor not in text:
        raise SystemExit("Handler anchor not found")
    text = text.replace(handler_anchor, handlers_block, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "===== VERIFY: grep commands in cli.py ====="
grep -n "register-entity\|list-entities\|show-entity-state" "$CLI_FILE"

echo
echo "===== VERIFY: help output ====="
"$PYBIN" "$REPO/archivist.py" -h | sed -n '1,260p'

echo
echo "Patched successfully:"
echo "$CLI_FILE"
echo "Backup:"
echo "$BACKUP_DIR/cli.py.$STAMP.bak"
