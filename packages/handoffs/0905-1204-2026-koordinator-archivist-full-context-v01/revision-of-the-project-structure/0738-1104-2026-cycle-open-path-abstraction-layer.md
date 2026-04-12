# Открытие цикла: path abstraction layer

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть цикл введения слоя абстракции путей и корневых переменных для переносимости Архивариуса

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0728-1104-2026-service-layer-extraction-success-log.md
- 0618-1104-2026-technical-task-local-service-layer.md

## Основная мысль цикла

Архивариус уже полезен, но пока опирается на абсолютные пути. Это удобно на одном устройстве и опасно при переносе на другое железо.

Следующий шаг состоит в том, чтобы ввести слой логических корней и резолвинг путей через них.

## Цель цикла

Добавить:
- логические root keys;
- резолвер логического пути в абсолютный;
- обратное разложение абсолютного пути в root key и relative path;
- первые CLI-команды для проверки path abstraction layer.

## Критерий успеха

Цикл считается завершённым, если Архивариус умеет:
- показать набор корней;
- собрать абсолютный путь из root key и relative path;
- разложить абсолютный путь обратно в root key и relative path.
