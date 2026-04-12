# Журнал шага: canonicalize path roots config and env

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать канонизацию path_roots в config и нейтрализацию конфликтующего WB_PROJECT_ROOT

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: local_config_and_shell_updated
handoff_to: not_applicable
related_docs:
- 0738-1104-2026-cycle-open-path-abstraction-layer.md
- 0748-1104-2026-technical-task-path-abstraction-layer.md

## Что сделано

В config записаны канонические корни:

- documents_root = /storage/emulated/0/Documents
- repos_root = /storage/emulated/0/Documents/repos
- project_root = /storage/emulated/0/Documents/Blagopoluchie

Также в стартовых shell-файлах были закомментированы активные упоминания , если они там присутствовали.

## Зачем это сделано

Чтобы  перестал тихо приезжать из случайной старой среды и начал жить по канону path_roots.

## Следующий шаг

Перезапустить shell или открыть новый Termux-сеанс и перепроверить .
