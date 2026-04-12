#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0548-1104-2026-cycle-open-operational-summary-sync.md" <<'MD_EOF'
# Открытие цикла: синхронизация оперативной сводки Сущности

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть следующий инженерный цикл развития Архивариуса, связанный с честной оперативной сводкой Сущности

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0488-1104-2026-query-layer-mvp-success-log.md
- 0538-1104-2026-list-recent-artifacts-success-log.md
- 0398-1104-2026-technical-task-archivist-query-layer.md

## Основная мысль цикла

После появления `show-active-step`, `show-entity-summary`, `list-confirmed-steps` и `list-recent-artifacts` обнаружилось, что краткая сводка по Сущности уже полезна, но ещё не полностью честна.

Проблема в том, что часть полей Сущности отражает регистрационное или историческое состояние, а не текущую оперативную картину.

## Цель цикла

Сделать так, чтобы краткая сводка Сущности различала:

- регистрационные данные Сущности;
- фактический активный шаг;
- последний подтверждённый результат;
- текущее оперативное состояние.

## Практический эффект

После завершения цикла оператор должен видеть в одной сводке не только паспорт Сущности, но и её реальное текущее положение в рабочем процессе.

## Ограничение цикла

На этом этапе не требуется:

- отдельный сервисный API;
- отдельная таблица артефактов;
- автоматическая маршрутизация между Сущностями;
- перепроектирование всего query-layer.

## Критерий успеха

Цикл считается завершённым, если `show-entity-summary` показывает не только зарегистрированные поля, но и честную оперативную проекцию состояния.
MD_EOF

cat > "$DOC_DIR/0558-1104-2026-technical-task-operational-summary-sync.md" <<'MD_EOF'
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
MD_EOF

cat > "$DOC_DIR/0568-1104-2026-mvp-plan-operational-summary-sync.md" <<'MD_EOF'
# MVP-план: синхронизация оперативной сводки Сущности

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём следующего инженерного шага по честной оперативной сводке Сущности

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0558-1104-2026-technical-task-operational-summary-sync.md

## MVP следующего шага

Минимально достаточный объём:

1. В `show-entity-summary` отделить регистрационные поля от оперативного блока.
2. Добавить в summary:
   - последний подтверждённый шаг
   - последний подтверждённый `target_path`
   - дату последнего подтверждения
3. Добавить короткое поле интерпретации:
   - `no active step`
   - `active step present`
   - `idle with confirmed history`
   - или функционально равный вариант

## Почему именно так

Потому что сейчас главный источник потенциальной путаницы не отсутствие ещё одной команды, а смешение исторических и оперативных данных в одной сводке.

## Что откладывается

Откладывается:

- отдельный реестр артефактов;
- автоматическая запись вычисленного состояния обратно в `entities`;
- отдельная команда глобальной сводки по всем Сущностям;
- сервисный API.

## Критерий завершения MVP

MVP считается завершённым, если `show-entity-summary` по `Координатору`, `Следопыту` и `Редактору` показывает честную и краткую оперативную картину без необходимости вручную сверяться с `list-steps`.
MD_EOF

cat > "$DOC_DIR/0578-1104-2026-task-package-operational-summary-sync.md" <<'MD_EOF'
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
MD_EOF

echo "Created:"
echo "$DOC_DIR/0548-1104-2026-cycle-open-operational-summary-sync.md"
echo "$DOC_DIR/0558-1104-2026-technical-task-operational-summary-sync.md"
echo "$DOC_DIR/0568-1104-2026-mvp-plan-operational-summary-sync.md"
echo "$DOC_DIR/0578-1104-2026-task-package-operational-summary-sync.md"
