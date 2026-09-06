# Реестр апгрейда Сущностей под recovery v1.2 — v0.4

## Смысл и граница задачи

Это текущая проверяемая карта апгрейда **только для проекта «ШТАБ БЛАГОПОЛУЧИЯ»**.

ОПЕРАТОР отдельно уточнил:

- **ШКОЛА БЛАГОПОЛУЧИЯ** — другой проект; в текущую recovery-кампанию не входит;
- **ВОЛОНТЁР** — утилитарный чат для случайных, простых и учебных вопросов; отдельные initiation, snapshot и recovery для него не нужны;
- **ШТАБИСТ** — будущая внутренняя административно-организационная Сущность по типу КАНЦЕЛЯРА, но её проектирование и recovery отложены.

Поэтому наличие имени или кода в старом role/routing-материале само по себе не означает включение в текущую очередь миграции.

## Машина состояний

`discovered -> assessed -> recovery_prepared -> externally_published -> externally_verified -> cold_start_verified -> upgraded`

Дополнительные:

- `role_confirmed_recovery_not_confirmed`;
- `bootstrap_only`;
- `deferred_role_design`;
- `legacy_unmapped`;
- `out_of_scope_other_project`;
- `utility_chat_no_recovery`;
- `not_in_chat_upgrade_scope_until_confirmed`.

## Реестр текущей кампании

| Код | Сущность / контур | Статус | Current recovery | Migration state | Подтверждение / следующий шаг |
|---|---|---|---|---|---|
| KOO | КООРДИНАТОР | входит | `puev5691/wellbeing-entity-bootstrap/entities/koo/` | `upgraded` | событийное обновление |
| KAN | КАНЦЕЛЯР | входит | `puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current/` | `upgraded` | событийное обновление |
| ARH | АРХИВАРИУС | входит | `puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current/` | `upgraded` | новый экземпляр прошёл cold-start `initiation_verified`; внешний current-каталог повторно проверен КООРДИНАТОРОМ |
| RED | РЕДАКТОР | входит | current recovery не подтверждён; есть `packages/core/redaktor-v01/` | `bootstrap_only` | следующий профильный цикл: assessment current state и recovery v1.2 |
| SIS | СИСАДМИН | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | искать фактический current recovery/состояние |
| WEB | ВЕБМАСТЕР | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | искать фактический current recovery/состояние |
| KOD | КОДЕР | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | искать фактический current recovery/состояние |
| SHD | ШАРДОВИК | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | искать фактический current recovery/состояние |
| KON | КОНСУЛЬТАНТ | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | искать фактический current recovery/состояние |
| SHT | ШТАБИСТ | в проекте, но не в текущей очереди | не требуется сейчас | `deferred_role_design` | вернуться после подъёма основных рабочих Сущностей |
| — | ПРОВОДНИК БЛАГОПОЛУЧИЯ | пока не классифицирован как отдельная чат-Сущность | не подтверждён | `not_in_chat_upgrade_scope_until_confirmed` | отдельно решить, нужен ли entity-recovery |
| — | Следопыт | legacy-находка | `packages/core/sledopyt-v01/` | `legacy_unmapped` | определить: legacy, часть КОДЕРА или отдельная Сущность |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | не рассматривается | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | утилитарный чат | не требуется | `utility_chat_no_recovery` | initiation/snapshot/recovery не создавать |

## АРХИВАРИУС: закрытие цикла

Cold-start нового экземпляра ARH завершён успешно.

Проверенный locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/arh/recovery/current
    ref: main
    manifest: ARH__recovery-manifest__ARH.md
    checksums: sha256sums.txt

Cold-start report зафиксировал:

- `initiation_verified`;
- проверенный immutable commit `d55d111914d3c5efb2526f7ce507d9748c67e82b`;
- четыре ожидаемых файла;
- совпадение SHA-256 трёх содержательных файлов.

КООРДИНАТОР независимо проверил current-каталог GitHub: четыре файла существуют с заявленными размерами, а опубликованный `sha256sums.txt` содержит те же три SHA-256.

Старые bootstrap и snapshot v01/v02 остаются provenance/evidence.

## Очередь

1. **РЕДАКТОР** — следующий recovery-cycle.
2. Остальные однозначно нужные рабочие Сущности ШТАБА — по фактической активности и риску потери состояния.
3. Рекомендация ARH о GitHub как первичном внешнем файловом поле — отдельная архитектурная pending-тема, не канон.

## Следующий шаг

> assessment актуального состояния РЕДАКТОРА и подготовка recovery v1.2 на основе подтверждённого current-чата и существующего bootstrap v0.1.

---

document_type: entity-recovery-registry
version: v0.4
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.3
project_time: generated_without_trusted_project_time
