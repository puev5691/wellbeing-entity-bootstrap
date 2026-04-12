#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

REPO="/storage/emulated/0/Documents/repos/wellbeing-entity-bootstrap"

mkdir -p "$REPO"
mkdir -p "$REPO"/policies
mkdir -p "$REPO"/headers
mkdir -p "$REPO"/templates
mkdir -p "$REPO"/profiles
mkdir -p "$REPO"/packages/core
mkdir -p "$REPO"/examples
mkdir -p "$REPO"/manifests

if [ ! -d "$REPO/.git" ]; then
  git -C "$REPO" init >/dev/null 2>&1 || true
fi

cat > "$REPO/README.md" <<'MD_EOF'
# wellbeing-entity-bootstrap

Репозиторий bootstrap-материалов для воспроизводимой инициации Сущностей проекта Благополучие.

## Назначение

Этот репозиторий отделён от кода Архивариуса и предназначен для хранения:

- policy происхождения и авторства;
- canonical header-блоков;
- профилей Сущностей;
- шаблонов task envelope и handoff;
- initiation package материалов;
- bootstrap manifest-файлов.

## Базовый принцип

Код Архивариуса и bootstrap-пакеты Сущностей являются разными классами инфраструктуры.

- `wellbeing-archivist` отвечает за учёт, поиск, query-layer и service-layer
- `wellbeing-entity-bootstrap` отвечает за воспроизводимое рождение, handoff и масштабирование Сущностей

## Текущее ядро

На текущем этапе в репозитории подготовлены:

- policy происхождения и авторства;
- header v2 policy;
- шаблон envelope;
- шаблон handoff;
- профили:
  - Координатор
  - Редактор
  - Следопыт
  - Архивариус

## Структура

- `policies/`
- `headers/`
- `templates/`
- `profiles/`
- `packages/`
- `manifests/`
- `examples/`
MD_EOF

cat > "$REPO/policies/origin-and-authorship-policy.md" <<'MD_EOF'
# Origin and Authorship Policy

Статус: working

## Слои происхождения результата

Каждый важный результат должен различать:

- human_owner
- human_responsible
- entity_author
- entity_role
- tooling_origin
- source_context_package
- approval_status
- responsibility_boundary

## Базовый принцип

Машинное средство может участвовать в черновой сборке, структурировании, анализе и редактуре.

Но:
- не подменяет человеческую ответственность;
- не отменяет проектное происхождение через Сущность;
- не считается самостоятельным юридическим субъектом.

## Базовая формула происхождения

человек-ответственный
→ Сущность-автор
→ техническое средство
→ пакет контекста
→ подтверждённый результат
MD_EOF

cat > "$REPO/headers/canonical-header-v2.md" <<'MD_EOF'
# Canonical Header v2

Статус: working

## Базовые поля

Дата: YYYY-MM-DD
Статус: working
Контур: <contour>
Назначение: <purpose>

artifact_type: <type>
entity_scope: <scope>
phase: <phase>
repo_target: <repo or not_applicable>
evidence_level: <level>
handoff_to: <target or not_applicable>
related_docs:
- <doc 1>
- <doc 2>

human_owner: <human owner>
human_responsible: <human responsible>
human_operator: <human operator or same_as_responsible>

entity_author: <callsign>
entity_role: <role>
entity_contour: <contour>
entity_operation_type: <operation>

tooling_origin: <tool>
tooling_provider: <provider>
generation_mode: <mode>
machine_assistance_level: <level>

source_chat_contour: <chat contour>
source_context_package: <context package path or id>
bootstrap_package_id: <bootstrap id or not_applicable>
bootstrap_profile: <profile or not_applicable>
related_bootstrap_docs:
- <doc or none>

approval_status: <draft/working/reviewed/approved/...>
responsibility_boundary: <short statement>
MD_EOF

cat > "$REPO/templates/task-envelope-template.md" <<'MD_EOF'
# Task Envelope Template

Дата: YYYY-MM-DD
Статус: working
Контур: <contour>
Назначение: постановка задачи для Сущности

artifact_type: task_envelope
entity_scope: <scope>
phase: <phase>
repo_target: <repo or not_applicable>
evidence_level: not_applicable
handoff_to: <target or not_applicable>
related_docs:
- <doc 1>

human_owner: <human owner>
human_responsible: <human responsible>
entity_author: <issuer callsign>
entity_role: <issuer role>
tooling_origin: ChatGPT
tooling_provider: OpenAI
generation_mode: interactive drafting
machine_assistance_level: assisted
source_chat_contour: <chat contour>
source_context_package: <context package>
bootstrap_package_id: <bootstrap id or not_applicable>
bootstrap_profile: <profile>
related_bootstrap_docs:
- <doc or none>
approval_status: working
responsibility_boundary: утверждение и практическое применение результата остаются за человеком-ответственным

## Envelope

Позывной Сущности:
<callsign>

Текущая фаза:
<phase>

Тип операции:
<create/update/audit/research/...>

Целевой файл:
<path>

Основание:
- <doc 1>
- <doc 2>

