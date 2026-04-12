# Техническое задание: path abstraction layer

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на введение слоя логических корней и резолвинга путей

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0738-1104-2026-cycle-open-path-abstraction-layer.md

## Требуется

1. Создать модуль path abstraction.
2. Ввести корни:
   - documents_root
   - repos_root
   - project_root
3. Поддержать приоритеты источников:
   - defaults
   - environment variables
   - config JSON key `path_roots`
   - явные CLI overrides
4. Реализовать:
   - show roots
   - resolve logical path
   - split absolute path

## Ограничения

На этом этапе не требуется:
- миграция существующей БД
- немедленная замена всех абсолютных путей в проекте
- перепроектирование service-layer
- HTTP или внешний протокол

## Критерий успеха

После реализации path abstraction layer должен работать как отдельный строительный слой для будущей переносимости Архивариуса.
