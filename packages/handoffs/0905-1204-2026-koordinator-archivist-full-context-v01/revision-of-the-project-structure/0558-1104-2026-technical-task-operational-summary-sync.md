# Техническое задание: синхронизация оперативной сводки Сущности

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на синхронизацию краткой сводки Сущности с фактическим состоянием шагов и результатов

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0548-1104-2026-cycle-open-operational-summary-sync.md
- 0538-1104-2026-list-recent-artifacts-success-log.md

## 1. Проблема

Текущая команда `show-entity-summary` работает корректно, но содержит смешение двух слоёв:

- регистрационные поля Сущности;
- фактическое оперативное состояние.

Из-за этого поля `current_step_title` и `next_allowed_action` могут выглядеть как актуальные, хотя фактический активный шаг уже закрыт или состояние уже изменилось.

## 2. Требуемый результат

Нужно сделать так, чтобы сводка Сущности различала:

### 2.1. Регистрационный слой
- callsign
- contour
- role
- package_path
- status
- created_at
- updated_at

### 2.2. Оперативный слой
- active_step или его отсутствие
- last_confirmed_step
- last_confirmed_target_path
- last_confirmed_at
- operational_state_text

## 3. Минимально допустимая реализация

На текущем этапе допускается:

- не менять структуру таблицы `entities`;
- вычислять оперативную часть сводки на лету через `steps`;
- выводить регистрационные поля отдельно от оперативного блока.

## 4. Чего не требуется

На этом этапе не требуется:

- автоматическая перезапись полей `entities` при каждом шаге;
- новый глобальный механизм синхронизации;
- отдельная витрина состояния для всех Сущностей;
- HTTP API.

## 5. Критерий успеха

После реализации оператор должен видеть в `show-entity-summary`:

- кто такая Сущность;
- есть ли у неё активный шаг;
- какой у неё последний подтверждённый результат;
- как это кратко интерпретируется в виде оперативного состояния.
