# План инженерного Цикла 2: реестр шагов и фазовый барьер

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать второй инженерный цикл развития Архивариуса-Трезвенника, связанный с шагами, их состояниями и фазовым барьером

artifact_type: plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0328-1104-2026-cycle-1-success-log-entities-registry.md
- 0218-1104-2026-technical-task-archivist-trezvennik-v02.md
- 0228-1104-2026-mvp-definition-archivist-trezvennik-v02.md
- 0238-1104-2026-roadmap-next-cycles-archivist-trezvennik.md

## Цель цикла

Создать минимальный реестр шагов и ввести фазовый барьер между состояниями работы, чтобы Архивариус различал:

- скрипт выдан;
- скрипт исполнен;
- артефакт подтверждён.

## Что должно появиться после цикла

- таблица `steps`;
- CLI-команда создания шага;
- CLI-команда перевода шага в `script_executed`;
- CLI-команда перевода шага в `artifact_confirmed`;
- CLI-команда просмотра шагов по Сущности;
- запрет логического перехода к следующему шагу без подтверждения предыдущего.

## Обязательные состояния шага

- `script_issued`
- `script_executed`
- `artifact_confirmed`

## На каком примере проверяется цикл

Проверка должна идти на реальном маршруте Редактора.

Минимальный пример:
- шаг создания файла `0120-1104-2026-media-contour-minimum-stabilization-plan.md`
- перевод шага в `script_issued`
- перевод в `script_executed`
- перевод в `artifact_confirmed`

## Критерий завершения цикла

Цикл считается завершённым, если Архивариус может провести хотя бы один реальный шаг дочерней Сущности через все три состояния и не позволить логически считать его завершённым раньше подтверждения.
