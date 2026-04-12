#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

PACKET_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/Research-for-teraOrigin"
COPY_MAP="$PACKET_DIR/.wb-copy-map.tsv"
BACKUP_MAP="$PACKET_DIR/.wb-copy-map.backup-before-canonize.tsv"
REPORT="$PACKET_DIR/0010-1104-2026-canonize-and-complete-packet-report.txt"

mkdir -p "$PACKET_DIR"
: > "$REPORT"

log() {
    echo "$1" | tee -a "$REPORT"
}

rename_if_exists() {
    local old_name="$1"
    local new_name="$2"
    local old_path="$PACKET_DIR/$old_name"
    local new_path="$PACKET_DIR/$new_name"

    if [ -f "$old_path" ]; then
        if [ -f "$new_path" ]; then
            log "SKIP rename, target exists: $new_name"
        else
            mv "$old_path" "$new_path"
            log "RENAMED: $old_name -> $new_name"
        fi
    fi
}

copy_if_exists() {
    local src="$1"
    local dst="$2"
    if [ -f "$src" ]; then
        cp "$src" "$dst"
        log "COPIED: $src -> $dst"
    else
        log "WARN missing source: $src"
    fi
}

if [ -f "$COPY_MAP" ]; then
    cp "$COPY_MAP" "$BACKUP_MAP"
    log "BACKUP created: $BACKUP_MAP"
fi

# 1. Канонизация локальных имён
rename_if_exists "2248-1004-2026-teraorigin-research-entity-start-context.md" "2248-1004-2026-research-start-context.md"
rename_if_exists "2258-1004-2026-chat-launch-order-research-for-teraorigin.md" "2258-1004-2026-chat-launch-order.md"
rename_if_exists "2268-1004-2026-start-prompt-research-for-teraorigin.md" "2268-1004-2026-start-prompt.md"
rename_if_exists "2318-1004-2026-teraorigin-research-work-cycle-plan.md" "2318-1004-2026-work-cycle-plan.md"
rename_if_exists "2328-1004-2026-teraorigin-code-reading-log.md" "2328-1004-2026-code-reading-log.md"
rename_if_exists "2338-1004-2026-teraorigin-module-map.md" "2338-1004-2026-module-map.md"
rename_if_exists "2348-1004-2026-node-runtime-modes-and-launch-profile.md" "2348-1004-2026-runtime-modes-and-launch-profile.md"
rename_if_exists "2358-1004-2026-evidence-status-regulation-for-teraorigin.md" "2358-1004-2026-evidence-status-regulation.md"
rename_if_exists "teraOrigin-repo-manifest.md" "repo-manifest.md"
rename_if_exists "teraOrigin-repo-profile.md" "repo-profile.md"
rename_if_exists "teraOrigin-repo-start-context.md" "repo-start-context.md"

# 2. Копирование второй волны обязательных документов внутрь пакета
copy_if_exists \
"/storage/emulated/0/Documents/Blagopoluchie/03_LAB/journal/2030-0804-2026-research-journal-teraOrigin-node.md" \
"$PACKET_DIR/2030-0804-2026-node-research-journal.md"

copy_if_exists \
"/storage/emulated/0/Documents/Blagopoluchie/09_ADMIN/2128-0704-2026-launch-of-child-entity-for-node-source-code-and-platform-experiments.md" \
"$PACKET_DIR/2128-0704-2026-node-research-entity-launch-regulation.md"

copy_if_exists \
"/storage/emulated/0/Documents/Blagopoluchie/02_PROJECTS/event_contour/1150-0704-2026-template-for-node-research-entity.md" \
"$PACKET_DIR/1150-0704-2026-node-research-entity-template.md"

copy_if_exists \
"/storage/emulated/0/Documents/Blagopoluchie/01_CORE/2238-0604-2026-linkage-of-media-contour-event-accounting-and-crypto-platform.md" \
"$PACKET_DIR/2238-0604-2026-media-event-crypto-platform-linkage.md"

copy_if_exists \
"/storage/emulated/0/Documents/Blagopoluchie/09_ADMIN/2256-0404-2026-repos-rollback-manual-and-protocol.md" \
"$PACKET_DIR/2256-0404-2026-repos-stability-protocol.md"

