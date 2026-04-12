# MVP-план: слой запросов Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём следующего инженерного шага по развитию Архивариуса

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0398-1104-2026-technical-task-archivist-query-layer.md
- 0388-1104-2026-archivist-service-layer-concept.md

## MVP следующего шага

Минимально достаточный объём:

1. `show-active-step`
2. `show-entity-summary`
3. `list-confirmed-steps`

## Почему именно так

Потому что именно эти три функции уже сейчас закрывают главную боль оператора:
непонятно, чей шаг активен, что уже подтверждено и в каком состоянии Сущность.

## Что откладывается

Откладывается:
- отдельный реестр артефактов;
- HTTP API;
- MCP;
- автоматическая маршрутизация между Сущностями;
- удалённые вызовы.

## Критерий завершения MVP

MVP считается завершённым, если оператор по одной команде может понять:
- у кого сейчас активный шаг;
- что это за шаг;
- какие подтверждённые шаги уже имеются у выбранной Сущности.
