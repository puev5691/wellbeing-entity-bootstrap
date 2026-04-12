# MVP-план: path abstraction layer

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём первого шага по path abstraction layer

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0748-1104-2026-technical-task-path-abstraction-layer.md

## MVP цикла

1. Создать `src/archivist/path_abstraction.py`.
2. Реализовать:
   - `build_path_roots`
   - `resolve_logical_path`
   - `split_absolute_path`
3. Добавить CLI-команды:
   - `show-path-roots`
   - `resolve-logical-path`
   - `split-absolute-path`
4. Проверить работу на Android-путях текущего хранилища.

## Критерий завершения

MVP считается завершённым, если path abstraction layer работает как отдельный слой и даёт воспроизводимый результат на текущем устройстве.
