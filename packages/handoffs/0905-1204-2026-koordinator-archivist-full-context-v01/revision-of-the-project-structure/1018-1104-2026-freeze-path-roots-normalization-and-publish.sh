#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
README="$REPO/README.md"

mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/1018-1104-2026-path-roots-normalization-success-log.md" <<'MD_EOF'
# Журнал завершения цикла нормализации path roots

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать завершение нормализации path roots и разделения operator shell environment и канонической конфигурации Архивариуса

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: confirmed_by_local_execution
handoff_to: not_applicable
related_docs:
- 0738-1104-2026-cycle-open-path-abstraction-layer.md
- 0748-1104-2026-technical-task-path-abstraction-layer.md
- 0758-1104-2026-mvp-plan-path-abstraction-layer.md
- 0768-1104-2026-task-package-path-abstraction-layer.md
- 1008-1104-2026-path-roots-canonicalization-success-log.md

## 1. Что было проблемой

До нормализации Архивариус жил в ситуации скрытого конфликта корней:

- documents_root определялся одним способом
- project_root приезжал из `WB_PROJECT_ROOT`
- shell environment молча влиял на поведение инфраструктуры

Это создавало риск тихой непереносимости между устройствами и сеансами.

## 2. Что реализовано

В Архивариусе реализовано:

- различение источника каждого root;
- показ source для `documents_root`, `repos_root`, `project_root`;
- предупреждения при конфликте root hierarchy;
- переход к каноническому использованию `config.path_roots`.

Также operator shell environment очищен так, чтобы:
- `WORKROOT` оставался как удобство;
- `cdbl` и `tree` работали от `WORKROOT`;
- `WB_PROJECT_ROOT` больше не был скрытым источником истины для Архивариуса.

## 3. Что подтверждено проверкой

Практически подтверждено, что:

- `show-path-roots` показывает корни и их source;
- после канонизации config показывает:
  - documents_root from config
  - repos_root from config
  - project_root from config
- `resolve-logical-path project_root ...` работает корректно;
- `split-absolute-path` для рабочего пути возвращает `project_root`.

## 4. Практический смысл результата

Теперь Архивариус перестал зависеть от случайного shell-state как от скрытой инфраструктурной правды.

Это означает:
- лучшую переносимость;
- лучшую диагностируемость;
- честную трассировку происхождения путей;
- нормальное разделение между operator shell convenience и программной конфигурацией.

## 5. Итог

Цикл нормализации path roots считается завершённым с положительным результатом.

Канонический источник истины для корней путей теперь находится в `config.path_roots`, а shell-среда больше не подменяет его исподтишка.
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
- path abstraction layer
  - `show-path-roots`
  - `resolve-logical-path`
  - `split-absolute-path`

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
- path roots с различением источника и предупреждениями о конфликте корней

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
- path roots нормализованы так, что канонический источник истины определяется через `config.path_roots`

## Чего пока не хватает

Следующие возможности ещё не считаются реализованными полностью и относятся к следующей фазе:

- связка bootstrap-материалов с Архивариусом
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

git -C "$REPO" add README.md src/archivist/cli.py src/archivist/path_abstraction.py
git -C "$REPO" commit -m "Normalize path roots and source tracing"
git -C "$REPO" push origin "$(git -C "$REPO" branch --show-current)"

echo "Created:"
echo "  $DOC_DIR/1018-1104-2026-path-roots-normalization-success-log.md"
echo
echo "Git status:"
git -C "$REPO" status --short
