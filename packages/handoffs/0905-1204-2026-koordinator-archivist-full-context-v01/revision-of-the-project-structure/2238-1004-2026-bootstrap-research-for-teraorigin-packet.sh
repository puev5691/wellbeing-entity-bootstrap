#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

PACKET_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/Research-for-teraOrigin"

REPO_MANIFEST_SRC="/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/repo_manifests/teraOrigin-repo-manifest.md"
REPO_PROFILE_SRC="/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/repo_reports/teraOrigin-repo-profile.md"
REPO_START_CTX_SRC="/storage/emulated/0/Documents/Blagopoluchie/_ARCHIVIST/repo_reports/teraOrigin-repo-start-context.md"

mkdir -p "$PACKET_DIR"

cat > "$PACKET_DIR/README-chat-folder.md" <<'MD_EOF'
# README пакета Research-for-teraOrigin

Дата: 2026-04-10
Статус: стартовый пакет контекста
Контур: Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name
Назначение: дать специализированной Сущности `Research-for-teraOrigin` достаточный стартовый набор контекста для системного изучения репозитория `teraOrigin` без смешивания этой работы с запусковым и форковым контуром

## 1. Роль пакета

Этот пакет предназначен для Сущности, которая должна:

- дочитать и доуточнить репозиторий `teraOrigin`
- собрать карту ключевых файлов и модулей
- уточнить реальные точки входа
- подготовить аналитический handoff для следующей, запусковой Сущности

## 2. Что НЕ является задачей этой Сущности

На данном этапе не требуется:

- хаотично редактировать исходники
- запускать форк без подготовленного плана
- смешивать исследование, запуск и ребрендинг в одном рабочем поле
- превращать исходный репозиторий в полигон бесконтрольных экспериментов

## 3. Эталонный репозиторий для чтения

Основной путь:

`/storage/emulated/0/Documents/repos/teraOrigin`

Этот каталог следует считать эталонной рабочей копией для анализа и чтения.

## 4. Состав пакета

В пакет входят:

- настоящий README
- карточка пакета
- стартовый handoff-файл
- репозиторный манифест
- репозиторный профиль
- стартовый кодовый контекст

## 5. Внешние документы, на которые следует опираться

Ключевые документы вне пакета:

- `/storage/emulated/0/Documents/Blagopoluchie/03_LAB/journal/2030-0804-2026-research-journal-teraOrigin-node.md`
- `/storage/emulated/0/Documents/Blagopoluchie/09_ADMIN/2128-0704-2026-launch-of-child-entity-for-node-source-code-and-platform-experiments.md`
- `/storage/emulated/0/Documents/Blagopoluchie/02_PROJECTS/event_contour/1150-0704-2026-template-for-node-research-entity.md`
- `/storage/emulated/0/Documents/Blagopoluchie/01_CORE/2238-0604-2026-linkage-of-media-contour-event-accounting-and-crypto-platform.md`
- `/storage/emulated/0/Documents/Blagopoluchie/09_ADMIN/2256-0404-2026-repos-rollback-manual-and-protocol.md`

## 6. Ожидаемый результат работы Сущности

На выходе желательно получить:

- карту модулей и каталогов `teraOrigin`
- карту точек входа
- карту зависимостей
- список зон для будущего ребрендинга
- список непонятных мест, требующих запускового эксперимента
- handoff-пакет для следующей, экспериментально-запусковой Сущности
MD_EOF

cat > "$PACKET_DIR/chat-card.md" <<'MD_EOF'
# Карточка пакета

Имя пакета: Research-for-teraOrigin
Дата создания: 2026-04-10
Тип: стартовый исследовательский пакет
Назначение: системное изучение репозитория `teraOrigin`
Базовый репозиторий: /storage/emulated/0/Documents/repos/teraOrigin
Следующий контур после завершения: запуск и форк-эксперименты
MD_EOF

cat > "$PACKET_DIR/.wb-copy-map.tsv" <<'TSV_EOF'
# filename<TAB>relative-canonical-directory
README-chat-folder.md	03_LAB/teraorigin_research
chat-card.md	03_LAB/teraorigin_research
2248-1004-2026-teraorigin-research-entity-start-context.md	03_LAB/teraorigin_research
teraOrigin-repo-manifest.md	03_LAB/teraorigin_research
teraOrigin-repo-profile.md	03_LAB/teraorigin_research
teraOrigin-repo-start-context.md	03_LAB/teraorigin_research
TSV_EOF

cat > "$PACKET_DIR/2248-1004-2026-teraorigin-research-entity-start-context.md" <<'MD_EOF'
# Стартовый контекст исследовательской Сущности по teraOrigin

Дата: 2026-04-10
Статус: стартовый файл передачи контекста
Контур: пакет исследовательской Сущности
Назначение: дать новой Сущности собранный и упорядоченный старт для анализа репозитория `teraOrigin`

## 1. Главная задача

Новая Сущность должна исследовать репозиторий `teraOrigin` и подготовить аналитический пакет для следующего, запускового этапа.

## 2. Репозиторий для анализа

`/storage/emulated/0/Documents/repos/teraOrigin`

## 3. Что читать в первую очередь

- `Doc/Rus/README.md`
- `README.md`
- `Source/package.json`
- `Source/run-node.js`
- `Source/run-nw.js`
- `Source/core/server.js`
- `Source/run-test.js`

## 4. Что смотреть дополнительно

- `LICENSE`
- `run-node.bat`
- `run-nw.bat`

## 5. Основные внешние документы контекста

- `/storage/emulated/0/Documents/Blagopoluchie/03_LAB/journal/2030-0804-2026-research-journal-teraOrigin-node.md`
- `/storage/emulated/0/Documents/Blagopoluchie/09_ADMIN/2128-0704-2026-launch-of-child-entity-for-node-source-code-and-platform-experiments.md`
- `/storage/emulated/0/Documents/Blagopoluchie/02_PROJECTS/event_contour/1150-0704-2026-template-for-node-research-entity.md`
- `/storage/emulated/0/Documents/Blagopoluchie/01_CORE/2238-0604-2026-linkage-of-media-contour-event-accounting-and-crypto-platform.md`
- `/storage/emulated/0/Documents/Blagopoluchie/09_ADMIN/2256-0404-2026-repos-rollback-manual-and-protocol.md`

## 6. Что требуется подготовить по итогам

- обзор структуры `teraOrigin`
- обзор ключевых модулей
- обзор зависимостей
- обзор точек входа
- предварительный список зон ребрендинга
- перечень вопросов для запусковой Сущности
MD_EOF

copy_if_exists() {
    local src="$1"
    local dst="$2"
    if [ -f "$src" ]; then
        cp "$src" "$dst"
    else
        echo "WARN: missing file: $src"
    fi
}

copy_if_exists "$REPO_MANIFEST_SRC" "$PACKET_DIR/teraOrigin-repo-manifest.md"
copy_if_exists "$REPO_PROFILE_SRC" "$PACKET_DIR/teraOrigin-repo-profile.md"
copy_if_exists "$REPO_START_CTX_SRC" "$PACKET_DIR/teraOrigin-repo-start-context.md"

echo "Created Research-for-teraOrigin packet:"
echo "$PACKET_DIR"
echo
echo "Files:"
find "$PACKET_DIR" -maxdepth 1 -type f | sort
