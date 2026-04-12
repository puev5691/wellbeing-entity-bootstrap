#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
README="$REPO/README.md"

mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0658-1104-2026-local-service-entry-success-log.md" <<'MD_EOF'
# Журнал завершения цикла локального сервисного входа Архивариуса

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать успешное появление первого формализованного JSON-входа к Архивариусу

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: confirmed_by_local_execution
handoff_to: not_applicable
related_docs:
- 0608-1104-2026-cycle-open-local-service-layer.md
- 0618-1104-2026-technical-task-local-service-layer.md
- 0628-1104-2026-mvp-plan-local-service-layer.md
- 0638-1104-2026-task-package-local-service-layer.md

## 1. Что реализовано

В Архивариус добавлен единый служебный вход:

`service-query`

На текущем этапе он возвращает JSON-ответ для следующих типов запросов:

- `active-step`
- `entity-summary`
- `recent-artifacts`

## 2. Что подтверждено проверкой

Практически подтверждено, что запрос:

`service-query entity-summary --callsign Редактор`

возвращает формализованный JSON-ответ, пригодный для машинного чтения.

В ответе присутствуют:
- признак успешности;
- тип запроса;
- краткая информация о Сущности;
- содержательные данные по запросу;
- последний подтверждённый шаг;
- отсутствие активного шага в виде `null`, если активного шага нет.

## 3. Практический смысл результата

Архивариус перестал быть только набором CLI-команд для ручного использования оператором.

Теперь у него появился первый формализованный сервисный вход, который можно использовать как заготовку для:
- будущего локального слоя взаимодействия между Сущностями;
- перехода к более формальному сервисному API;
- последующей обвязки внешними протоколами.

## 4. Ограничения текущего результата

Текущая реализация ещё остаётся минимальной.

На данном этапе:
- сервисный вход реализован внутри CLI;
- структура JSON уже пригодна для машинного чтения, но ещё может быть нормализована;
- в ответе пока присутствует частичное дублирование слоя `entity` и `data.entity`;
- HTTP-режим и внешний протокольный доступ не реализуются.

## 5. Итог

Цикл локального сервисного входа считается завершённым с положительным результатом.

Архивариус уже имеет:
- query-layer для оператора;
- первый JSON-вход для формализованного обращения к данным.

Это считается переходом от чисто ручной работы к начальному сервисному слою.
MD_EOF

python3 - "$README" <<'PY_EOF'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

begin = "<!-- BEGIN: archivist-current-state -->"
end = "<!-- END: archivist-current-state -->"

new_block = """<!-- BEGIN: archivist-current-state -->

## Текущее состояние

Архивариус уже вышел за пределы простого индексатора файлов и поиска по ним. На текущем этапе реализованы:

- реестр Сущностей
  - `register-entity`
  - `list-entities`
  - `show-entity-state`
- реестр шагов
  - `issue-step`
  - `mark-step-executed`
  - `confirm-step-artifact`
  - `list-steps`
- минимальный query-layer
  - `show-active-step`
  - `show-entity-summary`
  - `list-confirmed-steps`
  - `list-recent-artifacts`
- первый формализованный JSON-вход
  - `service-query`

## Что это означает

Архивариус уже умеет учитывать:

- проектные Сущности, включая Координатора и специализированные дочерние Сущности
- жизненный цикл шага:
  - `script_issued`
  - `script_executed`
  - `artifact_confirmed`
- фазовый барьер, не позволяющий накладывать новый активный шаг поверх незавершённого шага той же Сущности
- минимальные операторские запросы к текущему состоянию Сущностей, подтверждённых шагов и последних файловых результатов
- разделение регистрационного слоя Сущности и её фактического оперативного состояния
- первый локальный сервисный вход для машинно-читаемого запроса данных

## Что уже подтверждено практикой

Текущий механизм уже проверен на реальной работе:

- зарегистрированы Сущности:
  - `Координатор`
  - `Следопыт`
  - `Редактор`
- через реестр шагов проведён и подтверждён реальный внутренний цикл Редактора:
  - план стабилизации
  - фиксация канонического ядра
  - выбор первого пилотного объекта
  - рабочий экземпляр карточки материала
  - рабочая фиксация внутреннего решения
- query-layer проверен на живых данных по Сущностям, подтверждённым шагам, последним файловым результатам и честной оперативной сводке
- `service-query` проверен на JSON-ответе для `Редактора`

## Чего пока не хватает

Следующие возможности ещё не считаются реализованными полностью и относятся к следующей фазе:

- нормализация структуры JSON-ответа без лишнего дублирования
- расширение `service-query` или вынос его в отдельный локальный сервисный слой
- отдельный реестр артефактов как самостоятельный слой
- сервисный/API-слой для автоматизированного доступа между Сущностями вне CLI
- MCP или иной протокольный внешний доступ

## Текущая операционная модель

На текущем этапе действует следующая базовая формула:

- Координатор определяет
- Архивариус фиксирует
- Сущность исполняет
- Оператор подтверждает

Эта модель считается базовой до появления более зрелого слоя автоматизированной оркестрации.

<!-- END: archivist-current-state -->"""

if begin in text and end in text:
    start = text.index(begin)
    finish = text.index(end) + len(end)
    text = text[:start] + new_block + text[finish:]
else:
    raise SystemExit("Current-state marker block not found in README.md")

cli_replacement = """## Текущие CLI-команды

На текущем этапе Архивариус предоставляет такие команды:

    init-db
    stats
    index
    reindex
    search-name
    search-text
    show-file
    show-chat-package
    show-copy-map
    generate-copy-map-draft
    classify-package-files
    package-status-report
    build-context-manifest
    build-repo-manifest
    build-repo-profile
    build-repo-start-context
    check-copy-map-coverage
    recommend-copy-map-additions
    build-copy-map-candidate
    build-copy-map-append-patch
    register-entity
    list-entities
    show-entity-state
    issue-step
    mark-step-executed
    confirm-step-artifact
    list-steps
    show-active-step
    show-entity-summary
    list-confirmed-steps
    list-recent-artifacts
    service-query
"""

text, count = re.subn(
    r"## Текущие CLI-команды\n.*?(?=\n## |\Z)",
    cli_replacement,
    text,
    count=1,
    flags=re.S,
)
if count == 0:
    raise SystemExit("CLI section not found in README.md")

path.write_text(text, encoding="utf-8")
PY_EOF

git -C "$REPO" add README.md src/archivist/cli.py
git -C "$REPO" commit -m "Add local JSON service entry for archivist queries"
git -C "$REPO" push origin "$(git -C "$REPO" branch --show-current)"

echo "Created:"
echo "  $DOC_DIR/0658-1104-2026-local-service-entry-success-log.md"
echo
echo "Git status:"
git -C "$REPO" status --short
