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
import re

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")

old_state_block = """## Текущее состояние

Архивариус уже не является только проектной идеей.

На текущем этапе он работает как локальный CLI-инструмент с SQLite-базой и практической поддержкой реального рабочего пакета чата.

Реализованные возможности:

- инициализация SQLite-базы
- полная индексация и переиндексация
- поиск по имени файла
- поиск по текстовому содержимому
- распознавание пакета чата
- чтение `.wb-copy-map.tsv`
- показ разобранной карты раскладки
- генерация черновика карты раскладки
- мягкая классификация файлов пакета
- проверка покрытия карты раскладки
- рекомендации по пополнению `.wb-copy-map.tsv`
"""

new_state_block = """## Базовые функции индексатора и анализа пакетов

Архивариус уже не является только проектной идеей.

На текущем этапе он работает как локальный CLI-инструмент с SQLite-базой и практической поддержкой реальных рабочих пакетов чатов.

Базовые реализованные возможности:

- инициализация SQLite-базы
- полная индексация и переиндексация
- поиск по имени файла
- поиск по текстовому содержимому
- распознавание пакета чата
- чтение `.wb-copy-map.tsv`
- показ разобранной карты раскладки
- генерация черновика карты раскладки
- мягкая классификация файлов пакета
- показ отчёта по статусам файлов пакета
- проверка покрытия карты раскладки
- рекомендации по пополнению `.wb-copy-map.tsv`
- построение context manifest
- построение repo manifest
- построение repo profile
- построение repo start context
"""

if old_state_block in text:
    text = text.replace(old_state_block, new_state_block, 1)

pattern = re.compile(
    r"## Текущие CLI-команды\n\nНа текущем этапе Архивариус предоставляет такие команды:\n\n(?:    .+\n)+",
    re.MULTILINE
)

replacement = """## Текущие CLI-команды

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
"""

text, count = pattern.subn(replacement, text, count=1)
if count == 0:
    raise SystemExit("CLI section pattern not found in README.md")

path.write_text(text, encoding="utf-8")
PY

echo "README normalized: $README"
echo "Backup: $BACKUP_DIR/README.md.$STAMP.bak"
