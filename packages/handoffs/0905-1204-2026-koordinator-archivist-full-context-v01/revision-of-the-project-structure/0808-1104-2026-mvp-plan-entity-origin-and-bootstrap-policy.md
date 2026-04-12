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
