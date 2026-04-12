# Открытие цикла: вынос service-layer из cli.py

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл выноса локального сервисного слоя Архивариуса из cli.py в отдельный модуль

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0658-1104-2026-local-service-entry-success-log.md
- 0678-1104-2026-json-contract-normalization-success-log.md

## Основная мысль цикла

Локальный сервисный вход уже работает и отдаёт нормализованный JSON. Следующий шаг состоит в том, чтобы перестать держать сервисную логику внутри cli.py и вынести её в отдельный модуль.

## Цель цикла

Сделать cli.py тонкой оболочкой, а сборку service-query payload перенести в отдельный service-layer модуль.

## Критерий успеха

Цикл считается завершённым, если:
- service-query продолжает работать;
- логика его payload вынесена из cli.py;
- в репозитории появляется отдельный модуль service-layer.
