#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0208-1104-2026-consensus-log-archivist-priority.md" <<'MD_EOF'
# Журнал фиксации консенсуса по приоритету Архивариуса-Трезвенника

Дата: 2026-04-11
Статус: journal_entry
Контур: revision-of-the-project-structure
Назначение: зафиксировать достигнутый консенсус о признании развития Архивариуса-Трезвенника главным приоритетом ближайшего этапа

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: coordination
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0148-1104-2026-root-coordinator-entity-concept.md
- 0178-1104-2026-phase-confirmation-protocol.md
- 0198-1104-2026-editor-control-block.md

## 1. Зафиксированное решение

На текущем этапе развития проекта Благополучие главным приоритетом признано развитие Архивариуса в сторону Архивариуса-Трезвенника как нервной системы дерева Сущностей.

## 2. Основание решения

Основанием стали следующие наблюдения:
- число специализированных Сущностей уже растёт;
- объём артефактов, журналов и регламентов увеличивается;
- ручная координация без диспетчерского слоя становится рискованной;
- уже возник инцидент с расхождением между логическим и фактическим состоянием файла;
- медиаконтур требует стабилизации;
- исследовательский контур уже приносит полезный материал, но не должен разрастаться бесконтрольно.

## 3. Что признано главным маршрутом

Главный маршрут ближайшего этапа:
- развитие Архивариуса в реестр Сущностей;
- развитие Архивариуса в реестр артефактов;
- развитие Архивариуса в реестр шагов и подтверждений;
- введение фазового барьера;
- подготовка handoff и преемственности.

## 4. Что не отменяется, но переводится в подчинённый режим

### Литературный и медиаконтур
Не замораживаются, но переводятся в управляемую форму через Редактора и подтверждённый внутренний цикл.

### Исследовательский контур
Не закрывается, но работает дозированно через Следопыта.

### Криптоплатформенный слой
Не отменяется, но переносится на следующий уровень после появления нормального учёта Сущностей, шагов и артефактов.

## 5. Итог

Консенсус достигнут:
приоритет ближайшего этапа — борьба с энтропией через развитие Архивариуса-Трезвенника как устойчивого диспетчерского слоя проекта.
MD_EOF

cat > "$DOC_DIR/0218-1104-2026-technical-task-archivist-trezvennik-v02.md" <<'MD_EOF'
# Техническое задание: Архивариус-Трезвенник v0.2

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать техническое задание на развитие Архивариуса до уровня диспетчерского слоя дерева Сущностей проекта Благополучие

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0208-1104-2026-consensus-log-archivist-priority.md
- 0178-1104-2026-phase-confirmation-protocol.md
- 0188-1104-2026-operator-task-envelope-template.md

## 1. Цель версии

Архивариус-Трезвенник v0.2 должен превратить Архивариуса из инструмента поиска и инвентаризации в минимальную нервную систему дерева Сущностей.

## 2. Обязательные сущности данных

### Entity
Минимальные поля:
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

### Artifact
Минимальные поля:
- id
- entity_id
- artifact_type
- path
- filename
- phase
- status
- created_at
- updated_at
- related_step_id
- notes

### Step
Минимальные поля:
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

### Handoff
Минимальные поля:
- id
- entity_id
- summary_path
- created_at
- scope
- notes

## 3. Обязательные состояния шага

Поддерживаемые состояния:
- script_issued
- script_executed
- artifact_confirmed

Следующая фаза не должна выдаваться, пока шаг не перешёл в artifact_confirmed.

## 4. Обязательные CLI-команды MVP

- register-entity
- list-entities
- show-entity-state
- register-artifact
- issue-next-step
- mark-step-executed
- confirm-artifact
- build-handoff-summary

## 5. Критерии приёмки

Версия считается пригодной, если позволяет:
1. зарегистрировать Координатора, Следопыта и Редактора;
2. фиксировать для каждой Сущности текущую фазу и следующий допустимый шаг;
3. различать script_issued, script_executed и artifact_confirmed;
4. не допускать выдачу следующего шага без artifact_confirmed;
5. собирать handoff summary по выбранной Сущности.
MD_EOF

cat > "$DOC_DIR/0228-1104-2026-mvp-definition-archivist-trezvennik-v02.md" <<'MD_EOF'
# Определение MVP: Архивариус-Трезвенник v0.2

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточную версию Архивариуса-Трезвенника, пригодную для практического сопровождения дерева Сущностей

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0218-1104-2026-technical-task-archivist-trezvennik-v02.md
- 0208-1104-2026-consensus-log-archivist-priority.md

## 1. MVP-цель

MVP должен быть достаточно трезвым, чтобы:
- учитывать Сущности;
- учитывать артефакты;
- учитывать шаги;
- не путать выданный скрипт с подтверждённым результатом;
- помогать оператору не терять ход работы.

## 2. Что входит в MVP

- реестр Сущностей;
- реестр артефактов;
- реестр шагов;
- состояния script_issued / script_executed / artifact_confirmed;
- краткие отчёты по состоянию Сущности;
- handoff summary.

## 3. Что сознательно не входит в MVP

- автоматическое общение с внешними чатами через API;
- графический интерфейс;
- блокчейн-фиксация шагов;
- автогенерация литературных текстов;
- полная оркестрация всех контуров без оператора.

