# MVP-план: bootstrap summary bridge

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём первого моста между Архивариусом и bootstrap repository

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1068-1104-2026-technical-task-bootstrap-summary-bridge.md

## MVP цикла

1. Перечислять bootstrap packages из `packages/core`.
2. Показывать summary одного package directory.
3. Различать наличие обязательных файлов.
4. Показывать базовые поля header без тяжёлой универсальной валидации.

## Критерий завершения

MVP считается завершённым, если Архивариус показывает summary для пакета Редактора и корректно видит базовое ядро пакетов.
