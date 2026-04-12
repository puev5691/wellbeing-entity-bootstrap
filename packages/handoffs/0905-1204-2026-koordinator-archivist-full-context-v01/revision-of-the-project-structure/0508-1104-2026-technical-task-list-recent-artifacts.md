# Техническое задание: list-recent-artifacts

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать техническую задачу на реализацию команды показа последних подтверждённых артефактов

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0488-1104-2026-query-layer-mvp-success-log.md
- 0498-1104-2026-cycle-open-list-recent-artifacts.md

## 1. Требуемая команда

Добавить CLI-команду:

`list-recent-artifacts`

## 2. Минимальное поведение

Команда должна:

- принимать `--callsign` или `--entity-id`;
- показывать последние подтверждённые результаты по выбранной Сущности;
- использовать в качестве источника данные шагов со статусом `artifact_confirmed`;
- выводить как минимум:
  - id шага
  - callsign
  - title
  - target_path
  - confirmed_at

## 3. Допустимая упрощённая модель

На текущем этапе отдельный реестр артефактов не обязателен.

Допустимо считать артефактом:
`target_path` шага в состоянии `artifact_confirmed`.

## 4. Ограничения

На этом этапе не требуется:

- отдельная таблица `artifacts`;
- отдельная сущность handoff;
- автоматическое различение типов артефактов;
- фильтрация по временным окнам сложнее базовой сортировки по подтверждению.

## 5. Критерий успеха

После реализации оператор должен уметь по одной команде получить список последних подтверждённых файловых результатов для:
- Координатора
- Следопыта
- Редактора
