from __future__ import annotations

from typing import Any

from .db import Database
from .entities_registry import ensure_entities_table, get_entity_state
from .steps_registry import (
    ensure_steps_table,
    get_active_step,
    get_last_confirmed_step,
    list_recent_artifacts,
)


def build_service_query_payload(
    db: Database,
    *,
    query_type: str,
    callsign: str | None = None,
    entity_id: int | None = None,
    limit: int = 10,
) -> tuple[dict[str, Any], int]:
    db.init_schema()
    ensure_entities_table(db)
    ensure_steps_table(db)

    entity = get_entity_state(
        db,
        entity_id=entity_id,
        callsign=callsign,
    )
    if entity is None:
        payload = {
            "ok": False,
            "query_type": query_type,
            "error": "entity_not_found",
            "callsign": callsign,
            "entity_id": entity_id,
        }
        return payload, 1

    real_entity_id = int(entity["id"])
    active_step = get_active_step(db, entity_id=real_entity_id)
    last_confirmed_step = get_last_confirmed_step(db, entity_id=real_entity_id)

    if active_step is not None:
        operational_state_text = "active step present"
    elif last_confirmed_step is not None:
        operational_state_text = "idle with confirmed history"
    else:
        operational_state_text = "no active step"

    if query_type == "active-step":
        data: dict[str, Any] = {
            "active_step": active_step,
        }
    elif query_type == "entity-summary":
        data = {
            "active_step": active_step,
            "last_confirmed_step": last_confirmed_step,
            "operational_state_text": operational_state_text,
        }
    elif query_type == "recent-artifacts":
        items = list_recent_artifacts(
            db,
            entity_id=real_entity_id,
            limit=limit,
        )
        data = {
            "items": items,
            "count": len(items),
        }
    else:
        payload = {
            "ok": False,
            "query_type": query_type,
            "error": "unsupported_query_type",
        }
        return payload, 2

    payload = {
        "ok": True,
        "query_type": query_type,
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
    return payload, 0
