#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
STEPS_MODULE="$REPO/src/archivist/steps_registry.py"
BACKUP_DIR="$REPO/.wb-backups-cycle2-steps"

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

cat > "$STEPS_MODULE" <<'PY_EOF'
from __future__ import annotations

from datetime import datetime, timezone
from typing import Any

from .db import Database
from .entities_registry import ensure_entities_table

STEP_STATE_ISSUED = "script_issued"
STEP_STATE_EXECUTED = "script_executed"
STEP_STATE_CONFIRMED = "artifact_confirmed"

STEPS_SCHEMA_SQL = """
CREATE TABLE IF NOT EXISTS steps (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    entity_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    phase TEXT NOT NULL,
    operation_type TEXT NOT NULL,
    target_path TEXT NOT NULL,
    state TEXT NOT NULL,
    issued_at TEXT NOT NULL,
    executed_at TEXT,
    confirmed_at TEXT,
    success_evidence TEXT,
    notes TEXT,
    FOREIGN KEY(entity_id) REFERENCES entities(id)
);
"""


def _utc_now() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="seconds")


def ensure_steps_table(db: Database) -> None:
    ensure_entities_table(db)
    with db.connect() as conn:
        conn.executescript(STEPS_SCHEMA_SQL)
        conn.commit()


def _get_entity_row(
    db: Database,
    *,
    entity_id: int | None = None,
    callsign: str | None = None,
) -> dict[str, Any] | None:
    if entity_id is None and callsign is None:
        raise ValueError("Either entity_id or callsign must be provided")

    with db.connect() as conn:
        if entity_id is not None:
            row = conn.execute(
                """
                SELECT id, callsign, contour, role, package_path, status,
                       current_phase, current_step_title, next_allowed_action, notes
                FROM entities
                WHERE id = ?
                """,
                (entity_id,),
            ).fetchone()
        else:
            row = conn.execute(
                """
                SELECT id, callsign, contour, role, package_path, status,
                       current_phase, current_step_title, next_allowed_action, notes
                FROM entities
                WHERE callsign = ?
                """,
                (callsign,),
            ).fetchone()
    return None if row is None else dict(row)


def _get_active_step_for_entity(db: Database, entity_id: int) -> dict[str, Any] | None:
    with db.connect() as conn:
        row = conn.execute(
            """
            SELECT id, entity_id, title, phase, operation_type, target_path,
                   state, issued_at, executed_at, confirmed_at, success_evidence, notes
            FROM steps
            WHERE entity_id = ?
              AND state != ?
            ORDER BY id DESC
            LIMIT 1
            """,
            (entity_id, STEP_STATE_CONFIRMED),
        ).fetchone()
    return None if row is None else dict(row)


def issue_step(
    db: Database,
    *,
    callsign: str,
    title: str,
    phase: str,
    operation_type: str,
    target_path: str,
    notes: str = "",
) -> int:
    entity = _get_entity_row(db, callsign=callsign)
    if entity is None:
        raise RuntimeError(f"Entity not found: {callsign}")

    active = _get_active_step_for_entity(db, int(entity["id"]))
    if active is not None:
        raise RuntimeError(
            f"Active step already exists for {callsign}: "
            f"id={active['id']}, state={active['state']}, title={active['title']}"
        )

    now = _utc_now()
    with db.connect() as conn:
        cur = conn.execute(
            """
            INSERT INTO steps (
                entity_id, title, phase, operation_type, target_path,
                state, issued_at, executed_at, confirmed_at,
                success_evidence, notes
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """,
            (
                int(entity["id"]),
                title,
                phase,
                operation_type,
                target_path,
                STEP_STATE_ISSUED,
                now,
                None,
                None,
                None,
                notes,
            ),
        )
        conn.commit()
        return int(cur.lastrowid)


