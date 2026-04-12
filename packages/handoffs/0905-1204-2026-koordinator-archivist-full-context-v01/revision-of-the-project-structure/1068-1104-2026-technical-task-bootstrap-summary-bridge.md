# Техническое задание: bootstrap summary bridge

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на первый мост между Архивариусом и bootstrap packages

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 1058-1104-2026-cycle-open-bootstrap-summary-bridge.md

## Требуется

1. Создать модуль `bootstrap_packages.py`.
2. Реализовать разбор bootstrap package directory.
3. Добавить команды:
   - `list-bootstrap-packages`
   - `show-bootstrap-package-summary`
4. Научить Архивариуса различать:
   - package id
   - entity author
   - contour
   - approval status
   - обязательные файлы
   - полноту минимального состава

## Ограничения

На этом этапе не требуется:
- индексация bootstrap packages в SQLite
- сложный parser markdown
- автоматическая валидация всех полей header v2
- полная интеграция с service-layer

## Критерий успеха

Summary bootstrap packages должен работать на текущем bootstrap repository с четырьмя базовыми пакетами.
