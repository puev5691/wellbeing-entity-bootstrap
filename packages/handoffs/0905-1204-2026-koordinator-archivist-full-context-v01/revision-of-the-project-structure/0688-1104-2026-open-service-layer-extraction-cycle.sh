#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
CLI_FILE="$REPO/src/archivist/cli.py"
SERVICE_FILE="$REPO/src/archivist/service_layer.py"
BACKUP_DIR="$REPO/.wb-backups-query-layer"

mkdir -p "$DOC_DIR" "$BACKUP_DIR"

for f in "$CLI_FILE"; do
  if [ ! -f "$f" ]; then
    echo "Required file not found: $f" >&2
    exit 1
  fi
done

PYBIN=""
if command -v python3 >/dev/null 2>&1; then
  PYBIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYBIN="python"
else
  echo "Neither python3 nor python is available." >&2
  exit 127
fi

cat > "$DOC_DIR/0688-1104-2026-cycle-open-service-layer-extraction.md" <<'MD_EOF'
# Открытие цикла: вынос service-layer из cli.py

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл выноса локального сервисного слоя Архивариуса из cli.py в отдельный модуль

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0658-1104-2026-local-service-entry-success-log.md
- 0678-1104-2026-json-contract-normalization-success-log.md

## Основная мысль цикла

Локальный сервисный вход уже работает и отдаёт нормализованный JSON. Следующий шаг состоит в том, чтобы перестать держать сервисную логику внутри cli.py и вынести её в отдельный модуль.

## Цель цикла

Сделать cli.py тонкой оболочкой, а сборку service-query payload перенести в отдельный service-layer модуль.

## Критерий успеха

Цикл считается завершённым, если:
- service-query продолжает работать;
- логика его payload вынесена из cli.py;
- в репозитории появляется отдельный модуль service-layer.
MD_EOF

cat > "$DOC_DIR/0698-1104-2026-technical-task-service-layer-extraction.md" <<'MD_EOF'
# Техническое задание: вынос service-layer из cli.py

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на вынос логики service-query в отдельный локальный модуль

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0688-1104-2026-cycle-open-service-layer-extraction.md
- 0618-1104-2026-technical-task-local-service-layer.md

## Требуется

1. Создать отдельный модуль `service_layer.py`.
2. Перенести в него сборку payload для:
   - `active-step`
   - `entity-summary`
   - `recent-artifacts`
3. Оставить в cli.py только:
   - разбор аргументов;
   - вызов сервисной функции;
   - печать JSON.

## Ограничения

На этом этапе не требуется:
- HTTP
- отдельный демон
- фоновый процесс
- внешний протокол
- новые типы запросов

## Критерий успеха

После выноса:
- `service-query` продолжает работать;
- JSON-контракт не ломается;
- сервисная логика отделена от argparse-слоя.
MD_EOF

cat > "$DOC_DIR/0708-1104-2026-mvp-plan-service-layer-extraction.md" <<'MD_EOF'
# MVP-план: вынос service-layer из cli.py

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём цикла выноса service-layer

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0698-1104-2026-technical-task-service-layer-extraction.md

## MVP цикла

1. Создать `src/archivist/service_layer.py`.
2. Реализовать в нём функцию построения payload.
3. Переключить `cmd_service_query` на новый модуль.
4. Проверить на `Редакторе`.

## Критерий завершения

MVP считается завершённым, если `service-query entity-summary --callsign Редактор` даёт корректный JSON уже через новый модуль.
MD_EOF

cat > "$DOC_DIR/0718-1104-2026-task-package-service-layer-extraction.md" <<'MD_EOF'
# Пакет задач: вынос service-layer из cli.py

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать минимальный пакет задач цикла выноса локального сервисного слоя

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0708-1104-2026-mvp-plan-service-layer-extraction.md

## Задача 1
Создать модуль `service_layer.py`.

## Задача 2
Перенести сборку JSON-payload в сервисную функцию.

## Задача 3
Сделать cli.py тонкой оболочкой.

## Задача 4
Проверить результат на `Редакторе`.
MD_EOF

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$CLI_FILE" "$BACKUP_DIR/cli.py.$STAMP.bak"

cat > "$SERVICE_FILE" <<'PY_EOF'
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
PY_EOF

"$PYBIN" - "$CLI_FILE" <<'PY_EOF'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

if "from .service_layer import build_service_query_payload" not in text:
    anchor = "from .repo_start_context import build_repo_start_context, render_repo_start_context, default_repo_start_context_output_path\n"
    if anchor not in text:
        raise SystemExit("Import anchor not found in cli.py")
    text = text.replace(
        anchor,
        anchor + "from .service_layer import build_service_query_payload\n",
        1,
    )

old_block = """def cmd_service_query(args) -> int:
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
    active_step = get_active_step(db, entity_id=entity_id)
    last_confirmed_step = get_last_confirmed_step(db, entity_id=entity_id)

    if active_step is not None:
        operational_state_text = "active step present"
    elif last_confirmed_step is not None:
        operational_state_text = "idle with confirmed history"
    else:
        operational_state_text = "no active step"

    if args.query_type == "active-step":
        data = {
            "active_step": active_step,
        }
    elif args.query_type == "entity-summary":
        data = {
            "active_step": active_step,
            "last_confirmed_step": last_confirmed_step,
            "operational_state_text": operational_state_text,
        }
    elif args.query_type == "recent-artifacts":
        items = list_recent_artifacts(
            db,
            entity_id=entity_id,
            limit=getattr(args, "limit", 10),
        )
        data = {
            "items": items,
            "count": len(items),
        }
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
"""

new_block = """def cmd_service_query(args) -> int:
    db = _db_from_args(args)
    payload, exit_code = build_service_query_payload(
        db,
        query_type=args.query_type,
        callsign=getattr(args, "callsign", None),
        entity_id=getattr(args, "entity_id", None),
        limit=getattr(args, "limit", 10),
    )
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return exit_code
"""

if old_block not in text:
    raise SystemExit("cmd_service_query block not found in cli.py")
text = text.replace(old_block, new_block, 1)

path.write_text(text, encoding="utf-8")
PY_EOF

echo "Created docs:"
echo "  $DOC_DIR/0688-1104-2026-cycle-open-service-layer-extraction.md"
echo "  $DOC_DIR/0698-1104-2026-technical-task-service-layer-extraction.md"
echo "  $DOC_DIR/0708-1104-2026-mvp-plan-service-layer-extraction.md"
echo "  $DOC_DIR/0718-1104-2026-task-package-service-layer-extraction.md"
echo
echo "Patched repo files:"
echo "  $SERVICE_FILE"
echo "  $CLI_FILE"
echo
echo "Backup:"
echo "  $BACKUP_DIR/cli.py.$STAMP.bak"
