#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

DOC_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/revision-of-the-project-structure"
REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
README="$REPO/README.md"

mkdir -p "$DOC_DIR"

cat > "$DOC_DIR/0538-1104-2026-list-recent-artifacts-success-log.md" <<'MD_EOF'
# Журнал завершения цикла list-recent-artifacts

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать успешную реализацию и проверку команды list-recent-artifacts в Архивариусе

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: confirmed_by_local_execution
handoff_to: not_applicable
related_docs:
- 0498-1104-2026-cycle-open-list-recent-artifacts.md
- 0508-1104-2026-technical-task-list-recent-artifacts.md
- 0518-1104-2026-task-package-list-recent-artifacts.md

## 1. Что реализовано

В Архивариус добавлена команда:

`list-recent-artifacts`

Команда использует в качестве суррогатного слоя артефактов подтверждённые шаги со статусом `artifact_confirmed` и показывает их как последние подтверждённые файловые результаты.

## 2. Что подтверждено проверкой

Практически подтверждено:

- команда появляется в CLI;
- команда корректно отрабатывает на `Редакторе`;
- вывод содержит:
  - id шага
  - callsign
  - title
  - phase
  - operation_type
  - target_path
  - confirmed_at
  - success_evidence
  - notes

## 3. Практический смысл результата

Архивариус теперь умеет быстро показывать не только текущее состояние сущности и активные шаги, но и уже накопленные подтверждённые файловые результаты.

Это делает query-layer более пригодным для:
- ручной операторской работы;
- последующего сервисного слоя;
- будущих межсущностных запросов.

## 4. Выявленные особенности

Команда честно отражает историю confirmed steps.

Если в реестре шагов есть дубли подтверждённых шагов на один и тот же `target_path`, они показываются как отдельные результаты. Это считается не ошибкой команды, а отражением фактической истории шагов.

## 5. Итог

Цикл реализации `list-recent-artifacts` считается завершённым с положительным результатом.

На данном этапе Архивариус уже имеет минимально пригодный query-layer:

- `show-active-step`
- `show-entity-summary`
- `list-confirmed-steps`
- `list-recent-artifacts`
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
- query-layer проверен на живых данных по Сущностям, подтверждённым шагам и последним файловым результатам

## Чего пока не хватает

Следующие возможности ещё не считаются реализованными полностью и относятся к следующей фазе:

- автоматическое согласование регистрационных полей Сущности с фактическим оперативным состоянием
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

git -C "$REPO" add README.md src/archivist/cli.py src/archivist/steps_registry.py
git -C "$REPO" commit -m "Add recent artifacts query command"
git -C "$REPO" push origin "$(git -C "$REPO" branch --show-current)"

echo "Created:"
echo "  $DOC_DIR/0538-1104-2026-list-recent-artifacts-success-log.md"
echo
echo "Git status:"
git -C "$REPO" status --short