# 3. Пересобираем launch-order под новый канон
cat > "$PACKET_DIR/2258-1004-2026-chat-launch-order.md" <<'MD_EOF'
# Порядок запуска чата Research-for-teraOrigin

Дата: 2026-04-10
Статус: working
Контур: Research-for-teraOrigin
Назначение: зафиксировать канонический порядок загрузки файлов в чат исследовательской Сущности по репозиторию `teraOrigin`

artifact_type: launch_order
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- README-chat-folder.md
- 2248-1004-2026-research-start-context.md
- repo-manifest.md
- repo-profile.md
- repo-start-context.md
- 2030-0804-2026-node-research-journal.md
- 2128-0704-2026-node-research-entity-launch-regulation.md
- 1150-0704-2026-node-research-entity-template.md
- 2238-0604-2026-media-event-crypto-platform-linkage.md
- 2256-0404-2026-repos-stability-protocol.md

## Что это за документ

Настоящий документ задаёт канонический порядок загрузки файлов для запуска чата `Research-for-teraOrigin`.

## Первая волна загрузки

1. README-chat-folder.md
2. chat-card.md
3. 2248-1004-2026-research-start-context.md
4. repo-manifest.md
5. repo-profile.md
6. repo-start-context.md

## Вторая волна загрузки

7. 2030-0804-2026-node-research-journal.md
8. 2128-0704-2026-node-research-entity-launch-regulation.md
9. 1150-0704-2026-node-research-entity-template.md
10. 2238-0604-2026-media-event-crypto-platform-linkage.md
11. 2256-0404-2026-repos-stability-protocol.md

## Входные материалы

Пакет `Research-for-teraOrigin` и эталонный репозиторий:

`/storage/emulated/0/Documents/repos/teraOrigin`

## Выходной результат

После загрузки двух волн Сущность должна быть готова к дисциплинированной исследовательской фазе без смешивания её с запуском форка и хаотичным редактированием кода.

## Следующий шаг

После загрузки файлов дать стартовый промпт из:

`2268-1004-2026-start-prompt.md`
MD_EOF
log "REWRITTEN: 2258-1004-2026-chat-launch-order.md"

# 4. Пересобираем карту полностью и чисто
cat > "$COPY_MAP" <<'TSV_EOF'
# filename<TAB>relative-canonical-directory
README-chat-folder.md	03_LAB/teraorigin_research
chat-card.md	03_LAB/teraorigin_research
2248-1004-2026-research-start-context.md	03_LAB/teraorigin_research
2258-1004-2026-chat-launch-order.md	03_LAB/teraorigin_research
2268-1004-2026-start-prompt.md	03_LAB/teraorigin_research
2318-1004-2026-work-cycle-plan.md	03_LAB/teraorigin_research
2328-1004-2026-code-reading-log.md	03_LAB/teraorigin_research
2338-1004-2026-module-map.md	03_LAB/teraorigin_research
2348-1004-2026-runtime-modes-and-launch-profile.md	03_LAB/teraorigin_research
2358-1004-2026-evidence-status-regulation.md	03_LAB/teraorigin_research
2359-1004-2026-metadata-regulation.md	03_LAB/teraorigin_research
0001-1104-2026-metadata-vocabulary.md	03_LAB/teraorigin_research
0002-1104-2026-metadata-header-template.md	03_LAB/teraorigin_research
repo-manifest.md	03_LAB/teraorigin_research
repo-profile.md	03_LAB/teraorigin_research
repo-start-context.md	03_LAB/teraorigin_research
2030-0804-2026-node-research-journal.md	03_LAB/teraorigin_research
2128-0704-2026-node-research-entity-launch-regulation.md	03_LAB/teraorigin_research
1150-0704-2026-node-research-entity-template.md	03_LAB/teraorigin_research
2238-0604-2026-media-event-crypto-platform-linkage.md	03_LAB/teraorigin_research
2256-0404-2026-repos-stability-protocol.md	03_LAB/teraorigin_research
TSV_EOF
log "REWRITTEN: $COPY_MAP"

log ""
log "FINAL FILE LIST:"
find "$PACKET_DIR" -maxdepth 1 -type f | sort | tee -a "$REPORT"

log ""
log "DONE."
log "Report saved to: $REPORT"
