# Задача для Архивариуса-Трезвенника: Цикл 2, реестр шагов и фазовый барьер

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать точную инженерную задачу второго цикла развития Архивариуса-Трезвенника

artifact_type: task
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0338-1104-2026-cycle-2-plan-step-registry-and-phase-barrier.md
- 0218-1104-2026-technical-task-archivist-trezvennik-v02.md
- 0178-1104-2026-phase-confirmation-protocol.md

## Задача

Реализовать минимальный реестр шагов и фазовый барьер в репозитории Архивариуса.

## Требуется

### 1. Схема базы
Добавить таблицу `steps` с минимальными полями:
- id
- entity_id
- title
- phase
- operation_type
- target_path
- state
- issued_at
- executed_at
- confirmed_at
- success_evidence
- notes

### 2. CLI
Добавить команды:
- `issue-step`
- `mark-step-executed`
- `confirm-step-artifact`
- `list-steps`

### 3. Правило фазового барьера
Следующий шаг по одной Сущности не должен считаться допустимым, если предыдущий активный шаг не доведён до `artifact_confirmed`.

### 4. Первичная проверка
Проверить цикл на Редакторе через реальный шаг создания файла плана стабилизации медиаконтура.

## Ограничения

- не реализовывать пока реестр артефактов как отдельную таблицу;
- не переходить к handoff;
- не городить графический интерфейс;
- не автоматизировать чаты;
- не ломать уже работающий реестр Сущностей.

## Критерий успеха

После цикла Архивариус должен уметь:
- выдать шаг;
- отметить его исполненным;
- подтвердить результат;
- показать список шагов по Сущности;
- различать незавершённый шаг и подтверждённый результат.
