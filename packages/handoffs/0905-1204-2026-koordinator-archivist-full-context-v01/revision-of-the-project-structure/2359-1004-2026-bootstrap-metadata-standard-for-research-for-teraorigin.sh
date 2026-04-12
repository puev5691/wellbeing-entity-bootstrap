#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

PACKET_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/Research-for-teraOrigin"
COPY_MAP="$PACKET_DIR/.wb-copy-map.tsv"

mkdir -p "$PACKET_DIR"

cat > "$PACKET_DIR/2359-1004-2026-metadata-regulation.md" <<'MD_EOF'
# Регламент метаданных для пакета Research-for-teraOrigin

Дата: 2026-04-10
Статус: рабочий регламент
Контур: Research-for-teraOrigin
Назначение: ввести минимальный канонический стандарт метаданных и якорных секций для новых документов пакета `Research-for-teraOrigin`

artifact_type: regulation
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- README-chat-folder.md
- 2248-1004-2026-research-start-context.md
- 2358-1004-2026-evidence-status-regulation.md

## 1. Зачем нужен этот регламент

Пакет `Research-for-teraOrigin` предназначен для повторного использования, копирования и передачи в рабочий чат исследовательской Сущности.

Следовательно, документы внутри пакета должны быть удобны:
- для человека;
- для сортировки по имени;
- для парсинга Архивариусом;
- для будущего формирования списков, handoff и манифестов.

## 2. Главное правило

Каждый новый значимый документ пакета должен содержать:

1. канонический header-блок;
2. однотипные якорные секции;
3. ограниченный словарь служебных значений;
4. достаточно краткое и однозначное имя файла.

## 3. Обязательные поля header-блока

Каждый новый документ должен включать как минимум:

- Дата
- Статус
- Контур
- Назначение
- artifact_type
- entity_scope

## 4. Расширенные поля для технических документов

Для документов, связанных с кодом, запуском, логами, экспериментами или handoff, рекомендуется добавлять:

- phase
- repo_target
- evidence_level
- handoff_to
- related_docs

## 5. Канонические якорные секции

Если документ не является совсем краткой карточкой, в нём желательно использовать повторяемые секции:

- Связанные документы
- Что это за документ
- Входные материалы
- Выходной результат
- Статус доказательств
- Следующий шаг
- Открытые вопросы

Не требуется использовать все секции всегда, но названия должны быть устойчивыми и повторяемыми.

## 6. Что нельзя делать

Нельзя:
- использовать произвольные синонимы для одних и тех же полей;
- путать статус документа и статус доказательства;
- писать related_docs свободным абзацем без структуры;
- называть однотипные документы разными терминами без причины;
- делать header-блок чрезмерно длинным.

## 7. Минимальный принцип

Имя файла помогает найти.
Метаданные помогают понять.
Якорные секции помогают связать.

## 8. Итог

Настоящий регламент обязателен для всех новых значимых документов, создаваемых в пакете `Research-for-teraOrigin`.
MD_EOF

cat > "$PACKET_DIR/0001-1104-2026-metadata-vocabulary.md" <<'MD_EOF'
# Словарь допустимых метаданных для пакета Research-for-teraOrigin

Дата: 2026-04-10
Статус: рабочий словарь
Контур: Research-for-teraOrigin
Назначение: зафиксировать допустимые значения служебных метаданных для документов пакета `Research-for-teraOrigin`

artifact_type: vocabulary
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 2359-1004-2026-metadata-regulation.md
- 2358-1004-2026-evidence-status-regulation.md

## 1. artifact_type

Допустимые значения:

- readme
- chat_card
- start_context
- launch_order
- start_prompt
- plan
- journal
- log
- module_map
- launch_profile
- regulation
- vocabulary
- template
- repo_manifest
- repo_profile
- repo_start_context
- report
- handoff
- summary

## 2. entity_scope

Для текущего пакета каноническое значение:

- Research-for-teraOrigin

Допустимые связанные значения для будущих передач:

- Parent-Event-Contour
- TeraOrigin-Run-And-Fork
- Archivist

## 3. phase

