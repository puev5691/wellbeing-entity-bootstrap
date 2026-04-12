#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
ENTITY_MODULE="$REPO/src/archivist/entities_registry.py"
BACKUP_DIR="$REPO/.wb-backups-cycle1-entities"

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

cat > "$ENTITY_MODULE" <<'PY_EOF'
from __future__ import annotations

from datetime import datetime, timezone
from typing import Any

from .db import Database

ENTITIES_SCHEMA_SQL = """
CREATE TABLE IF NOT EXISTS entities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    callsign TEXT NOT NULL UNIQUE,
    contour TEXT NOT NULL,
    role TEXT NOT NULL,
    package_path TEXT NOT NULL,
    status TEXT NOT NULL,
    current_phase TEXT NOT NULL,
    current_step_title TEXT,
    next_allowed_action TEXT,
    notes TEXT,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL
);
"""


def _utc_now() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="seconds")


def ensure_entities_table(db: Database) -> None:
    with db.connect() as conn:
        conn.executescript(ENTITIES_SCHEMA_SQL)
        conn.commit()


def register_entity(
    db: Database,
    *,
    callsign: str,
    contour: str,
    role: str,
    package_path: str,
    status: str,
    current_phase: str,
    current_step_title: str = "",
    next_allowed_action: str = "",
    notes: str = "",
) -> int:
    now = _utc_now()
    with db.connect() as conn:
        conn.execute(
            """
            INSERT INTO entities (
                callsign, contour, role, package_path, status,
                current_phase, current_step_title, next_allowed_action,
                notes, created_at, updated_at
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ON CONFLICT(callsign) DO UPDATE SET
                contour = excluded.contour,
                role = excluded.role,
                package_path = excluded.package_path,
                status = excluded.status,
                current_phase = excluded.current_phase,
                current_step_title = excluded.current_step_title,
                next_allowed_action = excluded.next_allowed_action,
                notes = excluded.notes,
                updated_at = excluded.updated_at
            """,
            (
                callsign,
                contour,
                role,
                package_path,
                status,
                current_phase,
                current_step_title,
                next_allowed_action,
                notes,
                now,
                now,
            ),
        )
        row = conn.execute(
            "SELECT id FROM entities WHERE callsign = ?",
            (callsign,),
        ).fetchone()
        conn.commit()
        if row is None:
            raise RuntimeError("Failed to fetch entity id after upsert")
        return int(row["id"])


def list_entities(db: Database) -> list[dict[str, Any]]:
    with db.connect() as conn:
        rows = conn.execute(
            """
            SELECT
                id,
                callsign,
                contour,
                role,
                package_path,
                status,
                current_phase,
                current_step_title,
                next_allowed_action,
                notes,
                created_at,
                updated_at
            FROM entities
            ORDER BY callsign COLLATE NOCASE ASC
            """
        ).fetchall()
    return [dict(row) for row in rows]


def get_entity_state(
    db: Database,
    *,
    entity_id: int | None = None,
    callsign: str | None = None,
) -> dict[str, Any] | None:
    if entity_id is None and callsign is None:
        raise ValueError("Either entity_id or callsign must be provided")

    query = """
        SELECT
            id,
            callsign,
            contour,
            role,
            package_path,
            status,
            current_phase,
            current_step_title,
            next_allowed_action,
            notes,
            created_at,
            updated_at
        FROM entities
        WHERE {where_clause}
    """

    with db.connect() as conn:
        if entity_id is not None:
            row = conn.execute(
                query.format(where_clause="id = ?"),
                (entity_id,),
            ).fetchone()
        else:
            row = conn.execute(
                query.format(where_clause="callsign = ?"),
                (callsign,),
            ).fetchone()

    return None if row is None else dict(row)


