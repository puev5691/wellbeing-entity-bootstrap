# MVP-план: локальный сервисный слой Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём следующего инженерного шага по сервисному слою Архивариуса

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0618-1104-2026-technical-task-local-service-layer.md

## MVP следующего шага

Минимально достаточный объём:

1. Выбрать формат формализованного ответа: JSON.
2. Добавить один служебный вход для запросов к Архивариусу.
3. Поддержать не менее трёх типов запросов:
   - active step
   - entity summary
   - recent artifacts
4. Проверить работу на Сущности `Редактор`.

## Почему именно так

Потому что уже сейчас главная ценность не в расширении числа команд, а в переходе от ручного вызова к формализованному машинно-читаемому ответу.

## Что откладывается

Откладывается:

- confirmed steps через тот же вход
- HTTP-режим как отдельный процесс
- внешний доступ
- сложная маршрутизация между Сущностями
- интеграция с внешними протоколами

## Критерий завершения MVP

MVP считается завершённым, если Архивариус по единому формализованному входу умеет отдавать JSON-ответ для:
- active step
- entity summary
- recent artifacts
