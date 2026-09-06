# Реестр апгрейда Сущностей под recovery v1.2 — v0.2

## Смысл и граница задачи

Это текущая проверяемая карта апгрейда **только для проекта «ШТАБ БЛАГОПОЛУЧИЯ»**.

ОПЕРАТОР отдельно уточнил:

- **ШКОЛА БЛАГОПОЛУЧИЯ** — другой проект; в текущую recovery-кампанию не входит;
- **ВОЛОНТЁР** — утилитарный чат для случайных, простых и учебных вопросов; отдельные initiation, snapshot и recovery для него не нужны.

Поэтому наличие имени или кода в старом role/routing-материале само по себе не означает включение в эту кампанию.

Реестр хранит указатели и состояние миграции, а не содержимое snapshot.

## Область проверки

Структурно проверены:

- `puev5691/wellbeing-entity-bootstrap`;
- `puev5691/wellbeing-archivist`.

По ключевым recovery/initiation-маркерам проверены также доступные репозитории проекта и соседних технических контуров. Находка вне проекта «ШТАБ БЛАГОПОЛУЧИЯ» не делает объект участником текущей кампании.

Отсутствие находки означает только `not_confirmed_in_audit`, а не доказанное отсутствие артефакта во всём проекте.

## Машина состояний

Используются технические состояния миграции:

`discovered -> assessed -> recovery_prepared -> externally_published -> externally_verified -> cold_start_verified -> upgraded`

Дополнительные:

- `role_confirmed_recovery_not_confirmed`;
- `bootstrap_only`;
- `legacy_recovery_assessed`;
- `blocked_missing_role`;
- `legacy_unmapped`;
- `out_of_scope_other_project`;
- `utility_chat_no_recovery`;
- `not_in_chat_upgrade_scope_until_confirmed`.

Они не заменяют канонические статусы инициации `initiation_verified / initiation_loaded_external_unverified / initiation_failed`.

## Реестр текущей кампании

| Код | Сущность / контур | Статус в текущей кампании | Найденный внешний контур | Состояние migration | Что подтверждено | Следующий шаг |
|---|---|---|---|---|---|---|
| KOO | КООРДИНАТОР | входит | `puev5691/wellbeing-entity-bootstrap/entities/koo/` | `upgraded` | initiation, snapshot, manifest, checksums, locator; внешний пакет проверен по v1.2 | событийное обновление |
| KAN | КАНЦЕЛЯР | входит | `puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current/` | `upgraded` | initiation, snapshot, manifest, checksums, locator; внешний пакет приведён к v1.2 | событийное обновление |
| ARH | АРХИВАРИУС | входит | `wellbeing-entity-bootstrap/packages/core/arhivarius-v01/`; `packages/handoffs/arhivarius-current-chat-snapshot-v01/`; `...-v02/`; старые `wellbeing-archivist/docs/entities/archivarius/` | `legacy_recovery_assessed` | bootstrap v01; полный snapshot v01 + дельта v02; initiation-backup v02 | следующая отдельная миграция |
| RED | РЕДАКТОР | входит | `wellbeing-entity-bootstrap/packages/core/redaktor-v01/` | `bootstrap_only` | bootstrap-manifest v0.1, start-context, reading list, constraints, profile | после ARH провести assessment актуального состояния |
| SIS | СИСАДМИН | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | роль и рабочий контур известны | найти текущий внешний recovery/состояние |
| WEB | ВЕБМАСТЕР | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | роль и рабочий контур известны | найти текущий внешний recovery/состояние |
| KOD | КОДЕР | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | роль и рабочий контур известны | найти текущий внешний recovery/состояние |
| SHD | ШАРДОВИК | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | роль и рабочий контур известны | найти текущий внешний recovery/состояние |
| KON | КОНСУЛЬТАНТ | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | роль и рабочий контур известны | найти текущий внешний recovery/состояние |
| SHT | ШТАБИСТ | входит, но профиль требует уточнения | не подтверждён | `blocked_missing_role` | код/имя известны | не мигрировать до подтверждения профильной роли |
| — | ПРОВОДНИК БЛАГОПОЛУЧИЯ | пока не классифицирован как отдельная чат-Сущность | отдельный chat-recovery не подтверждён | `not_in_chat_upgrade_scope_until_confirmed` | web-помощник посетителю | отдельно решить, нужен ли ему entity-recovery |
| — | Следопыт | legacy-находка | `packages/core/sledopyt-v01/`, `profiles/sledopyt-profile.md` | `legacy_unmapped` | старый профиль и bootstrap существуют | определить: legacy, часть КОДЕРА или отдельная сущность |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | **не входит: другой проект** | не рассматривается | `out_of_scope_other_project` | явное решение ОПЕРАТОРА | исключить из дальнейшего аудита этой кампании |
| VOL | ВОЛОНТЁР | **не входит в recovery: утилитарный чат** | не требуется | `utility_chat_no_recovery` | явное решение ОПЕРАТОРА | initiation/snapshot/recovery не создавать |

## Подтверждённые внешние находки

### KOO

Текущий канонический внешний контур:

`puev5691/wellbeing-entity-bootstrap/entities/koo/`

Статус: `upgraded`.

### KAN

Текущий внешний recovery:

`puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current/`

Статус: `upgraded`.

### ARH

Обнаружена старая цепочка:

- `packages/core/arhivarius-v01/` — bootstrap;
- `arhivarius-current-chat-snapshot-v01/` — полный snapshot;
- `arhivarius-current-chat-snapshot-v02/` — дельта к v01.

README v02 требует для полного восстановления читать v01 + v02 + project sources + recovery policy.

В v02 находятся:

- `ARH__chat-initiation-backup__ARH.md`;
- `ARH__chat-state-snapshot__ARH.md`;
- `README.md`.

`sha256sums.txt` и отдельный v1.2 recovery-manifest отсутствуют.

Вывод: ARH не восстанавливать с нуля; преобразовать существующую цепочку в current recovery v1.2, сохранив v01/v02 как provenance.

### RED

В `packages/core/redaktor-v01/` существует bootstrap-пакет со статусом `working`.

Это исходный материал для будущей миграции, но не подтверждение current recovery.

## Исправление границ после v0.1

Версия v0.1 ошибочно включала ШКОЛУ в очередь текущего проекта и трактовала ВОЛОНТЁРА как потенциальную Сущность для recovery.

ОПЕРАТОР уточнил фактическую модель:

- ШКОЛА относится к другому проекту;
- ВОЛОНТЁР не является сохраняемой рабочей Сущностью и не требует recovery-механизма.

Эти пункты считаются исправленными в v0.2 и не должны снова попадать в очередь миграции.

## Очередь

1. **АРХИВАРИУС** — первая полноценная миграция после KOO/KAN.
2. **РЕДАКТОР** — после стабилизации алгоритма на ARH.
3. Остальные Сущности проекта «ШТАБ БЛАГОПОЛУЧИЯ» — по фактической активности и риску потери состояния, не по алфавиту.

## Следующий шаг

> assessment и миграция АРХИВАРИУСА на recovery v1.2 с сохранением v01/v02 как provenance.

---

## Служебная карточка

document_type: entity-recovery-registry
version: v0.2
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
audit_mode: read_only_external_evidence
supersedes: KOO__entity-recovery-registry v0.1
project_time: generated_without_trusted_project_time
responsibility_boundary: реестр фиксирует только текущую recovery-кампанию проекта ШТАБ БЛАГОПОЛУЧИЯ; другие проекты и утилитарные чаты не включаются автоматически
