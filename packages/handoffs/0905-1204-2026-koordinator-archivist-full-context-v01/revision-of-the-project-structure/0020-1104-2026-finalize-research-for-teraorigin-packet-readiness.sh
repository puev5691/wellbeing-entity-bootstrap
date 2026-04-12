#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

PACKET_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/Research-for-teraOrigin"
COPY_MAP="$PACKET_DIR/.wb-copy-map.tsv"

mkdir -p "$PACKET_DIR"

cat > "$PACKET_DIR/0020-1104-2026-packet-readiness-card.md" <<'MD_EOF'
# Карточка готовности пакета Research-for-teraOrigin

Дата: 2026-04-11
Статус: canonical
Контур: Research-for-teraOrigin
Назначение: зафиксировать, что установочный пакет исследовательской Сущности по `teraOrigin` собран, канонизирован и готов к использованию в одноимённом чате

artifact_type: chat_card
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- README-chat-folder.md
- 2258-1004-2026-chat-launch-order.md
- 2268-1004-2026-start-prompt.md
- 2030-0804-2026-node-research-journal.md
- 2128-0704-2026-node-research-entity-launch-regulation.md
- 1150-0704-2026-node-research-entity-template.md
- 2238-0604-2026-media-event-crypto-platform-linkage.md
- 2256-0404-2026-repos-stability-protocol.md

## Что это за документ

Это карточка готовности пакета к запуску исследовательской Сущности.

## Состояние пакета

Пакет:
- собран;
- канонизирован по именам файлов;
- укомплектован первой и второй волной документов;
- снабжён картой `.wb-copy-map.tsv`;
- снабжён метарегламентом и словарём метаданных;
- снабжён стартовым промптом и порядком запуска.

## Базовый репозиторий

`/storage/emulated/0/Documents/repos/teraOrigin`

## Готовность

Пакет считается готовым для:
- загрузки в чат `Research-for-teraOrigin`;
- запуска исследовательской Сущности;
- подготовки аналитического handoff для следующего, запускового контура.

## Следующий шаг

Открыть чат `Research-for-teraOrigin`, загрузить первую и вторую волну документов по `2258-1004-2026-chat-launch-order.md`, затем передать `2268-1004-2026-start-prompt.md`.
MD_EOF

cat > "$PACKET_DIR/0030-1104-2026-installation-kit-completion-log.md" <<'MD_EOF'
# Журнал завершения сборки установочного комплекта Research-for-teraOrigin

Дата: 2026-04-11
Статус: journal_entry
Контур: Research-for-teraOrigin
Назначение: зафиксировать завершение формирования установочного пакета исследовательской Сущности по репозиторию `teraOrigin`

artifact_type: journal
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 0020-1104-2026-packet-readiness-card.md
- README-chat-folder.md
- 2359-1004-2026-metadata-regulation.md
- 0001-1104-2026-metadata-vocabulary.md
- 0002-1104-2026-metadata-header-template.md

## Что это за документ

Это журнал фиксации факта, что пакет `Research-for-teraOrigin` дошёл до состояния пригодного установочного комплекта.

## Что было выполнено

В составе пакета собраны:
- README и карточка пакета;
- стартовый контекст;
- порядок запуска чата;
- стартовый промпт;
- рабочий план нулевой фазы;
- журнал чтения кода;
- карта модулей;
- профиль режимов запуска;
- регламент статусов доказательств;
- регламент метаданных;
- словарь допустимых метаданных;
- шаблон header-блока;
- репозиторный манифест;
- репозиторный профиль;
- стартовый кодовый контекст;
- исследовательский журнал по `teraOrigin`;
- регламент запуска дочерней Сущности;
- шаблон исследования ноды;
- архитектурный документ о связке медиаконтура, событийного учёта и криптоплатформы;
- протокол стабильности `repos`.

## Что особенно важно

Пакет:
- не смешивает исследование, запуск и ребрендинг;
- опирается на стабильный эталонный репозиторий;
- допускает повторное копирование и повторный запуск;
- пригоден для дальнейшего handoff между сущностями.

## Итог

Установочный комплект `Research-for-teraOrigin` считается собранным и пригодным к эксплуатации.
MD_EOF

append_if_missing() {
    local line="$1"
    local filename="${line%%	*}"
    if ! grep -Fq "$filename" "$COPY_MAP"; then
        echo "$line" >> "$COPY_MAP"
    fi
}

append_if_missing "0020-1104-2026-packet-readiness-card.md	03_LAB/teraorigin_research"
append_if_missing "0030-1104-2026-installation-kit-completion-log.md	03_LAB/teraorigin_research"

echo "Created:"
echo "$PACKET_DIR/0020-1104-2026-packet-readiness-card.md"
echo "$PACKET_DIR/0030-1104-2026-installation-kit-completion-log.md"
echo
echo "Updated copy map:"
cat "$COPY_MAP"