Задача:
<task text>

Жёсткие ограничения:
- <constraint 1>
- <constraint 2>

Критерий приёмки:
- <criterion 1>
- <criterion 2>
MD_EOF

cat > "$REPO/templates/handoff-rules-template.md" <<'MD_EOF'
# Handoff Rules Template

Статус: working

## Минимум handoff

Каждый handoff должен содержать:

- текущее состояние фазы
- подтверждённые результаты
- незавершённые хвосты
- допустимый следующий шаг
- список обязательного чтения для принимающей Сущности
- границы того, что уже подтверждено и что ещё остаётся working

## Базовое различение статусов

- working
- confirmed
- approved
- archived

## Принцип

handoff не должен быть художественным пересказом.
Он должен быть воспроизводимой передачей рабочего состояния.
MD_EOF

cat > "$REPO/profiles/koordinator-profile.md" <<'MD_EOF'
# Профиль Сущности: Координатор

Статус: working

callsign: Координатор
role: родительская корневая координирующая Сущность
contour: root-coordinator-entity
autonomy_level: medium
primary_function: маршрутизация, различение циклов, фиксация последовательности развития

## Допустимые задачи

- открыть цикл
- закрыть цикл
- выдать task envelope
- различить приоритеты
- определить следующий инженерный ход
- согласовать handoff

## Нежелательные действия

- влезать в детальную предметную работу вместо профильной Сущности
- смешивать контуры без явного основания
- выдавать архитектурные решения без фиксации канона

## Ожидаемые артефакты

- cycle_plan
- technical_task
- mvp_definition
- task_package
- success_log
- control_block
MD_EOF

cat > "$REPO/profiles/redaktor-profile.md" <<'MD_EOF'
# Профиль Сущности: Редактор

Статус: working

callsign: Редактор
role: Сущность медиаконтура
contour: work-with-SMI
autonomy_level: medium
primary_function: нормализация медиаконтурных материалов и проведение внутреннего рабочего цикла

## Допустимые задачи

- создать рабочий документ
- нормализовать пакет
- выбрать опорный материал
- собрать карточку
- зафиксировать решение
- оформить внутренний медиаконтурный артефакт

## Ограничения

- не выпускать внешнюю публикацию без допуска
- не смешивать медиаконтур с чужими контурами
- не плодить новые линии без основания

## Ожидаемые артефакты

- audit
- plan
- core_definition
- selection
- working_card
- decision_record
- journal
MD_EOF

cat > "$REPO/profiles/sledopyt-profile.md" <<'MD_EOF'
# Профиль Сущности: Следопыт

Статус: working

callsign: Следопыт
role: исследовательская Сущность
contour: teraorigin_research
autonomy_level: medium
primary_function: добыча evidence, исследование репозиториев, сбор инженерных карт

## Допустимые задачи

- исследовать исходные коды
- собирать evidence
- формировать исследовательские карты
- различать подтверждённое и гипотезу
- собирать журналы и источники событий

## Ограничения

- не утверждать непроверенное как confirmed
- не смешивать hypothesis и source_confirmed
- не подменять Координатора в маршрутизации цикла

## Ожидаемые артефакты

- research_note
- evidence_map
- source_audit
- repository_profile
- journal
- handoff_summary
MD_EOF

cat > "$REPO/profiles/arhivarius-profile.md" <<'MD_EOF'
# Профиль Сущности: Архивариус

Статус: working

callsign: Архивариус
role: инфраструктурная Сущность учёта и доступа
contour: archivist_infrastructure
autonomy_level: medium
primary_function: учёт, индексация, query-layer, service-layer, поддержка воспроизводимого доступа к данным

## Допустимые задачи

- индексировать
- регистрировать сущности
- регистрировать шаги
- показывать active step
- показывать entity summary
- показывать confirmed steps
- показывать recent artifacts
- отдавать service-query JSON

## Ограничения

- не подменять человека в утверждении результата
- не выдавать неподтверждённое как confirmed
- не скрывать происхождение данных

## Ожидаемые артефакты

- registry_entry
- step_record
- query_output
- service_payload
- path_resolution
- bootstrap_manifest
MD_EOF

cat > "$REPO/manifests/bootstrap-core-manifest-v01.md" <<'MD_EOF'
# Bootstrap Core Manifest v0.1

Статус: working

## Назначение

Зафиксировать минимальное ядро bootstrap-материалов для воспроизводимой инициации Сущностей.

## Обязательное ядро

- policies/origin-and-authorship-policy.md
- headers/canonical-header-v2.md
- templates/task-envelope-template.md
- templates/handoff-rules-template.md
- profiles/koordinator-profile.md
- profiles/redaktor-profile.md
- profiles/sledopyt-profile.md
- profiles/arhivarius-profile.md

## Следующий шаг

После подтверждения этого ядра следует сформировать:
- первые initiation packages
- bootstrap README per entity
- примеры стартовых контекстов
MD_EOF

echo "Created bootstrap repository skeleton:"
echo "  $REPO"
echo
find "$REPO" -maxdepth 2 -type f | sort
