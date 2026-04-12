# Задача для Архивариуса-Трезвенника: цикл 1, реестр Сущностей

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать точную инженерную задачу для первого цикла развития Архивариуса-Трезвенника

artifact_type: task
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0268-1104-2026-cycle-1-entities-registry-plan.md
- 0218-1104-2026-technical-task-archivist-trezvennik-v02.md

## Задача

Реализовать минимальный реестр Сущностей в репозитории Архивариуса.

## Требуется

### 1. Схема базы
Добавить таблицу `entities` с полями:
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

### 2. CLI
Добавить команды:
- `register-entity`
- `list-entities`
- `show-entity-state`

### 3. Первичная проверка
Проверить работу на трёх сущностях:
- Координатор
- Следопыт
- Редактор

## Ограничения

- не реализовывать шаги и артефакты в этом цикле;
- не трогать то, что не требуется для реестра сущностей;
- не плодить новые команды сверх нужного минимума;
- не ломать уже существующий CLI.

## Критерий успеха

После цикла можно:
- зарегистрировать сущность;
- увидеть список сущностей;
- увидеть состояние одной сущности по callsign или id.
