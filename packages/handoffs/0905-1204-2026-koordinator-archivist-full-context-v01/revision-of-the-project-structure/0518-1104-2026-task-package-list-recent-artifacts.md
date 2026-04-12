# Пакет задач: реализация list-recent-artifacts

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
- 0508-1104-2026-technical-task-list-recent-artifacts.md

## Задача 1
Добавить функцию выборки последних подтверждённых артефактов из confirmed steps.

## Задача 2
Добавить render-функцию компактного списка артефактов.

## Задача 3
Добавить CLI-команду `list-recent-artifacts`.

## Задача 4
Проверить команду на:
- Координаторе
- Следопыте
- Редакторе

## Критерий завершения

Цикл считается завершённым, если `list-recent-artifacts` корректно показывает файловые результаты хотя бы для Редактора и не ломает текущий query-layer.
