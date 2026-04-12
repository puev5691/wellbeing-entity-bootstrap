#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

PACKET_DIR="/storage/emulated/0/Documents/Blagopoluchie/00_INBOX/my-structure/chats-gpt-name/Research-for-teraOrigin"
COPY_MAP="$PACKET_DIR/.wb-copy-map.tsv"

mkdir -p "$PACKET_DIR"

cat > "$PACKET_DIR/0040-1104-2026-launch-justification-log.md" <<'MD_EOF'
# Журнал завершения подготовки пакета и обоснования запуска нового чата

Дата: 2026-04-11
Статус: journal_entry
Контур: Research-for-teraOrigin
Назначение: зафиксировать, что установочный комплект исследовательской Сущности по `teraOrigin` подготовлен в достаточном объёме и что запуск отдельного специализированного чата является необходимым и обоснованным следующим шагом

artifact_type: journal
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 0020-1104-2026-packet-readiness-card.md
- 0030-1104-2026-installation-kit-completion-log.md
- 2258-1004-2026-chat-launch-order.md
- 2268-1004-2026-start-prompt.md
- 2128-0704-2026-node-research-entity-launch-regulation.md
- 1150-0704-2026-node-research-entity-template.md

## Что это за документ

Это журналная запись, фиксирующая переход от этапа сборки установочного пакета к этапу запуска отдельного специализированного чата `Research-for-teraOrigin`.

## Что уже сделано

На текущем этапе выполнено:

- собран и канонизирован установочный пакет;
- введены правила именования и копирования;
- введён регламент статусов доказательств;
- введён минимальный стандарт метаданных;
- собраны первая и вторая волна обязательных документов;
- подготовлены стартовый промпт и порядок загрузки файлов;
- зафиксирована стабильность базового каталога `/storage/emulated/0/Documents/repos`;
- зафиксирован эталонный репозиторий для чтения и анализа:
  `/storage/emulated/0/Documents/repos/teraOrigin`

## Почему требуется отдельный новый чат

Запуск отдельного специализированного чата требуется потому, что:

- текущий чат выполняет роль ревизионного и организационного контура;
- работа с исходниками `teraOrigin` требует отдельного темпа, отдельного корпуса выводов и отдельной дисциплины;
- исследование, запуск, форк и ребрендинг не должны смешиваться в одном рабочем поле;
- новый чат должен работать как исследовательская Сущность, а не как продолжение общей бюрократической сборки пакета.

## Практическое обоснование

Новый чат нужен не ради красивого дробления сущностей, а ради следующих выгод:

- удержание узкого технического фокуса;
- фиксация результатов исследования в собственном пакете;
- снижение риска расползания контекста;
- подготовка чистого handoff для следующей, запусковой Сущности;
- отделение архитектурной и организационной бюрократии от инженерного чтения кода.

## Итог

Считается установленным, что запуск отдельного чата `Research-for-teraOrigin` является необходимым и обоснованным следующим шагом.
MD_EOF

cat > "$PACKET_DIR/0050-1104-2026-task-for-creation-and-formation-of-chat-entity.md" <<'MD_EOF'
# Задание на создание, формирование и запуск Сущности чата Research-for-teraOrigin

Дата: 2026-04-11
Статус: canonical
Контур: Research-for-teraOrigin
Назначение: зафиксировать официальное задание на запуск нового специализированного чата, работающего как исследовательская Сущность по репозиторию `teraOrigin`

artifact_type: handoff
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 2258-1004-2026-chat-launch-order.md
- 2268-1004-2026-start-prompt.md
- 0040-1104-2026-launch-justification-log.md
- 2128-0704-2026-node-research-entity-launch-regulation.md
- 1150-0704-2026-node-research-entity-template.md

## Что это за документ

Настоящий документ является официальным заданием на создание и формирование рабочего чата `Research-for-teraOrigin` как специализированной исследовательской Сущности.

## Главная цель

Создать и запустить новый чат, который будет:

- системно исследовать репозиторий `teraOrigin`;
- работать с ним как с эталонным источником технической информации;
- не смешивать исследование с запуском форка и хаотичным переписыванием исходников;
- выпускать результаты в виде дисциплинированного корпуса markdown-документов.

## Обязательные шаги создания Сущности

### Шаг 1. Создать новый чат
Новый чат должен иметь имя, совпадающее с именем пакета:

`Research-for-teraOrigin`

### Шаг 2. Передать первую волну документов
Передать в чат:

- README-chat-folder.md
- chat-card.md
- 2248-1004-2026-research-start-context.md
- repo-manifest.md
- repo-profile.md
- repo-start-context.md

### Шаг 3. Передать вторую волну документов
Передать в чат:

- 2030-0804-2026-node-research-journal.md
- 2128-0704-2026-node-research-entity-launch-regulation.md
- 1150-0704-2026-node-research-entity-template.md
- 2238-0604-2026-media-event-crypto-platform-linkage.md
- 2256-0404-2026-repos-stability-protocol.md

### Шаг 4. Передать стартовый промпт
Передать в чат содержимое файла:

- 2268-1004-2026-start-prompt.md

### Шаг 5. Проверить рамку Сущности
После первого ответа убедиться, что новая Сущность:
- приняла эталонный путь к репозиторию;
- приняла правило неприкосновенности `Documents/repos`;
- приняла разделение фаз: исследование → запусковой контур → ребрендинг;
- не начала хаотичное редактирование кода;
- выдала внятный план первой исследовательской фазы.

