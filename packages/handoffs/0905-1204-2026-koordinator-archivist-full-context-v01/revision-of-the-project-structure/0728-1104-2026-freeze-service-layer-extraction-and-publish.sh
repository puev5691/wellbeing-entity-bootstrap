#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
README="$REPO/README.md"

mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0728-1104-2026-service-layer-extraction-success-log.md" <<'MD_EOF'
# Журнал завершения цикла выноса service-layer из cli.py

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать успешный вынос локального service-layer из cli.py в отдельный модуль

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: confirmed_by_local_execution
handoff_to: not_applicable
related_docs:
- 0688-1104-2026-cycle-open-service-layer-extraction.md
- 0698-1104-2026-technical-task-service-layer-extraction.md
- 0708-1104-2026-mvp-plan-service-layer-extraction.md
- 0718-1104-2026-task-package-service-layer-extraction.md
- 0658-1104-2026-local-service-entry-success-log.md
- 0678-1104-2026-json-contract-normalization-success-log.md

## 1. Что реализовано

В репозитории Архивариуса создан отдельный модуль:

`src/archivist/service_layer.py`

В него вынесена сборка payload для локального сервисного входа `service-query`.

## 2. Что изменилось в архитектуре

После выноса:

- `cli.py` больше не содержит основную логику построения service-query payload;
- `cli.py` используется как тонкая оболочка:
  - разбирает аргументы;
  - вызывает service-layer;
  - печатает JSON;
- service-layer стал самостоятельным локальным модулем.

## 3. Что подтверждено проверкой

Практически подтверждено, что запрос:

`service-query entity-summary --callsign Редактор`

после выноса service-layer продолжает возвращать корректный JSON-ответ.

Это означает, что:
- JSON-контракт не сломан;
- отделение service-layer от argparse-слоя выполнено успешно.

## 4. Практический смысл результата

Архивариус теперь имеет не только локальный JSON-вход, но и более чистую внутреннюю архитектуру.

Это создаёт основу для следующих шагов:
- выделения локального сервисного слоя в более самостоятельную форму;
- перехода к path abstraction layer;
- последующего движения к внешнему или полу-внешнему API.

## 5. Итог

Цикл выноса service-layer из cli.py считается завершённым с положительным результатом.

Локальный сервисный вход:
- сохранён;
- не сломан;
- архитектурно отделён от CLI-оболочки.
MD_EOF

python3 - "$README" <<'PY_EOF'
from pathlib import Path
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
- отдельный локальный модуль сервисного слоя
  - `src/archivist/service_layer.py`

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
- локальный сервисный вход для машинно-читаемого запроса данных
- вынесенный service-layer, отделённый от argparse-оболочки CLI

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
- service-layer успешно вынесен в отдельный локальный модуль без поломки JSON-контракта

## Чего пока не хватает

Следующие возможности ещё не считаются реализованными полностью и относятся к следующей фазе:

- слой абстракции путей и корневых переменных
- дальнейшая нормализация исторических и регистрационных полей сущности
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

path.write_text(text, encoding="utf-8")
PY_EOF

git -C "$REPO" add README.md src/archivist/cli.py src/archivist/service_layer.py
git -C "$REPO" commit -m "Extract local service layer from CLI"
git -C "$REPO" push origin "$(git -C "$REPO" branch --show-current)"

echo "Created:"
echo "  $DOC_DIR/0728-1104-2026-service-layer-extraction-success-log.md"
echo
echo "Git status:"
git -C "$REPO" status --short
