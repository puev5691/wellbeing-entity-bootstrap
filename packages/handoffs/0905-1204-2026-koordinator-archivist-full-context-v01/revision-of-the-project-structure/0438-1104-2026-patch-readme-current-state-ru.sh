#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-archivist"
README="$REPO/README.md"
BACKUP_DIR="$REPO/.wb-backups-readme"

mkdir -p "$BACKUP_DIR"

if [ ! -f "$README" ]; then
  echo "README not found: $README" >&2
  exit 1
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
cp "$README" "$BACKUP_DIR/README.md.$STAMP.bak"

python3 - "$README" <<'PY'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

begin = "<!-- BEGIN: archivist-current-state -->"
end = "<!-- END: archivist-current-state -->"

block = """<!-- BEGIN: archivist-current-state -->

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

## Что это означает

Архивариус уже умеет учитывать:

- проектные Сущности, включая Координатора и специализированные дочерние Сущности
- жизненный цикл шага:
  - `script_issued`
  - `script_executed`
  - `artifact_confirmed`
- фазовый барьер, не позволяющий накладывать новый активный шаг поверх незавершённого шага той же Сущности

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

## Чего пока не хватает

Следующие возможности ещё не считаются реализованными полностью и относятся к следующей фазе:

- `show-active-step`
- `show-entity-summary`
- быстрый вывод подтверждённых шагов как краткой операционной сводки
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

<!-- END: archivist-current-state -->
"""

if begin in text and end in text:
    start = text.index(begin)
    finish = text.index(end) + len(end)
    text = text[:start] + block + text[finish:]
else:
    lines = text.splitlines()
    if lines and lines[0].startswith("# "):
        insert_at = 1
        while insert_at < len(lines) and lines[insert_at].strip() == "":
            insert_at += 1
        new_lines = lines[:insert_at] + ["", block, ""] + lines[insert_at:]
        text = "\n".join(new_lines)
    else:
        text = block + "\n\n" + text

path.write_text(text, encoding="utf-8")
PY

echo "README patched: $README"
echo "Backup: $BACKUP_DIR/README.md.$STAMP.bak"
