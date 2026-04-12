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
