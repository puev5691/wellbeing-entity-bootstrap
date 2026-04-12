#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
README="$REPO/README.md"

mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0598-1104-2026-operational-summary-sync-success-log.md" <<'MD_EOF'
# Журнал завершения цикла синхронизации оперативной сводки Сущности

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать успешное обновление show-entity-summary до честной оперативной сводки

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: confirmed_by_local_execution
handoff_to: not_applicable
related_docs:
- 0548-1104-2026-cycle-open-operational-summary-sync.md
- 0558-1104-2026-technical-task-operational-summary-sync.md
- 0568-1104-2026-mvp-plan-operational-summary-sync.md
- 0578-1104-2026-task-package-operational-summary-sync.md

## 1. Что реализовано

В Архивариус добавлены:

- функция получения последнего подтверждённого шага;
- разделение регистрационного и оперативного блока в `show-entity-summary`;
- вычисление краткого оперативного состояния Сущности.

## 2. Что подтверждено проверкой

Практически подтверждено на `Редакторе`, что `show-entity-summary` теперь показывает:

- регистрационный блок;
- оперативный блок;
- `operational_state_text`;
- `active_step`;
- `last_confirmed_step`.

## 3. Практический смысл результата

Сводка Сущности перестала быть смешением регистрационных полей и текущего состояния.

Теперь оператор видит:

- кто такая Сущность;
- есть ли активный шаг;
- какой последний подтверждённый результат у неё есть;
- как это кратко интерпретируется как оперативное состояние.

## 4. Что ещё остаётся на будущее

На будущее остаются:

- более аккуратное различение чисто регистрационных полей и исторических описаний вроде `current_step_title`;
- возможная нормализация или переименование таких полей;
- сервисный/API-слой;
- отдельный реестр артефактов при необходимости.

## 5. Итог

Цикл синхронизации оперативной сводки Сущности считается завершённым с положительным результатом.

`show-entity-summary` теперь является честной краткой сводкой, а не полупаспортом-полуисторией.
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

## Чего пока не хватает

Следующие возможности ещё не считаются реализованными полностью и относятся к следующей фазе:

- дальнейшая нормализация регистрационных и исторических полей сущности
- отдельный реестр артефактов как самостоятельный слой
- сервисный/API-слой для автоматизированного доступа между Сущностями
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

git -C "$REPO" add README.md src/archivist/cli.py src/archivist/entities_registry.py src/archivist/steps_registry.py
git -C "$REPO" commit -m "Sync entity summary with operational state"
git -C "$REPO" push origin "$(git -C "$REPO" branch --show-current)"

echo "Created:"
echo "  $DOC_DIR/0598-1104-2026-operational-summary-sync-success-log.md"
echo
echo "Git status:"
git -C "$REPO" status --short
