#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

BASE="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/Research-for-teraOrigin"

INIT="$BASE/00_INIT_MINIMUM"
CORE="$BASE/10_CONTEXT_CORE"
MISSION="$BASE/20_CONTEXT_MISSION"
WORK="$BASE/30_WORK_TEMPLATES"
SERVICE="$BASE/90_SERVICE"

mkdir -p "$INIT" "$CORE" "$MISSION" "$WORK" "$SERVICE"

copy_if_exists() {
    local src="$1"
    local dst="$2"
    if [ -f "$src" ]; then
        cp "$src" "$dst"
    fi
}

# ---------- 00_INIT_MINIMUM ----------
cat > "$INIT/0000-1104-2026-launch-checklist.md" <<'MD_EOF'
# Чеклист запуска чата Research-for-teraOrigin

Дата: 2026-04-11
Статус: canonical
Контур: Research-for-teraOrigin
Назначение: дать оператору короткий и устойчивый порядок запуска нового чата без метаний по окнам и каталогам

artifact_type: regulation
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 0001-1104-2026-file-delivery-conveyor-regulation.md
- 0002-1104-2026-start-prompt-minimum.md
- 0003-1104-2026-first-capability-test.md

## Шаг 1. Загрузить только файлы из 00_INIT_MINIMUM

Загружаются только:
- README-chat-folder.md
- chat-card.md
- 0001-1104-2026-file-delivery-conveyor-regulation.md
- 0002-1104-2026-start-prompt-minimum.md
- 0003-1104-2026-first-capability-test.md

## Шаг 2. Передать стартовый промпт

После загрузки файлов передать в чат содержимое:
- 0002-1104-2026-start-prompt-minimum.md

## Шаг 3. Проверить конвейер

Сущность должна в ответ выдать bash-скрипт, который создаёт тестовый markdown-файл.
Если она начинает писать путь, имя файла и просто содержимое без нормального .sh-конвейера, инициализация считается неудачной.

## Шаг 4. Только после успешного теста загрузить 10_CONTEXT_CORE

## Шаг 5. Потом загрузить 20_CONTEXT_MISSION

## Шаг 6. Затем выдать первую рабочую задачу из 30_WORK_TEMPLATES
MD_EOF

cat > "$INIT/0001-1104-2026-file-delivery-conveyor-regulation.md" <<'MD_EOF'
# Регламент конвейера выдачи файлов для чата Research-for-teraOrigin

Дата: 2026-04-11
Статус: canonical
Контур: Research-for-teraOrigin
Назначение: зафиксировать обязательный способ выдачи файлов новой Сущностью, чтобы её ответы были пригодны для быстрой работы на планшете через Termux

artifact_type: regulation
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 0002-1104-2026-start-prompt-minimum.md
- 0003-1104-2026-first-capability-test.md

## Главное правило

По умолчанию, когда пользователь просит создать или обновить файл, Сущность должна выдавать результат не в виде:
- отдельного пути,
- отдельного имени файла,
- отдельного содержимого для ручной вставки,

а в виде одного готового shell-скрипта `.sh`, который создаёт нужный файл или пакет файлов через `cat <<'EOF'`.

## Обязательный формат ответа

1. Коротко указать назначение скрипта.
2. Дать один непрерывный bash-блок.
3. Внутри bash-блока:
   - задать полный путь;
   - создать нужные каталоги через `mkdir -p`;
   - создать файл или файлы через `cat > "..." <<'EOF'`;
   - при необходимости сделать `chmod +x`.

## Правила

- Не использовать разорванную выдачу “путь / имя / содержимое”.
- Не заставлять пользователя вручную собирать файл по кускам.
- Когда создаётся несколько связанных файлов, предпочитать один общий `.sh`.
- Для markdown-файлов избегать вложенных fenced code blocks внутри самого содержимого файла, если это не критически необходимо.
- Имена файлов держать латиницей и с дефисами.
- Для значимых новых документов использовать header-блок по действующему шаблону метаданных.

## Исключение

Только если пользователь явно просит выдать просто текст файла без shell-скрипта, можно отступить от этого правила.
MD_EOF

cat > "$INIT/0002-1104-2026-start-prompt-minimum.md" <<'MD_EOF'
Этот чат является специализированной исследовательской Сущностью по репозиторию `teraOrigin`.

Сейчас твоя первая задача не в том, чтобы сразу исследовать весь репозиторий, а в том, чтобы принять рабочую рамку и встроиться в правильный конвейер выдачи файлов.

Базовый репозиторий для будущей работы:
`/storage/emulated/0/Documents/repos/teraOrigin`

Базовое правило:
каталог `/storage/emulated/0/Documents/repos` является отдельным стабильным техническим контуром и не подлежит хаотичной реструктуризации, переносу или смешиванию с документационными каталогами.

Главное правило выдачи файлов в этом чате:
когда пользователь просит создать или обновить файл, ты по умолчанию должен выдавать результат как один готовый shell-скрипт `.sh`, который создаёт нужный файл или пакет файлов через `cat <<'EOF'`, а не как набор отдельных инструкций “путь / имя / содержимое”.

Не заставляй пользователя вручную собирать файл из кусков.
Не переходи к исследованию кода, пока не подтвердил, что принял этот конвейер.

Сначала выполни только тестовую задачу из файла `0003-1104-2026-first-capability-test.md`.

В первом ответе:
- кратко подтверди, что принял правило shell-конвейера;
- затем выдай ровно один bash-скрипт для тестовой задачи;
- не расползайся в лишние объяснения.
MD_EOF

