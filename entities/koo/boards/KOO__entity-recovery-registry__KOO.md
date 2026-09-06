# Реестр апгрейда Сущностей под recovery v1.2 — v0.14

## Смысл

Текущая recovery-кампания относится только к проекту **«ШТАБ БЛАГОПОЛУЧИЯ»**.

`discovered -> assessed -> recovery_prepared -> externally_published -> externally_verified -> cold_start_verified -> upgraded`

## Реестр

| Код | Сущность | Current recovery | Migration state | Следующий шаг |
|---|---|---|---|---|
| KOO | КООРДИНАТОР | `entities/koo/` | `reinit_prepared_pending_cold_start` | clean cold-start после текущего backup |
| KAN | КАНЦЕЛЯР | `wellbeing-archivist/docs/entities/kancelyariya/recovery-current/` | `upgraded` | событийное обновление |
| ARH | АРХИВАРИУС | `entities/arh/recovery/current/` | `upgraded` | событийное обновление |
| RED | РЕДАКТОР | `entities/red/recovery/current/` | `upgraded` | событийное обновление |
| SIS | СИСАДМИН | `entities/sis/recovery/current/` | `upgraded` | событийное обновление |
| WEB | ВЕБМАСТЕР | `entities/web/recovery/current/` | `upgraded` | post-init аудит `deferred_nonurgent` |
| SHT | ШТАБИСТ | `entities/sht/recovery/current/` | `upgraded` | организационная модель общей среды Сущностей |
| KOD | КОДЕР | `entities/kod/recovery/current/` заявлен в assessment | `assessment_received_pending_independent_verification` | после KOO/SHT независимо проверить recovery и cold-start |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после KOD |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | recovery не требуется | `utility_chat_no_recovery` | не создавать |

## SHT

Новый ШТАБИСТ прошёл cold-start:

`initiation_verified`

Фактически прочитанный commit:

`5ce6f32af8e8dbd599f41cc23831a33891af1727`

КООРДИНАТОР независимо проверил на этом commit те же пять recovery-файлов и blob identifiers.

Статус SHT:

`upgraded`

Старый экземпляр SHT сохранён как pre-reconfiguration provenance; старая ролевая оболочка и unfinished routes не активированы.

## KOO: текущая переинициация

ОПЕРАТОР зафиксировал поведенческий рассинхрон текущего экземпляра KOO.

Проверяемый симптом: внешний реестр после успешного SHT cold-start оставался на статусе `externally_verified`.

Принято решение:

- сохранить pre-reconfiguration snapshot KOO;
- обновить current recovery;
- включить отдельный development-state общей среды Сущностей;
- выполнить clean cold-start нового KOO.

Статус KOO до приёмки нового экземпляра:

`reinit_prepared_pending_cold_start`

## Общая среда Сущностей

Активный контур развития:

`entities/koo/developments/KOO__shared-entity-environment__KOO.md`

Смысловой слой KAN готов как `candidate_for_coordination`.

Организационный слой: SHT `upgraded`, task подготовлен, выполнение ещё не подтверждено.

Технический слой: не начат.

## Следующий шаг

> после внешней проверки обновлённого recovery KOO выполнить clean cold-start нового КООРДИНАТОРА; затем продолжить организационный слой общей среды Сущностей.

---

document_type: entity-recovery-registry
version: v0.14
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.13
project_time: generated_without_trusted_project_time
