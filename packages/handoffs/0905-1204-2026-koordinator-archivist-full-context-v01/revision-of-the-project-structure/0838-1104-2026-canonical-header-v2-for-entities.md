# Канонический header-блок v2 для документов Сущностей

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать вторую версию канонического header-блока с полями происхождения, авторства и bootstrap-связности

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0828-1104-2026-policy-origin-and-authorship-for-entities.md
- 0798-1104-2026-technical-task-entity-origin-and-bootstrap-policy.md

## 1. Зачем нужен header v2

Текущий header-блок уже полезен для различения статуса, контура и типа артефакта, но он недостаточен для честной фиксации происхождения результата и связи с bootstrap-пакетами Сущностей.

Header v2 нужен для того, чтобы важный документ можно было:
- корректно атрибутировать;
- включать в handoff;
- переносить между устройствами и чатами;
- использовать как часть воспроизводимой инициации Сущности.

## 2. Базовые поля, сохраняемые из текущего канона

Эти поля сохраняются как обязательная база:

- Дата
- Статус
- Контур
- Назначение
- artifact_type
- entity_scope
- phase
- repo_target
- evidence_level
- handoff_to
- related_docs

## 3. Новые поля происхождения и bootstrap-связности

Для header v2 вводятся следующие поля.

### 3.1. Человеческая ответственность
- human_owner
- human_responsible
- human_operator

### 3.2. Проектное происхождение
- entity_author
- entity_role
- entity_contour
- entity_operation_type

### 3.3. Техническое происхождение
- tooling_origin
- tooling_provider
- generation_mode
- machine_assistance_level

### 3.4. Контекст и инициация
- source_chat_contour
- source_context_package
- bootstrap_package_id
- bootstrap_profile
- related_bootstrap_docs

### 3.5. Утверждение и граница ответственности
- approval_status
- responsibility_boundary

## 4. Минимальный обязательный набор v2

Для важных документов рекомендуется считать минимально обязательными:

- Дата
- Статус
- Контур
- Назначение
- artifact_type
- entity_scope
- phase
- repo_target
- evidence_level
- handoff_to
- related_docs
- human_owner
- human_responsible
- entity_author
- entity_role
- tooling_origin
- generation_mode
- source_chat_contour
- approval_status
- responsibility_boundary

## 5. Шаблон header v2

Ниже приведён рекомендуемый шаблон.

Дата: YYYY-MM-DD  
Статус: working  
Контур: <contour>  
Назначение: <short purpose>

artifact_type: <type>  
entity_scope: <scope>  
phase: <phase>  
repo_target: <repo or not_applicable>  
evidence_level: <level>  
handoff_to: <target or not_applicable>  
related_docs:
- <doc 1>
- <doc 2>

human_owner: <human owner>  
human_responsible: <human responsible>  
human_operator: <human operator or same_as_responsible>

entity_author: <callsign>  
entity_role: <role>  
entity_contour: <contour>  
entity_operation_type: <operation>

tooling_origin: <tool>  
tooling_provider: <provider>  
generation_mode: <mode>  
machine_assistance_level: <level>

source_chat_contour: <chat contour>  
source_context_package: <context package path or id>  
bootstrap_package_id: <bootstrap id or not_applicable>  
bootstrap_profile: <profile or not_applicable>  
related_bootstrap_docs:
- <doc or none>

approval_status: <draft/working/reviewed/approved/...>  
responsibility_boundary: <short statement>

## 6. Где использовать header v2 в первую очередь

Header v2 прежде всего должен применяться в:

- policy-документах;
- handoff-документах;
- стартовых контекстах Сущностей;
- канонических документах профиля роли;
- документах, идущих в bootstrap-пакеты;
- документах, которые могут быть вынесены в отдельный репозиторий инициации.

## 7. Где можно не применять v2 немедленно

Не требуется срочно переписывать весь исторический массив файлов.

Допускается:
- сохранять старые файлы в старом формате;
- применять header v2 только к новым каноническим документам;
- проводить миграцию постепенно.

## 8. Итог

Header v2 считается канонической следующей ступенью:
он соединяет статус документа с происхождением, авторством, границей ответственности и bootstrap-связностью.
