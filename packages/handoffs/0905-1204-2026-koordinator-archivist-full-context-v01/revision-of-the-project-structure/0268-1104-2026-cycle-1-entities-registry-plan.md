# План инженерного цикла 1: реестр Сущностей Архивариуса-Трезвенника

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать первый инженерный цикл разработки Архивариуса-Трезвенника, направленный на создание реестра Сущностей

artifact_type: plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0218-1104-2026-technical-task-archivist-trezvennik-v02.md
- 0228-1104-2026-mvp-definition-archivist-trezvennik-v02.md
- 0258-1104-2026-first-sprint-task-package-archivist-trezvennik.md

## Цель цикла

Создать минимальный рабочий реестр Сущностей как первый слой нервной системы дерева Сущностей.

## Что должно появиться после цикла

- таблица `entities` в базе Архивариуса;
- CLI-команда `register-entity`;
- CLI-команда `list-entities`;
- CLI-команда `show-entity-state`;

## Какие Сущности используются для первичной проверки

- Координатор
- Следопыт
- Редактор

## Поля сущности для первой версии

- id
- callsign
- contour
- role
- package_path
- status
- current_phase
- current_step_title
- next_allowed_action
- notes

## Ограничение цикла

На этом цикле не реализуются:
- шаги;
- артефакты;
- handoff;
- автоматическая интеграция с чатами.

## Критерий завершения

Цикл считается завершённым, если:
1. можно зарегистрировать три сущности;
2. можно вывести их список;
3. можно посмотреть состояние каждой сущности по отдельности.