def mark_step_executed(db: Database, *, step_id: int, notes: str = "") -> None:
    now = _utc_now()
    with db.connect() as conn:
        row = conn.execute(
            "SELECT id, state, notes FROM steps WHERE id = ?",
            (step_id,),
        ).fetchone()
        if row is None:
            raise RuntimeError(f"Step not found: {step_id}")
        state = str(row["state"])
        if state != STEP_STATE_ISSUED:
            raise RuntimeError(
                f"Step {step_id} is not in state {STEP_STATE_ISSUED}; current state: {state}"
            )
        merged_notes = notes.strip()
        conn.execute(
            """
            UPDATE steps
            SET state = ?, executed_at = ?, notes = ?
            WHERE id = ?
            """,
            (
                STEP_STATE_EXECUTED,
                now,
                merged_notes if merged_notes else row["notes"],
                step_id,
            ),
        )
        conn.commit()


def confirm_step_artifact(
    db: Database,
    *,
    step_id: int,
    success_evidence: str,
    notes: str = "",
) -> None:
    now = _utc_now()
    with db.connect() as conn:
        row = conn.execute(
            "SELECT id, state, notes FROM steps WHERE id = ?",
            (step_id,),
        ).fetchone()
        if row is None:
            raise RuntimeError(f"Step not found: {step_id}")
        state = str(row["state"])
        if state != STEP_STATE_EXECUTED:
            raise RuntimeError(
                f"Step {step_id} is not in state {STEP_STATE_EXECUTED}; current state: {state}"
            )
        merged_notes = notes.strip()
        conn.execute(
            """
            UPDATE steps
            SET state = ?, confirmed_at = ?, success_evidence = ?, notes = ?
            WHERE id = ?
            """,
            (
                STEP_STATE_CONFIRMED,
                now,
                success_evidence,
                merged_notes if merged_notes else row["notes"],
                step_id,
            ),
        )
        conn.commit()


def list_steps(
    db: Database,
    *,
    callsign: str | None = None,
    entity_id: int | None = None,
    only_active: bool = False,
) -> list[dict[str, Any]]:
    where_clauses: list[str] = []
    params: list[Any] = []

    if callsign is not None:
        where_clauses.append("e.callsign = ?")
        params.append(callsign)
    if entity_id is not None:
        where_clauses.append("s.entity_id = ?")
        params.append(entity_id)
    if only_active:
        where_clauses.append("s.state != ?")
        params.append(STEP_STATE_CONFIRMED)

    where_sql = ""
    if where_clauses:
        where_sql = "WHERE " + " AND ".join(where_clauses)

    sql = f"""
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
    """

    with db.connect() as conn:
        rows = conn.execute(sql, tuple(params)).fetchall()
    return [dict(row) for row in rows]


def render_steps_list(items: list[dict[str, Any]]) -> str:
    lines: list[str] = []
    lines.append("Steps registry")
    lines.append(f"  total: {len(items)}")
    lines.append("")
    if not items:
        lines.append("No steps found.")
        return "\n".join(lines) + "\n"

    for item in items:
        lines.append(f"[{item['id']}] {item['callsign']}")
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
        lines.append("")
    return "\n".join(lines).rstrip() + "\n"
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

import_anchor = """from .entities_registry import (
    ensure_entities_table,
    get_entity_state,
    list_entities,
    register_entity,
    render_entities_list,
    render_entity_state,
)
"""

steps_import = """from .steps_registry import (
    confirm_step_artifact,
    ensure_steps_table,
    issue_step,
    list_steps,
    mark_step_executed,
    render_steps_list,
)
"""

if "from .steps_registry import (" not in text:
    if import_anchor not in text:
        raise SystemExit("Steps import anchor not found")
    text = text.replace(import_anchor, import_anchor + steps_import, 1)

parser_anchor = """    show_group.add_argument("--callsign", help="Entity callsign")
    show_group.add_argument("--id", dest="entity_id", type=int, help="Entity id")

    return parser
"""

