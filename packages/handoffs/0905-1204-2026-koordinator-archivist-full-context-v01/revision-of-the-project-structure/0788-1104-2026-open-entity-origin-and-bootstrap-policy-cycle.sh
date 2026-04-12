#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0788-1104-2026-cycle-open-entity-origin-and-bootstrap-policy.md" <<'MD_EOF'
# Открытие цикла: entity-origin-and-bootstrap-policy

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл формализации происхождения Сущностей, авторства, технического происхождения текстов и пакетов инициации

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0728-1104-2026-service-layer-extraction-success-log.md
- 0738-1104-2026-cycle-open-path-abstraction-layer.md
- 0748-1104-2026-technical-task-path-abstraction-layer.md

## Основная мысль цикла

Архивариус, Координатор и другие Сущности уже начали формировать устойчивую рабочую инфраструктуру. Следующий шаг состоит в том, чтобы зафиксировать не только технические механизмы, но и происхождение результатов, правила авторства, слои ответственности и структуру пакетов инициации Сущностей.

## Почему это стало приоритетом

Без формализации происхождения и инициации Сущностей дальнейшее масштабирование будет порождать путаницу:

- кто является человеческим ответственным;
- какая Сущность проекта породила или собрала результат;
- какой технический инструмент использовался;
- из какого контекстного пакета была инициирована Сущность;
- как воспроизводить запуск новой Сущности на другом устройстве или в другом чате.

## Цель цикла

Сформировать основу для непоколебимого слоя происхождения и воспроизводимой инициации Сущностей.

## Критерий успеха

Цикл считается завершённым, если будут зафиксированы:

- политика происхождения и авторства;
- канонический header-блок v2;
- структура initiation package;
- решение по отдельному репозиторию для bootstrap-материалов Сущностей.
MD_EOF

cat > "$DOC_DIR/0798-1104-2026-technical-task-entity-origin-and-bootstrap-policy.md" <<'MD_EOF'
# Техническое задание: entity-origin-and-bootstrap-policy

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерно-организационную задачу на формализацию происхождения Сущностей, авторства и bootstrap-пакетов

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0788-1104-2026-cycle-open-entity-origin-and-bootstrap-policy.md

## Требуется

### 1. Различить слои происхождения результата

Нужно жёстко различить:

- human owner или human responsible;
- entity author в проектном смысле;
- tooling origin;
- source context package;
- responsibility boundary между человеком и Сущностью.

### 2. Подготовить канонический header-блок v2

Нужно определить поля, которые должны появляться в важных документах для фиксации:

- человеческой ответственности;
- проектного происхождения;
- технического происхождения;
- связи с пакетом инициации;
- степени подтверждённости.

### 3. Описать initiation package

Нужно определить минимальный состав пакета инициации Сущности:

- стартовый контекст;
- обязательные документы чтения;
- профиль роли;
- допустимые типы задач;
- ограничения;
- правила handoff;
- policy происхождения и авторства.

### 4. Подготовить решение по bootstrap repository

Нужно определить, нужен ли отдельный репозиторий для:

- пакетов инициации Сущностей;
- профилей ролей;
- шаблонов handoff;
- canonical header policy;
- примеров bootstrap-наборов.

## Ограничения

На этом этапе не требуется:

- немедленно переписывать все старые файлы;
- сразу создавать и наполнять новый репозиторий;
- юридически формализовать все случаи использования;
- интегрировать это с блокчейн-контуром.

## Критерий успеха

После завершения цикла должен существовать минимально достаточный канон происхождения Сущностей и воспроизводимого bootstrap-процесса.
MD_EOF

cat > "$DOC_DIR/0808-1104-2026-mvp-plan-entity-origin-and-bootstrap-policy.md" <<'MD_EOF'
# MVP-план: entity-origin-and-bootstrap-policy

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём первого шага по происхождению Сущностей и bootstrap-пакетам

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0798-1104-2026-technical-task-entity-origin-and-bootstrap-policy.md

## MVP цикла

1. Подготовить документ policy происхождения и авторства.
2. Подготовить документ canonical header v2.
3. Подготовить документ структуры initiation package.
4. Подготовить документ решения по bootstrap repository.

## Почему именно так

Потому что сейчас важнее сначала зафиксировать канон и термины, а уже потом раскладывать их по репозиториям, шаблонам и автоматике.

## Что откладывается

Откладывается:

- миграция старых документов на новый header;
- массовое обновление пакетов Сущностей;
- автоматическая валидация происхождения;
- связка с сервисным слоем Архивариуса;
- реальное создание отдельного bootstrap-репозитория.

## Критерий завершения MVP

MVP считается завершённым, если основа происхождения Сущностей и воспроизводимой инициации описана в четырёх канонических документах.
MD_EOF

cat > "$DOC_DIR/0818-1104-2026-task-package-entity-origin-and-bootstrap-policy.md" <<'MD_EOF'
# Пакет задач: entity-origin-and-bootstrap-policy

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать минимальный пакет задач цикла происхождения Сущностей и bootstrap-пакетов

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0808-1104-2026-mvp-plan-entity-origin-and-bootstrap-policy.md

## Задача 1
Подготовить policy происхождения и авторства результата.

## Задача 2
Подготовить canonical header v2.

## Задача 3
Подготовить структуру initiation package Сущности.

## Задача 4
Подготовить решение по отдельному bootstrap repository.

## Задача 5
Согласовать, как эти документы будут использоваться при инициации новых Сущностей и handoff-переходах.
MD_EOF

echo "Created:"
echo "$DOC_DIR/0788-1104-2026-cycle-open-entity-origin-and-bootstrap-policy.md"
echo "$DOC_DIR/0798-1104-2026-technical-task-entity-origin-and-bootstrap-policy.md"
echo "$DOC_DIR/0808-1104-2026-mvp-plan-entity-origin-and-bootstrap-policy.md"
echo "$DOC_DIR/0818-1104-2026-task-package-entity-origin-and-bootstrap-policy.md"