## 4. Признак успеха MVP

Если оператор может в любой момент узнать:
- кто активен;
- какой следующий шаг допустим;
- что реально подтверждено;
- где лежит нужный артефакт,
то MVP удался.
MD_EOF

cat > "$DOC_DIR/0238-1104-2026-roadmap-next-cycles-archivist-trezvennik.md" <<'MD_EOF'
# Дорожная карта ближайших циклов: Архивариус-Трезвенник

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить ближайшие инженерные циклы развития Архивариуса-Трезвенника

artifact_type: roadmap
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0218-1104-2026-technical-task-archivist-trezvennik-v02.md
- 0228-1104-2026-mvp-definition-archivist-trezvennik-v02.md

## Цикл 1. Реестр Сущностей
Результат:
- сущности регистрируются и читаются из базы;
- можно показать состояние Координатора, Следопыта и Редактора.

## Цикл 2. Реестр шагов и фазовый барьер
Результат:
- шаги получают состояния script_issued, script_executed, artifact_confirmed;
- следующий шаг нельзя выдать без подтверждения предыдущего.

## Цикл 3. Реестр артефактов
Результат:
- артефакты привязываются к Сущности и шагу;
- можно увидеть подтверждённые результаты по любой Сущности.

## Цикл 4. Handoff summary
Результат:
- по Сущности строится краткая сводка состояния.

## Цикл 5. Подготовка к чат-мосту
Результат:
- Архивариус умеет формировать операторский конверт следующей задачи.

## Главный принцип

Каждый цикл должен уменьшать стоимость следующего шага и уменьшать зависимость проекта от памяти и бодрости оператора.
MD_EOF

cat > "$DOC_DIR/0248-1104-2026-operator-regulation-entity-tree-work.md" <<'MD_EOF'
# Регламент оператора по работе с деревом Сущностей

Дата: 2026-04-11
Статус: canonical
Контур: revision-of-the-project-structure
Назначение: зафиксировать минимальные правила работы оператора с несколькими Сущностями и фазами

artifact_type: regulation
entity_scope: revision-of-the-project-structure
phase: coordination
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0178-1104-2026-phase-confirmation-protocol.md
- 0188-1104-2026-operator-task-envelope-template.md
- 0198-1104-2026-editor-control-block.md

## 1. Основной принцип

Состояние шага считается реальным только после файлового подтверждения.

## 2. Правило активного шага

Для одной Сущности в один момент времени допускается только один активный незавершённый шаг.

## 3. Правило фазового барьера

Следующий шаг разрешается только после состояния:
artifact_confirmed

## 4. Правило подтверждения

Подтверждение делается фактическими командами файловой системы:
- ls -l
- sed -n
- find
- cat .wb-copy-map.tsv

## 5. Правило маршрутизации

Каждая задача Сущности должна сопровождаться конвертом с указанием:
- позывного;
- фазы;
- типа операции;
- целевого файла;
- основания;
- признака успеха.

## 6. Правило ограниченного параллелизма

Если оператор начинает путать состояния шагов, приоритетом становится не скорость, а фиксация подтверждений и журналов.

## 7. Правило против энтропии

Нельзя:
- создавать новый контур без понятного продукта;
- запускать новую фазу без подтверждения старой;
- считать файл существующим только потому, что на него уже был выдан скрипт.
MD_EOF

cat > "$DOC_DIR/0258-1104-2026-first-sprint-task-package-archivist-trezvennik.md" <<'MD_EOF'
# Пакет задач первого спринта: Архивариус-Трезвенник

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить стартовый пакет инженерных задач для первого спринта разработки Архивариуса-Трезвенника

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0218-1104-2026-technical-task-archivist-trezvennik-v02.md
- 0228-1104-2026-mvp-definition-archivist-trezvennik-v02.md
- 0238-1104-2026-roadmap-next-cycles-archivist-trezvennik.md

## Задача 1
Спроектировать таблицы сущностей, шагов и артефактов.

## Задача 2
Добавить регистрацию сущности.

## Задача 3
Добавить просмотр состояния сущности.

## Задача 4
Добавить регистрацию шага и смену состояний.

## Задача 5
Добавить регистрацию артефакта.

## Задача 6
Добавить handoff summary.

## Критерий завершения первого спринта

Первый спринт считается завершённым, если Архивариус может сопровождать хотя бы один полный шаг Редактора от выдачи скрипта до artifact_confirmed и затем собрать короткую сводку состояния.
MD_EOF

echo "Created:"
echo "$DOC_DIR/0208-1104-2026-consensus-log-archivist-priority.md"
echo "$DOC_DIR/0218-1104-2026-technical-task-archivist-trezvennik-v02.md"
echo "$DOC_DIR/0228-1104-2026-mvp-definition-archivist-trezvennik-v02.md"
echo "$DOC_DIR/0238-1104-2026-roadmap-next-cycles-archivist-trezvennik.md"
echo "$DOC_DIR/0248-1104-2026-operator-regulation-entity-tree-work.md"
echo "$DOC_DIR/0258-1104-2026-first-sprint-task-package-archivist-trezvennik.md"