## Ожидаемый результат

Новый чат должен быть сформирован как рабочая исследовательская Сущность, пригодная для:
- чтения кода;
- ведения журнала исследования;
- построения карты модулей;
- уточнения режимов запуска;
- подготовки handoff для следующей Сущности.
MD_EOF

cat > "$PACKET_DIR/0060-1104-2026-resulting-readiness-test-for-chat-entity.md" <<'MD_EOF'
# Результирующий тест готовности Сущности чата Research-for-teraOrigin

Дата: 2026-04-11
Статус: working
Контур: Research-for-teraOrigin
Назначение: зафиксировать критерии проверки того, что новый чат действительно сформирован как пригодная исследовательская Сущность по репозиторию `teraOrigin`

artifact_type: regulation
entity_scope: Research-for-teraOrigin
phase: bootstrap
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 0050-1104-2026-task-for-creation-and-formation-of-chat-entity.md
- 2258-1004-2026-chat-launch-order.md
- 2268-1004-2026-start-prompt.md

## Что это за документ

Это результирующий тест, который применяется после запуска нового чата.

## Критерии успешного формирования Сущности

### 1. Контекст принят
- [ ] Чат признаёт, что работает с репозиторием `/storage/emulated/0/Documents/repos/teraOrigin`
- [ ] Чат признаёт, что `Documents/repos` является отдельным стабильным техническим контуром
- [ ] Чат не предлагает хаотично переносить или ломать базовый репозиторный контур

### 2. Роль понята правильно
- [ ] Чат понимает, что он исследовательская, а не запусковая Сущность
- [ ] Чат не смешивает исследование, запуск и ребрендинг в одну фазу
- [ ] Чат удерживает технический, а не философский фокус

### 3. Рабочий результат адекватен
- [ ] Чат выдаёт план первой исследовательской фазы
- [ ] Чат опирается на стартовый корпус файлов
- [ ] Чат готов вести журнал чтения кода и карту модулей
- [ ] Чат различает статус вывода: код, запуск, эксперимент, гипотеза, требует проверки

### 4. Отсутствие признаков деградации
- [ ] Чат не уходит в бессмысленный перепис кода
- [ ] Чат не начинает обсуждать общий проект вместо репозитория
- [ ] Чат не предлагает форк раньше handoff

## Итог теста

### Статус проверки
- [ ] Сущность сформирована правильно
- [ ] Требуется коррекция рамки
- [ ] Требуется перезапуск с уточнённым промптом

## Запись после проверки
- дата и время:
- краткий вывод:
- замечания:
MD_EOF

cat > "$PACKET_DIR/0070-1104-2026-first-task-open-research-journal.md" <<'MD_EOF'
# Первая задача для Сущности Research-for-teraOrigin: открыть журнал исследования

Дата: 2026-04-11
Статус: canonical
Контур: Research-for-teraOrigin
Назначение: зафиксировать первую рабочую задачу новой Сущности после прохождения стартового теста готовности

artifact_type: start_context
entity_scope: Research-for-teraOrigin
phase: research
repo_target: /storage/emulated/0/Documents/repos/teraOrigin
evidence_level: source_confirmed
handoff_to: Research-for-teraOrigin
related_docs:
- 2328-1004-2026-code-reading-log.md
- 2338-1004-2026-module-map.md
- 2348-1004-2026-runtime-modes-and-launch-profile.md
- 0060-1104-2026-resulting-readiness-test-for-chat-entity.md

## Что это за документ

Настоящий документ задаёт первую формальную рабочую задачу новой исследовательской Сущности.

## Задача

После принятия контекста и прохождения стартовой проверки новая Сущность должна:

1. открыть документ:
   `2328-1004-2026-code-reading-log.md`

2. создать в нём первую содержательную запись по обязательным файлам первого приоритета:
   - Doc/Rus/README.md
   - README.md
   - Source/package.json
   - Source/run-node.js
   - Source/run-nw.js
   - Source/core/server.js
   - Source/run-test.js

3. на основе первой записи:
   - уточнить карту модулей в `2338-1004-2026-module-map.md`
   - уточнить гипотезу о режимах запуска в `2348-1004-2026-runtime-modes-and-launch-profile.md`

## Ожидаемый первый результат

Сущность должна выдать:
- первую запись в журнале чтения кода;
- первую содержательную правку карты модулей;
- первую уточнённую версию профиля режимов запуска;
- маркировку выводов по статусам доказательств.

## Запрещено на первом шаге

- уходить в запуск форка;
- переписывать код;
- делать выводы без статуса доказательства;
- уходить от обязательных файлов первого приоритета.
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

append_if_missing "0040-1104-2026-launch-justification-log.md	03_LAB/teraorigin_research"
append_if_missing "0050-1104-2026-task-for-creation-and-formation-of-chat-entity.md	03_LAB/teraorigin_research"
append_if_missing "0060-1104-2026-resulting-readiness-test-for-chat-entity.md	03_LAB/teraorigin_research"
append_if_missing "0070-1104-2026-first-task-open-research-journal.md	03_LAB/teraorigin_research"

echo "Created launch bureaucracy files in:"
echo "$PACKET_DIR"
echo
echo "Updated copy map:"
cat "$COPY_MAP"
