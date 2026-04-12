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

if "def list_confirmed_steps(" not in text:
    addition = """

def list_confirmed_steps(
    db: Database,
    *,
    callsign: str | None = None,
    entity_id: int | None = None,
) -> list[dict[str, Any]]:
    where_clauses: list[str] = ["s.state = ?"]
    params: list[Any] = [STEP_STATE_CONFIRMED]

    if callsign is not None:
        where_clauses.append("e.callsign = ?")
        params.append(callsign)
    if entity_id is not None:
        where_clauses.append("s.entity_id = ?")
        params.append(entity_id)

    where_sql = "WHERE " + " AND ".join(where_clauses)

    sql = f\"\"\"
        SELECT
            s.id,
            s.entity_id,
            e.callsign,
            s.title,
            s.phase,
            s.operation_type,
            s.target_path,
            s.state,
            s.issued_at,
            s.executed_at,
            s.confirmed_at,
            s.success_evidence,
            s.notes
        FROM steps s
        JOIN entities e ON e.id = s.entity_id
        {where_sql}
        ORDER BY s.id DESC
    \"\"\"

    with db.connect() as conn:
        rows = conn.execute(sql, tuple(params)).fetchall()
    return [dict(row) for row in rows]


def render_confirmed_steps_list(items: list[dict[str, Any]]) -> str:
    lines: list[str] = []
    lines.append("Confirmed steps")
    lines.append(f"  total: {len(items)}")
    lines.append("")
    if not items:
        lines.append("No confirmed steps found.")
        return "\\n".join(lines) + "\\n"

    for item in items:
        lines.append(f"[{item['id']}] {item['callsign']}")
        lines.append(f"  title: {item['title']}")
        lines.append(f"  phase: {item['phase']}")
        lines.append(f"  operation_type: {item['operation_type']}")
        lines.append(f"  target_path: {item['target_path']}")
        lines.append(f"  state: {item['state']}")
        lines.append(f"  confirmed_at: {item.get('confirmed_at') or ''}")
        lines.append(f"  success_evidence: {item.get('success_evidence') or ''}")
        if item.get("notes"):
            lines.append(f"  notes: {item['notes']}")
        lines.append("")
    return "\\n".join(lines).rstrip() + "\\n"
"""
    text = text.rstrip() + addition + "\n"

path.write_text(text, encoding="utf-8")
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

if "list-confirmed-steps" not in text:
    old_import = """from .steps_registry import (
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
    new_import = """from .steps_registry import (
    confirm_step_artifact,
    ensure_steps_table,
    get_active_step,
    issue_step,
    list_confirmed_steps,
    list_steps,
    mark_step_executed,
    render_active_step,
    render_confirmed_steps_list,
    render_steps_list,
)
"""
    if old_import not in text:
        raise SystemExit("Steps import block not found in cli.py")
    text = text.replace(old_import, new_import, 1)

    parser_anchor = """    show_entity_summary_group.add_argument("--callsign", help="Entity callsign")
    show_entity_summary_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    return parser
"""
    parser_addition = """    show_entity_summary_group.add_argument("--callsign", help="Entity callsign")
    show_entity_summary_group.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    list_confirmed_steps_cmd = subparsers.add_parser(
        "list-confirmed-steps",
        help="List confirmed steps by entity or for all entities",
    )
    list_confirmed_steps_cmd.add_argument("--callsign", help="Entity callsign")
    list_confirmed_steps_cmd.add_argument("--entity-id", dest="entity_id", type=int, help="Entity id")

    return parser
"""
    if parser_anchor not in text:
        raise SystemExit("Parser anchor for list-confirmed-steps not found in cli.py")
    text = text.replace(parser_anchor, parser_addition, 1)

    dispatch_anchor = """    if args.command == "show-entity-summary":
        return cmd_show_entity_summary(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    dispatch_addition = """    if args.command == "show-entity-summary":
        return cmd_show_entity_summary(args)
    if args.command == "list-confirmed-steps":
        return cmd_list_confirmed_steps(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""
    if dispatch_anchor not in text:
        raise SystemExit("Dispatch anchor for list-confirmed-steps not found in cli.py")
    text = text.replace(dispatch_anchor, dispatch_addition, 1)

    handler_anchor = """

def _db_from_args(args) -> Database:
"""
    handler_addition = """

def cmd_list_confirmed_steps(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    items = list_confirmed_steps(
        db,
        callsign=getattr(args, "callsign", None),
        entity_id=getattr(args, "entity_id", None),
    )
    print(render_confirmed_steps_list(items), end="")
    return 0


def _db_from_args(args) -> Database:
"""
    if handler_anchor not in text:
        raise SystemExit("Handler anchor for list-confirmed-steps not found in cli.py")
    text = text.replace(handler_anchor, handler_addition, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "  $CLI_FILE"
echo "  $STEPS_FILE"
echo "Backups:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
echo "  $BACKUP_DIR/steps_registry.py.$STAMP.bak"
