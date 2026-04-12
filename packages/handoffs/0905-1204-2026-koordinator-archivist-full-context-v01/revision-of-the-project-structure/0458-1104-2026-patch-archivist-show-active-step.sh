#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
STEPS_FILE="$REPO/src/archivist/steps_registry.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$BACKUP_DIR"

if [ ! -f "$CLI_FILE" ]; then
  echo "CLI file not found: $CLI_FILE" >&2
  exit 1
fi

if [ ! -f "$STEPS_FILE" ]; then
  echo "Steps registry file not found: $STEPS_FILE" >&2
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
cp "$STEPS_FILE" "$BACKUP_DIR/steps_registry.py.$STAMP.bak"

"$PYBIN" - "$STEPS_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

if "def get_active_step(" not in text:
    addition = """

def get_active_step(
    db: Database,
    *,
    callsign: str | None = None,
    entity_id: int | None = None,
) -> dict[str, Any] | None:
    entity = _get_entity_row(db, entity_id=entity_id, callsign=callsign)
    if entity is None:
        return None
    item = _get_active_step_for_entity(db, int(entity["id"]))
    if item is not None:
        item["callsign"] = entity["callsign"]
    return item


def render_active_step(
    item: dict[str, Any] | None,
    *,
    callsign: str | None = None,
    entity_id: int | None = None,
) -> str:
    lines: list[str] = []
    lines.append("Active step")

    if item is None:
        label = ""
        if callsign is not None:
            label = callsign
        elif entity_id is not None:
            label = str(entity_id)
        else:
            label = "unknown"

        lines.append(f"  entity: {label}")
        lines.append("  state: no active step")
        return "\\n".join(lines) + "\\n"

    lines.append(f"  id: {item['id']}")
    lines.append(f"  callsign: {item.get('callsign') or ''}")
    lines.append(f"  title: {item['title']}")
    lines.append(f"  phase: {item['phase']}")
    lines.append(f"  operation_type: {item['operation_type']}")
    lines.append(f"  target_path: {item['target_path']}")
    lines.append(f"  state: {item['state']}")
    lines.append(f"  issued_at: {item.get('issued_at') or ''}")
    lines.append(f"  executed_at: {item.get('executed_at') or ''}")
    lines.append(f"  confirmed_at: {item.get('confirmed_at') or ''}")
    lines.append(f"  success_evidence: {item.get('success_evidence') or ''}")
    if item.get("notes"):
        lines.append(f"  notes: {item['notes']}")
    return "\\n".join(lines) + "\\n"
"""
    text = text.rstrip() + addition + "\n"

path.write_text(text, encoding="utf-8")
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

if "show-active-step" not in text:
    old_import = """from .steps_registry import (
    confirm_step_artifact,
    ensure_steps_table,
    issue_step,
    list_steps,
    mark_step_executed,
    render_steps_list,
)
"""
    new_import = """from .steps_registry import (
    confirm_step_artifact,
    ensure_steps_table,
    get_active_step,
    issue_step,
    list_steps,
    mark_step_executed,
    render_active_step,
    render_steps_list,
)
"""
    if old_import not in text:
        raise SystemExit("Steps import block not found in cli.py")
    text = text.replace(old_import, new_import, 1)

    parser_anchor = """    list_steps_cmd.add_argument(
        "--only-active",
        action="store_true",
        help="Show only steps not yet in artifact_confirmed state",
    )

    return parser
"""
    parser_addition = """    list_steps_cmd.add_argument(
        "--only-active",
        action="store_true",
        help="Show only steps not yet in artifact_confirmed state",
    )

    show_active_step_cmd = subparsers.add_parser(
        "show-active-step",
        help="Show active step by callsign or entity id",
    )
    show_active_group = show_active_step_cmd.add_mutually_exclusive_group(required=True)
    show_active_group.add_argument("--callsign", help="Entity callsign")
    show_active_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    return parser
"""
    if parser_anchor not in text:
        raise SystemExit("Parser anchor for show-active-step not found in cli.py")
    text = text.replace(parser_anchor, parser_addition, 1)

    dispatch_anchor = """    if args.command == "list-steps":
        return cmd_list_steps(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    dispatch_addition = """    if args.command == "list-steps":
        return cmd_list_steps(args)
    if args.command == "show-active-step":
        return cmd_show_active_step(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    if dispatch_anchor not in text:
        raise SystemExit("Dispatch anchor for show-active-step not found in cli.py")
    text = text.replace(dispatch_anchor, dispatch_addition, 1)

    handler_anchor = """

def _db_from_args(args) -> Database:
"""
    handler_addition = """

def cmd_show_active_step(args) -> int:
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
        print("Entity not found.")
        return 1

    item = get_active_step(
        db,
        entity_id=int(entity["id"]),
    )
    print(
        render_active_step(
            item,
            callsign=entity.get("callsign"),
            entity_id=entity.get("id"),
        ),
        end="",
    )
    return 0


def _db_from_args(args) -> Database:
"""
    if handler_anchor not in text:
        raise SystemExit("Handler anchor for show-active-step not found in cli.py")
    text = text.replace(handler_anchor, handler_addition, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "  $CLI_FILE"
echo "  $STEPS_FILE"
echo "Backups:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
echo "  $BACKUP_DIR/steps_registry.py.$STAMP.bak"
