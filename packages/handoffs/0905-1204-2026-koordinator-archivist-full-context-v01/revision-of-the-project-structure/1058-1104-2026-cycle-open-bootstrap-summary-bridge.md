# Открытие цикла: bridge between Archivist and bootstrap packages

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл сцепки Архивариуса с bootstrap-материалами через различение и summary bootstrap packages

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0978-1104-2026-bootstrap-core-four-entities-success-log.md
- 1018-1104-2026-path-roots-normalization-success-log.md

## Основная мысль цикла

Архивариус уже умеет учитывать сущности, шаги, query-layer, service-layer и path roots. Следующий шаг состоит в том, чтобы он начал различать bootstrap packages как отдельный класс объектов.

## Цель цикла

Добавить первый мост между `wellbeing-archivist` и `wellbeing-entity-bootstrap` через summary bootstrap packages.

## Критерий успеха

Цикл считается завершённым, если Архивариус умеет:
- перечислять bootstrap packages;
- показывать summary отдельного bootstrap package;
- различать его базовые поля и полноту минимального состава.
