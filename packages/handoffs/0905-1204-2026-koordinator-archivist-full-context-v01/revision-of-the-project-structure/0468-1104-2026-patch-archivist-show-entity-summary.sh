#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
ENTITIES_FILE="$REPO/src/archivist/entities_registry.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$BACKUP_DIR"

if [ ! -f "$CLI_FILE" ]; then
  echo "CLI file not found: $CLI_FILE" >&2
  exit 1
fi

if [ ! -f "$ENTITIES_FILE" ]; then
  echo "Entities registry file not found: $ENTITIES_FILE" >&2
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
cp "$ENTITIES_FILE" "$BACKUP_DIR/entities_registry.py.$STAMP.bak"

"$PYBIN" - "$ENTITIES_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

if "def render_entity_summary(" not in text:
    addition = """

def render_entity_summary(
    entity: dict[str, Any] | None,
    *,
    active_step: dict[str, Any] | None = None,
) -> str:
    lines: list[str] = []
    lines.append("Entity summary")

    if entity is None:
        lines.append("  state: entity not found")
        return "\\n".join(lines) + "\\n"

    lines.append(f"  id: {entity.get('id')}")
    lines.append(f"  callsign: {entity.get('callsign') or ''}")
    lines.append(f"  contour: {entity.get('contour') or ''}")
    lines.append(f"  role: {entity.get('role') or ''}")
    lines.append(f"  package_path: {entity.get('package_path') or ''}")
    lines.append(f"  status: {entity.get('status') or ''}")
    lines.append(f"  current_phase: {entity.get('current_phase') or ''}")
    lines.append(f"  current_step_title: {entity.get('current_step_title') or ''}")
    lines.append(f"  next_allowed_action: {entity.get('next_allowed_action') or ''}")

    if entity.get("notes"):
        lines.append(f"  notes: {entity['notes']}")

    if active_step is None:
        lines.append("  active_step: none")
    else:
        lines.append("  active_step:")
        lines.append(f"    id: {active_step.get('id')}")
        lines.append(f"    title: {active_step.get('title') or ''}")
        lines.append(f"    phase: {active_step.get('phase') or ''}")
        lines.append(f"    operation_type: {active_step.get('operation_type') or ''}")
        lines.append(f"    target_path: {active_step.get('target_path') or ''}")
        lines.append(f"    state: {active_step.get('state') or ''}")

    lines.append(f"  created_at: {entity.get('created_at') or ''}")
    lines.append(f"  updated_at: {entity.get('updated_at') or ''}")
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

if "show-entity-summary" not in text:
    old_import = """from .entities_registry import (
    ensure_entities_table,
    get_entity_state,
    list_entities,
    register_entity,
    render_entities_list,
    render_entity_state,
)
"""
    new_import = """from .entities_registry import (
    ensure_entities_table,
    get_entity_state,
    list_entities,
    register_entity,
    render_entities_list,
    render_entity_state,
    render_entity_summary,
)
"""
    if old_import not in text:
        raise SystemExit("Entities import block not found in cli.py")
    text = text.replace(old_import, new_import, 1)

    parser_anchor = """    show_active_group.add_argument("--callsign", help="Entity callsign")
    show_active_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    return parser
"""
    parser_addition = """    show_active_group.add_argument("--callsign", help="Entity callsign")
    show_active_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    show_entity_summary_cmd = subparsers.add_parser(
        "show-entity-summary",
        help="Show compact entity summary with active step information",
    )
    show_entity_summary_group = show_entity_summary_cmd.add_mutually_exclusive_group(required=True)
    show_entity_summary_group.add_argument("--callsign", help="Entity callsign")
    show_entity_summary_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    return parser
"""
    if parser_anchor not in text:
        raise SystemExit("Parser anchor for show-entity-summary not found in cli.py")
    text = text.replace(parser_anchor, parser_addition, 1)

    dispatch_anchor = """    if args.command == "show-active-step":
        return cmd_show_active_step(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    dispatch_addition = """    if args.command == "show-active-step":
        return cmd_show_active_step(args)
    if args.command == "show-entity-summary":
        return cmd_show_entity_summary(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    if dispatch_anchor not in text:
        raise SystemExit("Dispatch anchor for show-entity-summary not found in cli.py")
    text = text.replace(dispatch_anchor, dispatch_addition, 1)

    handler_anchor = """

def _db_from_args(args) -> Database:
"""
    handler_addition = """

def cmd_show_entity_summary(args) -> int:
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

    active_step = get_active_step(
        db,
        entity_id=int(entity["id"]),
    )
    print(render_entity_summary(entity, active_step=active_step), end="")
    return 0


def _db_from_args(args) -> Database:
"""
    if handler_anchor not in text:
        raise SystemExit("Handler anchor for show-entity-summary not found in cli.py")
    text = text.replace(handler_anchor, handler_addition, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "  $CLI_FILE"
echo "  $ENTITIES_FILE"
echo "Backups:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
echo "  $BACKUP_DIR/entities_registry.py.$STAMP.bak"
