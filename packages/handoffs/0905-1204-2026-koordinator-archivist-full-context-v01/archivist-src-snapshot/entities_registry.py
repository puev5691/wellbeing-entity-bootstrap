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

    sql = """
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
            row = conn.execute(sql.format(where_clause="id = ?"), (entity_id,)).fetchone()
        else:
            row = conn.execute(sql.format(where_clause="callsign = ?"), (callsign,)).fetchone()

    return None if row is None else dict(row)


def render_entities_list(items: list[dict[str, Any]]) -> str:
    lines: list[str] = []
    lines.append("Entities registry")
    lines.append(f"  total: {len(items)}")
    lines.append("")
    if not items:
        lines.append("No entities registered.")
        return "\n".join(lines) + "\n"

    for item in items:
        lines.append(f"[{item['id']}] {item['callsign']}")
        lines.append(f"  contour: {item['contour']}")
        lines.append(f"  role: {item['role']}")
        lines.append(f"  package_path: {item['package_path']}")
        lines.append(f"  status: {item['status']}")
        lines.append(f"  current_phase: {item['current_phase']}")
        lines.append(f"  current_step_title: {item.get('current_step_title') or ''}")
        lines.append(f"  next_allowed_action: {item.get('next_allowed_action') or ''}")
        if item.get("notes"):
            lines.append(f"  notes: {item['notes']}")
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

def render_entity_summary(
    entity: dict[str, Any] | None,
    *,
    active_step: dict[str, Any] | None = None,
    last_confirmed_step: dict[str, Any] | None = None,
) -> str:
    lines: list[str] = []
    lines.append("Entity summary")

    if entity is None:
        lines.append("  state: entity not found")
        return "\n".join(lines) + "\n"

    if active_step is not None:
        operational_state_text = "active step present"
    elif last_confirmed_step is not None:
        operational_state_text = "idle with confirmed history"
    else:
        operational_state_text = "no active step"

    lines.append("  registration:")
    lines.append(f"    id: {entity.get('id')}")
    lines.append(f"    callsign: {entity.get('callsign') or ''}")
    lines.append(f"    contour: {entity.get('contour') or ''}")
    lines.append(f"    role: {entity.get('role') or ''}")
    lines.append(f"    package_path: {entity.get('package_path') or ''}")
    lines.append(f"    status: {entity.get('status') or ''}")
    lines.append(f"    current_phase: {entity.get('current_phase') or ''}")
    lines.append(f"    current_step_title: {entity.get('current_step_title') or ''}")
    lines.append(f"    next_allowed_action: {entity.get('next_allowed_action') or ''}")
    if entity.get("notes"):
        lines.append(f"    notes: {entity['notes']}")
    lines.append(f"    created_at: {entity.get('created_at') or ''}")
    lines.append(f"    updated_at: {entity.get('updated_at') or ''}")

    lines.append("  operational:")
    lines.append(f"    operational_state_text: {operational_state_text}")

    if active_step is None:
        lines.append("    active_step: none")
    else:
        lines.append("    active_step:")
        lines.append(f"      id: {active_step.get('id')}")
        lines.append(f"      title: {active_step.get('title') or ''}")
        lines.append(f"      phase: {active_step.get('phase') or ''}")
        lines.append(f"      operation_type: {active_step.get('operation_type') or ''}")
        lines.append(f"      target_path: {active_step.get('target_path') or ''}")
        lines.append(f"      state: {active_step.get('state') or ''}")

    if last_confirmed_step is None:
        lines.append("    last_confirmed_step: none")
    else:
        lines.append("    last_confirmed_step:")
        lines.append(f"      id: {last_confirmed_step.get('id')}")
        lines.append(f"      title: {last_confirmed_step.get('title') or ''}")
        lines.append(f"      phase: {last_confirmed_step.get('phase') or ''}")
        lines.append(f"      operation_type: {last_confirmed_step.get('operation_type') or ''}")
        lines.append(f"      target_path: {last_confirmed_step.get('target_path') or ''}")
        lines.append(f"      confirmed_at: {last_confirmed_step.get('confirmed_at') or ''}")

    return "\n".join(lines) + "\n"

