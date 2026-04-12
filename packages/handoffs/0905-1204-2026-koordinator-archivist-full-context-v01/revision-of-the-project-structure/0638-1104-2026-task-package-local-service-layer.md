# Пакет задач: локальный сервисный слой Архивариуса

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
- 0618-1104-2026-technical-task-local-service-layer.md
- 0628-1104-2026-mvp-plan-local-service-layer.md

## Задача 1
Выбрать первый минимальный формат сервисного слоя:
служебная JSON-команда внутри CLI или локальный HTTP-вход.

## Задача 2
Реализовать единый формализованный вход.

## Задача 3
Подключить к нему:
- active step
- entity summary
- recent artifacts

## Задача 4
Проверить работу на `Редакторе`.

## Критерий завершения

Цикл считается завершённым, если Архивариус способен по одному служебному входу возвращать JSON-структуру по ключевым запросам без ручного разбора человеком.
