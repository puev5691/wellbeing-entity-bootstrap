#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
README="$REPO/README.md"

mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0678-1104-2026-json-contract-normalization-success-log.md" <<'MD_EOF'
# Журнал завершения цикла нормализации JSON-контракта service-query

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать успешную нормализацию JSON-структуры локального сервисного входа Архивариуса

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
- 0658-1104-2026-local-service-entry-success-log.md

## 1. Что было проблемой

Первый вариант `service-query` уже работал, но содержал избыточность:
- верхний блок `entity`;
- дублирующий `data.entity`.

Это делало JSON пригодным к чтению, но не самым аккуратным как контракт для последующей автоматизации.

## 2. Что реализовано

JSON-контракт `service-query` нормализован.

На текущем этапе структура ответа приведена к следующей логике:

- `ok`
- `query_type`
- `entity`
- `data`

При этом:
- `entity` содержит краткую верхнеуровневую информацию о Сущности;
- `data` содержит только данные, относящиеся к смыслу конкретного запроса.

## 3. Что подтверждено проверкой

Практически подтверждено на запросе:

`service-query entity-summary --callsign Редактор`

что:
- `entity` присутствует только один раз;
- `data` содержит:
  - `active_step`
  - `last_confirmed_step`
  - `operational_state_text`
- JSON остаётся пригодным для машинного чтения.

## 4. Практический смысл результата

Локальный сервисный вход Архивариуса стал не только рабочим, но и более пригодным как стабильный формализованный контракт.

Это уменьшает риск путаницы при дальнейшей автоматизации и делает следующий шаг к отдельному сервисному слою более безопасным.

## 5. Итог

Цикл нормализации JSON-контракта считается завершённым с положительным результатом.

Локальный сервисный вход Архивариуса:
- работает;
- отдаёт JSON;
- имеет более чистую структуру;
- пригоден как основа следующего сервисного этапа.
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
- более чистый JSON-контракт без лишнего дублирования слоя `entity`

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
- JSON-контракт `service-query` нормализован до более устойчивой структуры

## Чего пока не хватает

Следующие возможности ещё не считаются реализованными полностью и относятся к следующей фазе:

- вынесение service-layer из CLI в отдельный локальный модуль
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

git -C "$REPO" add README.md src/archivist/cli.py
git -C "$REPO" commit -m "Normalize service query JSON contract"
git -C "$REPO" push origin "$(git -C "$REPO" branch --show-current)"

echo "Created:"
echo "  $DOC_DIR/0678-1104-2026-json-contract-normalization-success-log.md"
echo
echo "Git status:"
git -C "$REPO" status --short