def render_entities_list(items: list[dict[str, Any]]) -> str:
    lines: list[str] = []
    lines.append("Entities registry")
    lines.append(f"  total: {len(items)}")
    lines.append("")
    if not items:
        lines.append("No entities registered.")
        return "\n".join(lines)

    for item in items:
        lines.append(f"[{item['id']}] {item['callsign']}")
        lines.append(f"  contour: {item['contour']}")
        lines.append(f"  role: {item['role']}")
        lines.append(f"  package_path: {item['package_path']}")
        lines.append(f"  status: {item['status']}")
        lines.append(f"  current_phase: {item['current_phase']}")
        lines.append(f"  current_step_title: {item.get('current_step_title') or ''}")
        lines.append(f"  next_allowed_action: {item.get('next_allowed_action') or ''}")
        notes = item.get("notes") or ""
        if notes:
            lines.append(f"  notes: {notes}")
        lines.append("")
    return "\n".join(lines).rstrip() + "\n"


def render_entity_state(item: dict[str, Any]) -> str:
    lines: list[str] = []
    lines.append("Entity state")
    lines.append(f"  id: {item['id']}")
    lines.append(f"  callsign: {item['callsign']}")
    lines.append(f"  contour: {item['contour']}")
    lines.append(f"  role: {item['role']}")
    lines.append(f"  package_path: {item['package_path']}")
    lines.append(f"  status: {item['status']}")
    lines.append(f"  current_phase: {item['current_phase']}")
    lines.append(f"  current_step_title: {item.get('current_step_title') or ''}")
    lines.append(f"  next_allowed_action: {item.get('next_allowed_action') or ''}")
    lines.append(f"  notes: {item.get('notes') or ''}")
    lines.append(f"  created_at: {item.get('created_at') or ''}")
    lines.append(f"  updated_at: {item.get('updated_at') or ''}")
    return "\n".join(lines) + "\n"
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

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
    marker = "from .indexer import Indexer\n"
    if marker not in text:
        raise SystemExit("Import anchor not found in cli.py")
    text = text.replace(marker, marker + import_block, 1)

parser_block = """
    register_entity_cmd = subparsers.add_parser(
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
    show_entity_group = show_entity_state_cmd.add_mutually_exclusive_group(required=True)
    show_entity_group.add_argument("--callsign", help="Entity callsign")
    show_entity_group.add_argument("--id", dest="entity_id", type=int, help="Entity id")
"""

if '"register-entity"' not in text:
    anchor = "\n    return parser\n"
    if anchor not in text:
        raise SystemExit("Parser return anchor not found in cli.py")
    text = text.replace(anchor, "\n" + parser_block + "    return parser\n", 1)

dispatch_anchor = '    raise ValueError(f"Unknown command: {args.command}")'
dispatch_block = """    if args.command == "register-entity":
        return cmd_register_entity(args)
    if args.command == "list-entities":
        return cmd_list_entities(args)
    if args.command == "show-entity-state":
        return cmd_show_entity_state(args)

    raise ValueError(f"Unknown command: {args.command}")"""

if 'if args.command == "register-entity":' not in text:
    if dispatch_anchor not in text:
        raise SystemExit("Dispatch anchor not found in cli.py")
    text = text.replace(dispatch_anchor, dispatch_block, 1)

handlers_block = """

def cmd_register_entity(args) -> int:
    config = load_config(args.config_path)
    db = Database(config.database_path)
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
    config = load_config(args.config_path)
    db = Database(config.database_path)
    db.init_schema()
    ensure_entities_table(db)
    items = list_entities(db)
    print(render_entities_list(items), end="")
    return 0


def cmd_show_entity_state(args) -> int:
    config = load_config(args.config_path)
    db = Database(config.database_path)
    db.init_schema()
    ensure_entities_table(db)
    item = get_entity_state(
        db,
        entity_id=getattr(args, "entity_id", None),
        callsign=getattr(args, "callsign", None),
    )
    if item is None:
        print("Entity not found")
        return 1
    print(render_entity_state(item), end="")
    return 0
"""

if "def cmd_register_entity(args) -> int:" not in text:
    text = text.rstrip() + "\n" + handlers_block + "\n"

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Patched:"
echo "$ENTITY_MODULE"
echo "$CLI_FILE"
echo "Backup:"
echo "$BACKUP_DIR/cli.py.$STAMP.bak"
