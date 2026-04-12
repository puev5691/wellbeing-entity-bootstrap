# Структура initiation package Сущности

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточную структуру пакета инициации Сущности для воспроизводимого запуска и handoff-передачи

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0828-1104-2026-policy-origin-and-authorship-for-entities.md
- 0838-1104-2026-canonical-header-v2-for-entities.md
- 0808-1104-2026-mvp-plan-entity-origin-and-bootstrap-policy.md

## 1. Зачем нужен initiation package

Сущность не должна запускаться на голом вдохновении и случайном наборе файлов.

Воспроизводимый запуск требует минимального пакета инициации, который:
- задаёт роль;
- определяет контур;
- ограничивает поле допустимых действий;
- фиксирует происхождение;
- указывает минимальный набор обязательного чтения;
- задаёт правила handoff и допуска к фазам.

## 2. Минимальный состав initiation package

Ниже указан минимально достаточный набор.

### 2.1. README пакета
Назначение:
кратко объяснить, что это за пакет, для какой Сущности он предназначен и как им пользоваться.

### 2.2. Entity profile
Документ, описывающий:
- callsign
- роль
- контур
- допустимые типы задач
- запрещённые действия
- типы ожидаемых артефактов
- уровень автономности

### 2.3. Start context
Документ, содержащий:
- краткую картину предметной области;
- текущий статус контура;
- приоритеты первых результатов;
- словарь терминов, если он обязателен.

### 2.4. Required reading list
Минимальный набор файлов, который Сущность должна считать обязательным чтением перед началом работы.

### 2.5. Origin and authorship policy
Документ, объясняющий:
- как различается человеческий слой ответственности;
- как различается проектный и технический слой происхождения;
- как фиксировать tooling origin.

### 2.6. Constraints and permissions
Документ, определяющий:
- допустимый уровень действий;
- что можно делать без допуска;
- что требует подтверждения;
- что запрещено.

### 2.7. Task envelope template
Шаблон для постановки задач Сущности:
- callsign
- phase
- operation_type
- target file
- related docs
- hard constraints
- expected result
- acceptance evidence

### 2.8. Handoff rules
Документ, описывающий:
- как завершать фазу;
- что должно входить в handoff;
- как фиксировать незавершённые хвосты;
- как различать confirmed и working.

## 3. Желательные дополнительные элементы

По мере роста сложности пакета допускается добавлять:

- examples/
- bootstrap manifests
- allowed header examples
- prompt policy notes
- canonical response examples
- machine-readable manifest

## 4. Минимальная структура каталогов

Один из допустимых вариантов структуры:

- README-initiation-package.md
- entity-profile.md
- start-context.md
- required-reading-list.md
- origin-and-authorship-policy.md
- constraints-and-permissions.md
- task-envelope-template.md
- handoff-rules.md
- examples/ при необходимости

## 5. Правило воспроизводимости

Пакет инициации считается пригодным, если новая Сущность может быть запущена:
- в другом чате;
- на другом устройстве;
- другим оператором;
- с минимальной потерей контекста и границ роли.

Если запуск без устной памяти и догадок невозможен, initiation package считается неполным.

## 6. Итог

Initiation package вводится как отдельный класс инфраструктурных материалов Системы.

Он нужен не для красоты, а для воспроизводимого рождения, передачи и масштабирования Сущностей.
