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
        return "\n".join(lines) + "\n"

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
    return "\n".join(lines) + "\n"

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


def render_confirmed_steps_list(items: list[dict[str, Any]]) -> str:
    lines: list[str] = []
    lines.append("Confirmed steps")
    lines.append(f"  total: {len(items)}")
    lines.append("")
    if not items:
        lines.append("No confirmed steps found.")
        return "\n".join(lines) + "\n"

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
    return "\n".join(lines).rstrip() + "\n"

def list_recent_artifacts(
    db: Database,
    *,
    callsign: str | None = None,
    entity_id: int | None = None,
    limit: int = 10,
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
            s.confirmed_at,
            s.success_evidence,
            s.notes
        FROM steps s
        JOIN entities e ON e.id = s.entity_id
        {where_sql}
        ORDER BY
            CASE WHEN s.confirmed_at IS NULL THEN 1 ELSE 0 END,
            s.confirmed_at DESC,
            s.id DESC
        LIMIT ?
    """

    with db.connect() as conn:
        rows = conn.execute(sql, tuple(params + [limit])).fetchall()
    return [dict(row) for row in rows]


def render_recent_artifacts_list(items: list[dict[str, Any]]) -> str:
    lines: list[str] = []
    lines.append("Recent artifacts")
    lines.append(f"  total: {len(items)}")
    lines.append("")

    if not items:
        lines.append("No recent artifacts found.")
        return "\n".join(lines) + "\n"

    for item in items:
        lines.append(f"[{item['id']}] {item['callsign']}")
        lines.append(f"  title: {item['title']}")
        lines.append(f"  phase: {item['phase']}")
        lines.append(f"  operation_type: {item['operation_type']}")
        lines.append(f"  target_path: {item['target_path']}")
        lines.append(f"  confirmed_at: {item.get('confirmed_at') or ''}")
        if item.get("success_evidence"):
            lines.append(f"  success_evidence: {item['success_evidence']}")
        if item.get("notes"):
            lines.append(f"  notes: {item['notes']}")
        lines.append("")

    return "\n".join(lines).rstrip() + "\n"

def get_last_confirmed_step(
    db: Database,
    *,
    callsign: str | None = None,
    entity_id: int | None = None,
) -> dict[str, Any] | None:
    where_clauses: list[str] = ["s.state = ?"]
    params: list[Any] = [STEP_STATE_CONFIRMED]

    if callsign is not None:
        where_clauses.append("e.callsign = ?")
        params.append(callsign)
    if entity_id is not None:
        where_clauses.append("s.entity_id = ?")
        params.append(entity_id)

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
        ORDER BY
            CASE WHEN s.confirmed_at IS NULL THEN 1 ELSE 0 END,
            s.confirmed_at DESC,
            s.id DESC
        LIMIT 1
    """

    with db.connect() as conn:
        row = conn.execute(sql, tuple(params)).fetchone()
    return None if row is None else dict(row)