Допустимые значения:

- bootstrap
- research
- run_experiments
- handoff
- rebranding
- archive

## 4. status

Допустимые значения:

- draft
- working
- canonical
- journal_entry
- template
- archived

## 5. evidence_level

Допустимые значения:

- source_confirmed
- run_confirmed
- experiment_confirmed
- log_observed
- hypothesis
- needs_check
- not_applicable

## 6. handoff_to

Допустимые значения:

- Research-for-teraOrigin
- Parent-Event-Contour
- TeraOrigin-Run-And-Fork
- Archivist
- not_applicable

## 7. repo_target

Для текущего пакета каноническое значение:

- /storage/emulated/0/Documents/repos/teraOrigin

Для общих или нетехнических документов допустимо:

- not_applicable

## 8. related_docs

Поле оформляется как маркированный список имён файлов.
Желательно указывать только действительно ключевые связанные документы, а не всё подряд.
MD_EOF

cat > "$PACKET_DIR/0002-1104-2026-metadata-header-template.md" <<'MD_EOF'
# Шаблон header-блока и якорных секций для новых документов

Дата: 2026-04-10
Статус: template
Контур: Research-for-teraOrigin
Назначение: дать готовый шаблон для новых документов пакета `Research-for-teraOrigin`

artifact_type: template
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: not_applicable
handoff_to: Research-for-teraOrigin
related_docs:
- 2359-1004-2026-metadata-regulation.md
- 0001-1104-2026-metadata-vocabulary.md

## 1. Канонический шаблон

Ниже шаблон, который следует копировать в начало новых документов и заполнять по смыслу.

    # Название документа

    Дата: YYYY-MM-DD
    Статус: working
    Контур: Research-for-teraOrigin
    Назначение: кратко и по делу

    artifact_type: plan
    entity_scope: Research-for-teraOrigin
    phase: research
    repo_target: /storage/emulated/0/Documents/repos/teraOrigin
    evidence_level: hypothesis
    handoff_to: Research-for-teraOrigin
    related_docs:
    - имя-файла-1.md
    - имя-файла-2.md

    ## Что это за документ

    ## Связанные документы

    ## Входные материалы

    ## Выходной результат

    ## Статус доказательств

    ## Следующий шаг

    ## Открытые вопросы

## 2. Замечания по использованию

- Не все якорные секции обязательны для каждого документа.
- Для карточек и кратких журналов допустим сокращённый вариант.
- Если документ не связан напрямую с репозиторием, допускается `repo_target: not_applicable`.
- Если уровень доказательств неприменим, использовать `evidence_level: not_applicable`.

## 3. Сокращённый шаблон для журналов

    # Название журнала

    Дата: YYYY-MM-DD
    Статус: journal_entry
    Контур: Research-for-teraOrigin
    Назначение: кратко

    artifact_type: journal
    entity_scope: Research-for-teraOrigin
    phase: research
    repo_target: /storage/emulated/0/Documents/repos/teraOrigin
    evidence_level: source_confirmed
    handoff_to: Research-for-teraOrigin
    related_docs:
    - имя-файла.md
MD_EOF

if [ ! -f "$COPY_MAP" ]; then
    cat > "$COPY_MAP" <<'TSV_EOF'
# filename<TAB>relative-canonical-directory
TSV_EOF
fi

append_if_missing() {
    local line="$1"
    local filename="${line%%	*}"
    if ! grep -Fq "$filename" "$COPY_MAP"; then
        echo "$line" >> "$COPY_MAP"
    fi
}

append_if_missing "2359-1004-2026-metadata-regulation.md	03_LAB/teraorigin_research"
append_if_missing "0001-1104-2026-metadata-vocabulary.md	03_LAB/teraorigin_research"
append_if_missing "0002-1104-2026-metadata-header-template.md	03_LAB/teraorigin_research"

echo "Metadata standard bootstrapped in:"
echo "$PACKET_DIR"
echo
echo "Current files:"
find "$PACKET_DIR" -maxdepth 1 -type f | sort
echo
echo "Updated copy map:"
cat "$COPY_MAP"
