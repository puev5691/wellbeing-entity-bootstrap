# Техническое задание: bootstrap service-query bridge

Дата: 2026-04-12
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на добавление service-query для bootstrap packages

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1108-1204-2026-cycle-open-bootstrap-service-query.md

## Требуется

Добавить в service-query два query type:

- bootstrap-packages
- bootstrap-package-summary

## Критерий успеха

Архивариус должен уметь возвращать JSON:
- со списком bootstrap packages
- со сводкой по одному bootstrap package
