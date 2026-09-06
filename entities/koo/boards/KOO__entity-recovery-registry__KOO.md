# Реестр апгрейда Сущностей под recovery v1.2 — v0.11

## Смысл

Текущая recovery-кампания относится только к проекту **«ШТАБ БЛАГОПОЛУЧИЯ»**. В текущую волну входят только однозначно нужные рабочие Сущности.

`discovered -> assessed -> recovery_prepared -> externally_published -> externally_verified -> cold_start_verified -> upgraded`

## Реестр

| Код | Сущность | Current recovery | Migration state | Следующий шаг |
|---|---|---|---|---|
| KOO | КООРДИНАТОР | `entities/koo/` | `upgraded` | событийное обновление |
| KAN | КАНЦЕЛЯР | `wellbeing-archivist/docs/entities/kancelyariya/recovery-current/` | `upgraded` | событийное обновление |
| ARH | АРХИВАРИУС | `entities/arh/recovery/current/` | `upgraded` | событийное обновление |
| RED | РЕДАКТОР | `entities/red/recovery/current/` | `upgraded` | событийное обновление |
| SIS | СИСАДМИН | `entities/sis/recovery/current/` | `upgraded` | событийное обновление |
| WEB | ВЕБМАСТЕР | `entities/web/recovery/current/` | `upgraded` | post-init аудит веб-контура отложен как `deferred_nonurgent` |
| KOD | КОДЕР | current recovery не подтверждён | `role_confirmed_recovery_not_confirmed` | следующий recovery-cycle; использовать `packages/core/sledopyt-v01/` только как provenance предшественника |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после KOD определить очередность |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHT | ШТАБИСТ | не требуется сейчас | `deferred_role_design` | вернуться позже |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | recovery не требуется | `utility_chat_no_recovery` | не создавать |

## WEB: состояние после аварийной инициации

WEB остаётся `upgraded`.

ОПЕРАТОР решил не запускать сейчас post-init read-only аудит веб-контура: срочной публикационной задачи нет, а технологическая цепочка WEB требует отдельного восстановления.

Будущий предмет аудита:

- локальная рабочая копия сайта;
- создание страницы и стилей;
- встраивание в локальный код сайта;
- механизм доставки на площадки burzh и erefia;
- взаимодействие WEB с техническим демоном;
- фактические current / legacy / unknown компоненты.

Воспоминание ОПЕРАТОРА о цепочке не считается доказанным current-state и должно использоваться как `lead_to_verify`.

Статус post-init аудита WEB: `deferred_nonurgent`.

## Следопыт и КОДЕР

ОПЕРАТОР явно уточнил:

> КОДЕР — это бывший СЛЕДОПЫТ.

Следовательно, legacy bootstrap:

`packages/core/sledopyt-v01/`

переклассифицирован из `legacy_unmapped` в provenance предшественника KOD.

Он не является current recovery КОДЕРА и не переносится как current state автоматически.

Старый пакет подтверждён внешне и описывает контур `teraorigin_research`, дисциплину evidence, различение кода/лога/гипотезы и построение инженерных карт.

## Lead по технологической цепочке WEB

ОПЕРАТОР помнит, что бывший СЛЕДОПЫТ / нынешний КОДЕР создавал специальный демон, который участвовал в копировании локально подготовленного сайта на две площадки — burzh и erefia.

Статус этого сведения:

`operator_recollection / lead_to_verify`

Не считать подтверждённой текущей архитектурой до поиска кода, конфигурации, unit-файлов, журналов или иных внешних доказательств.

## Следующий шаг

> провести assessment текущего КОДЕРА, найти существующие KOD/recovery материалы, использовать `sledopyt-v01` как provenance и отдельно проверить след демона, связанного с публикационной цепочкой WEB.

---

document_type: entity-recovery-registry
version: v0.11
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.10
project_time: generated_without_trusted_project_time