cat > "$INIT/0003-1104-2026-first-capability-test.md" <<'MD_EOF'
# Первый тест способности работать в правильном конвейере

Дата: 2026-04-11
Статус: canonical
Контур: Research-for-teraOrigin
Назначение: проверить, что новая Сущность умеет выдавать файлы в виде shell-скрипта, а не в виде рассыпанного текста

artifact_type: regulation
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: not_applicable
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin

## Тестовая задача

Сущность должна выдать один bash-скрипт, который создаёт файл:

`/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/Research-for-teraOrigin/00_TESTS/001-1104-2026-conveyor-test.md`

## Содержимое тестового файла

В тестовом markdown-файле должны быть:

заголовок:
`# Тест конвейера выдачи файлов`

и короткий текст:
`Сущность умеет выдавать файлы через shell-скрипт.`

## Критерий успеха

Тест считается пройденным, если новая Сущность:
- не разрывает ответ на путь, имя и текст;
- не заставляет собирать файл вручную;
- выдаёт один цельный bash-скрипт.
MD_EOF

copy_if_exists "$BASE/README-chat-folder.md" "$INIT/README-chat-folder.md"
copy_if_exists "$BASE/chat-card.md" "$INIT/chat-card.md"

# ---------- 10_CONTEXT_CORE ----------
copy_if_exists "$BASE/2248-1004-2026-research-start-context.md" "$CORE/2248-1004-2026-research-start-context.md"
copy_if_exists "$BASE/repo-manifest.md" "$CORE/repo-manifest.md"
copy_if_exists "$BASE/repo-profile.md" "$CORE/repo-profile.md"
copy_if_exists "$BASE/repo-start-context.md" "$CORE/repo-start-context.md"

# ---------- 20_CONTEXT_MISSION ----------
copy_if_exists "$BASE/2030-0804-2026-node-research-journal.md" "$MISSION/2030-0804-2026-node-research-journal.md"
copy_if_exists "$BASE/2128-0704-2026-node-research-entity-launch-regulation.md" "$MISSION/2128-0704-2026-node-research-entity-launch-regulation.md"
copy_if_exists "$BASE/1150-0704-2026-node-research-entity-template.md" "$MISSION/1150-0704-2026-node-research-entity-template.md"
copy_if_exists "$BASE/2238-0604-2026-media-event-crypto-platform-linkage.md" "$MISSION/2238-0604-2026-media-event-crypto-platform-linkage.md"
copy_if_exists "$BASE/2256-0404-2026-repos-stability-protocol.md" "$MISSION/2256-0404-2026-repos-stability-protocol.md"

# ---------- 30_WORK_TEMPLATES ----------
copy_if_exists "$BASE/2318-1004-2026-work-cycle-plan.md" "$WORK/2318-1004-2026-work-cycle-plan.md"
copy_if_exists "$BASE/2328-1004-2026-code-reading-log.md" "$WORK/2328-1004-2026-code-reading-log.md"
copy_if_exists "$BASE/2338-1004-2026-module-map.md" "$WORK/2338-1004-2026-module-map.md"
copy_if_exists "$BASE/2348-1004-2026-runtime-modes-and-launch-profile.md" "$WORK/2348-1004-2026-runtime-modes-and-launch-profile.md"
copy_if_exists "$BASE/2358-1004-2026-evidence-status-regulation.md" "$WORK/2358-1004-2026-evidence-status-regulation.md"
copy_if_exists "$BASE/2359-1004-2026-metadata-regulation.md" "$WORK/2359-1004-2026-metadata-regulation.md"
copy_if_exists "$BASE/0001-1104-2026-metadata-vocabulary.md" "$WORK/0001-1104-2026-metadata-vocabulary.md"
copy_if_exists "$BASE/0002-1104-2026-metadata-header-template.md" "$WORK/0002-1104-2026-metadata-header-template.md"
copy_if_exists "$BASE/0060-1104-2026-resulting-readiness-test-for-chat-entity.md" "$WORK/0060-1104-2026-resulting-readiness-test-for-chat-entity.md"
copy_if_exists "$BASE/0070-1104-2026-first-task-open-research-journal.md" "$WORK/0070-1104-2026-first-task-open-research-journal.md"

# ---------- 90_SERVICE ----------
copy_if_exists "$BASE/.wb-copy-map.backup-before-canonize.tsv" "$SERVICE/.wb-copy-map.backup-before-canonize.tsv"
copy_if_exists "$BASE/0010-1104-2026-canonize-and-complete-packet-report.txt" "$SERVICE/0010-1104-2026-canonize-and-complete-packet-report.txt"
copy_if_exists "$BASE/0020-1104-2026-packet-readiness-card.md" "$SERVICE/0020-1104-2026-packet-readiness-card.md"
copy_if_exists "$BASE/0030-1104-2026-installation-kit-completion-log.md" "$SERVICE/0030-1104-2026-installation-kit-completion-log.md"
copy_if_exists "$BASE/0040-1104-2026-launch-justification-log.md" "$SERVICE/0040-1104-2026-launch-justification-log.md"
copy_if_exists "$BASE/0050-1104-2026-task-for-creation-and-formation-of-chat-entity.md" "$SERVICE/0050-1104-2026-task-for-creation-and-formation-of-chat-entity.md"

echo "Built operator launch structure:"
echo "$BASE"
echo
echo "Subdirectories:"
find "$BASE" -maxdepth 1 -mindepth 1 -type d | sort
echo
echo "00_INIT_MINIMUM files:"
find "$INIT" -maxdepth 1 -type f | sort
