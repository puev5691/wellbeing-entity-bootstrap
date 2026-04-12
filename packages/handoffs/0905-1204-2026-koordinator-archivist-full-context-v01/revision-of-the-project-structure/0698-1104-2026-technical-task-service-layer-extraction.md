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
