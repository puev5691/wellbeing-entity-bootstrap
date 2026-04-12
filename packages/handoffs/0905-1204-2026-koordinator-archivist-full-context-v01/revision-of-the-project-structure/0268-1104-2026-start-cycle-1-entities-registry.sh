#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0268-1104-2026-cycle-1-entities-registry-plan.md" <<'MD_EOF'
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
MD_EOF

cat > "$DOC_DIR/0278-1104-2026-task-for-archivist-cycle-1-entities-registry.md" <<'MD_EOF'
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
MD_EOF

echo "Created:"
echo "$DOC_DIR/0268-1104-2026-cycle-1-entities-registry-plan.md"
echo "$DOC_DIR/0278-1104-2026-task-for-archivist-cycle-1-entities-registry.md"
