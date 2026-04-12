# Пакет задач первого спринта: слой запросов Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать стартовый пакет задач следующей инженерной фазы развития Архивариуса

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0398-1104-2026-technical-task-archivist-query-layer.md
- 0408-1104-2026-mvp-plan-archivist-query-layer.md

## Задача 1
Реализовать команду `show-active-step`.

## Задача 2
Реализовать команду `show-entity-summary`.

## Задача 3
Реализовать команду `list-confirmed-steps`.

## Задача 4
Проверить команды на:
- Координаторе
- Следопыте
- Редакторе

## Задача 5
Подготовить выводы для следующего шага:
нужен ли отдельный реестр артефактов до начала реализации сервисного API.

## Критерий завершения спринта

Спринт считается завершённым, если Архивариус может быстро и однозначно показать:
- активный шаг по Сущности;
- краткое состояние Сущности;
- подтверждённые шаги по Сущности.
