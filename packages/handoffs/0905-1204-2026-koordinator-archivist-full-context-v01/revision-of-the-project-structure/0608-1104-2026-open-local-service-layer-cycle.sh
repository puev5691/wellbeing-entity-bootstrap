#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0608-1104-2026-cycle-open-local-service-layer.md" <<'MD_EOF'
# Открытие цикла: локальный сервисный слой Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: открыть следующий инженерный цикл развития Архивариуса, связанный с минимальным локальным сервисным слоем доступа

artifact_type: cycle_plan
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0488-1104-2026-query-layer-mvp-success-log.md
- 0538-1104-2026-list-recent-artifacts-success-log.md
- 0598-1104-2026-operational-summary-sync-success-log.md

## Основная мысль цикла

Архивариус уже умеет отвечать на ключевые операторские вопросы, но доступ к нему всё ещё осуществляется вручную через запуск CLI-команд.

Следующий шаг состоит в том, чтобы дать Архивариусу минимальный локальный сервисный слой, через который можно получать ответы по формализованным запросам без постоянного ручного перебора команд.

## Цель цикла

Подготовить и реализовать минимальный локальный слой доступа к Архивариусу для следующих функций:

- active step
- entity summary
- confirmed steps
- recent artifacts

## Практический эффект

После завершения цикла Архивариус должен стать не только CLI-инструментом, но и локальной сервисной точкой доступа, пригодной для будущей автоматизации межсущностного взаимодействия.

## Ограничение цикла

На этом этапе не требуется:

- удалённый сетевой сервис
- публичный API
- внешний MCP-слой
- автоматическое выполнение задач между Сущностями
- сложная аутентификация и разграничение ролей

## Критерий успеха

Цикл считается завершённым, если локально можно получить результат Архивариуса в формализованном виде через единый сервисный вход, а не только через ручной вызов отдельных CLI-команд.
MD_EOF

cat > "$DOC_DIR/0618-1104-2026-technical-task-local-service-layer.md" <<'MD_EOF'
# Техническое задание: локальный сервисный слой Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: задать инженерную задачу на реализацию минимального локального сервисного слоя Архивариуса

artifact_type: specification
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0608-1104-2026-cycle-open-local-service-layer.md
- 0398-1104-2026-technical-task-archivist-query-layer.md
- 0558-1104-2026-technical-task-operational-summary-sync.md

## 1. Основная задача

Нужно создать минимальный локальный сервисный вход к Архивариусу, который позволит формализованно получать результаты по уже существующим функциям query-layer.

## 2. Минимально требуемые методы доступа

Сервисный слой должен покрывать:

- active step
- entity summary
- confirmed steps
- recent artifacts

## 3. Минимально допустимая форма реализации

На текущем этапе допустим любой из двух минимальных вариантов:

### Вариант А
локальный HTTP-сервис на `127.0.0.1`, отдающий JSON

### Вариант Б
служебная команда-обёртка внутри CLI, которая принимает тип запроса и возвращает JSON-ответ

Если потребуется, первый цикл можно начать с варианта Б как более дешёвого и безопасного.

## 4. Требования к ответу

Ответ должен быть:

- формализованным
- пригодным для машинного чтения
- стабильным по структуре
- не требующим ручного разбора человеком

## 5. Чего не требуется

На этом этапе не требуется:

- внешний доступ из интернета
- полноценный REST-дизайн
- аутентификация
- сервер фонового демона с автозапуском
- интеграция с ChatGPT, MCP или блокчейн-контуром

## 6. Критерий успеха

После реализации Архивариус должен уметь по одному формализованному входу отдавать структурированный ответ как минимум для одной Сущности по следующим типам запросов:

- active step
- entity summary
- recent artifacts
MD_EOF

cat > "$DOC_DIR/0628-1104-2026-mvp-plan-local-service-layer.md" <<'MD_EOF'
# MVP-план: локальный сервисный слой Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: определить минимально достаточный объём следующего инженерного шага по сервисному слою Архивариуса

artifact_type: mvp_definition
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0618-1104-2026-technical-task-local-service-layer.md

## MVP следующего шага

Минимально достаточный объём:

1. Выбрать формат формализованного ответа: JSON.
2. Добавить один служебный вход для запросов к Архивариусу.
3. Поддержать не менее трёх типов запросов:
   - active step
   - entity summary
   - recent artifacts
4. Проверить работу на Сущности `Редактор`.

## Почему именно так

Потому что уже сейчас главная ценность не в расширении числа команд, а в переходе от ручного вызова к формализованному машинно-читаемому ответу.

## Что откладывается

Откладывается:

- confirmed steps через тот же вход
- HTTP-режим как отдельный процесс
- внешний доступ
- сложная маршрутизация между Сущностями
- интеграция с внешними протоколами

## Критерий завершения MVP

MVP считается завершённым, если Архивариус по единому формализованному входу умеет отдавать JSON-ответ для:
- active step
- entity summary
- recent artifacts
MD_EOF

cat > "$DOC_DIR/0638-1104-2026-task-package-local-service-layer.md" <<'MD_EOF'
# Пакет задач: локальный сервисный слой Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать минимальный рабочий пакет задач следующего цикла развития Архивариуса

artifact_type: task_package
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0618-1104-2026-technical-task-local-service-layer.md
- 0628-1104-2026-mvp-plan-local-service-layer.md

## Задача 1
Выбрать первый минимальный формат сервисного слоя:
служебная JSON-команда внутри CLI или локальный HTTP-вход.

## Задача 2
Реализовать единый формализованный вход.

## Задача 3
Подключить к нему:
- active step
- entity summary
- recent artifacts

## Задача 4
Проверить работу на `Редакторе`.

## Критерий завершения

Цикл считается завершённым, если Архивариус способен по одному служебному входу возвращать JSON-структуру по ключевым запросам без ручного разбора человеком.
MD_EOF

echo "Created:"
echo "$DOC_DIR/0608-1104-2026-cycle-open-local-service-layer.md"
echo "$DOC_DIR/0618-1104-2026-technical-task-local-service-layer.md"
echo "$DOC_DIR/0628-1104-2026-mvp-plan-local-service-layer.md"
echo "$DOC_DIR/0638-1104-2026-task-package-local-service-layer.md"
