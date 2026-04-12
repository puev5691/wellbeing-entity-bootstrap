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