steps_parser = """    issue_step_cmd = subparsers.add_parser(
        "issue-step",
        help="Create step in the steps registry with state script_issued",
    )
    issue_step_cmd.add_argument("--callsign", required=True, help="Entity callsign")
    issue_step_cmd.add_argument("--title", required=True, help="Step title")
    issue_step_cmd.add_argument("--phase", required=True, help="Step phase")
    issue_step_cmd.add_argument("--operation-type", required=True, help="Operation type")
    issue_step_cmd.add_argument("--target-path", required=True, help="Target file path")
    issue_step_cmd.add_argument("--notes", default="", help="Step notes")

    mark_step_executed_cmd = subparsers.add_parser(
        "mark-step-executed",
        help="Mark step as script_executed",
    )
    mark_step_executed_cmd.add_argument("step_id", type=int, help="Step id")
    mark_step_executed_cmd.add_argument("--notes", default="", help="Execution notes")

    confirm_step_artifact_cmd = subparsers.add_parser(
        "confirm-step-artifact",
        help="Mark step as artifact_confirmed",
    )
    confirm_step_artifact_cmd.add_argument("step_id", type=int, help="Step id")
    confirm_step_artifact_cmd.add_argument(
        "--success-evidence",
        required=True,
        help="Evidence string proving artifact confirmation",
    )
    confirm_step_artifact_cmd.add_argument("--notes", default="", help="Confirmation notes")

    list_steps_cmd = subparsers.add_parser(
        "list-steps",
        help="List steps, optionally filtered by entity",
    )
    list_steps_cmd.add_argument("--callsign", help="Entity callsign")
    list_steps_cmd.add_argument("--entity-id", type=int, help="Entity id")
    list_steps_cmd.add_argument(
        "--only-active",
        action="store_true",
        help="Show only steps not yet in artifact_confirmed state",
    )

    return parser
"""

if '"issue-step"' not in text:
    if parser_anchor not in text:
        raise SystemExit("Steps parser anchor not found")
    text = text.replace(parser_anchor, """    show_group.add_argument("--callsign", help="Entity callsign")
    show_group.add_argument("--id", dest="entity_id", type=int, help="Entity id")

""" + steps_parser, 1)

dispatch_anchor = """    if args.command == "show-entity-state":
        return cmd_show_entity_state(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""

steps_dispatch = """    if args.command == "show-entity-state":
        return cmd_show_entity_state(args)
    if args.command == "issue-step":
        return cmd_issue_step(args)
    if args.command == "mark-step-executed":
        return cmd_mark_step_executed(args)
    if args.command == "confirm-step-artifact":
        return cmd_confirm_step_artifact(args)
    if args.command == "list-steps":
        return cmd_list_steps(args)

    parser.error(f"Unknown command: {args.command}")
    return 2
"""

if 'if args.command == "issue-step":' not in text:
    if dispatch_anchor not in text:
        raise SystemExit("Steps dispatch anchor not found")
    text = text.replace(dispatch_anchor, steps_dispatch, 1)

handler_anchor = """

def _db_from_args(args) -> Database:
"""

steps_handlers = """

def cmd_issue_step(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    step_id = issue_step(
        db,
        callsign=args.callsign,
        title=args.title,
        phase=args.phase,
        operation_type=args.operation_type,
        target_path=args.target_path,
        notes=args.notes,
    )
    print(f"Step issued: id={step_id}")
    return 0


def cmd_mark_step_executed(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    mark_step_executed(db, step_id=args.step_id, notes=args.notes)
    print(f"Step marked as executed: id={args.step_id}")
    return 0


def cmd_confirm_step_artifact(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    confirm_step_artifact(
        db,
        step_id=args.step_id,
        success_evidence=args.success_evidence,
        notes=args.notes,
    )
    print(f"Step confirmed: id={args.step_id}")
    return 0


def cmd_list_steps(args) -> int:
    db = _db_from_args(args)
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)
    items = list_steps(
        db,
        callsign=args.callsign,
        entity_id=args.entity_id,
        only_active=args.only_active,
    )
    print(render_steps_list(items), end="")
    return 0


def _db_from_args(args) -> Database:
"""

if "def cmd_issue_step(args) -> int:" not in text:
    if handler_anchor not in text:
        raise SystemExit("Steps handler anchor not found")
    text = text.replace(handler_anchor, steps_handlers, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "===== VERIFY: help output ====="
"$PYBIN" "$REPO/archivist.py" -h | sed -n '1,320p'

echo
echo "===== VERIFY: grep commands ====="
grep -n "issue-step\|mark-step-executed\|confirm-step-artifact\|list-steps" "$CLI_FILE"

echo
echo "Patched successfully:"
echo "$CLI_FILE"
echo "$STEPS_MODULE"
echo "Backup:"
echo "$BACKUP_DIR/cli.py.$STAMP.bak"
