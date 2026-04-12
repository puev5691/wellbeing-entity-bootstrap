# Пакет задач: синхронизация оперативной сводки Сущности

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать минимальный рабочий пакет задач следующего цикла развития Архивариуса

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0558-1104-2026-technical-task-operational-summary-sync.md
- 0568-1104-2026-mvp-plan-operational-summary-sync.md

## Задача 1
Добавить функцию получения последнего подтверждённого шага по Сущности.

## Задача 2
Добавить вычисление краткого оперативного статуса Сущности.

## Задача 3
Обновить `show-entity-summary`, чтобы он показывал:
- регистрационный блок;
- оперативный блок;
- последний подтверждённый результат.

## Задача 4
Проверить обновлённую команду на:
- Координаторе
- Следопыте
- Редакторе

## Критерий завершения

Цикл считается завершённым, если `show-entity-summary` перестаёт быть полупаспортом-полуисторией и становится честной оперативной сводкой.
