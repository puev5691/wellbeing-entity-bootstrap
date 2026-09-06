# Реестр апгрейда Сущностей под recovery v1.2 — v0.10

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
| WEB | ВЕБМАСТЕР | `entities/web/recovery/current/` | `upgraded` | первый профильный шаг — read-only аудит внешнего веб-контура |
| KOD | КОДЕР | не подтверждён | `role_confirmed_recovery_not_confirmed` | после WEB-аудита либо параллельно отдельным циклом выбрать по риску потери |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после WEB-аудита либо параллельно отдельным циклом выбрать по риску потери |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHT | ШТАБИСТ | не требуется сейчас | `deferred_role_design` | вернуться позже |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | recovery не требуется | `utility_chat_no_recovery` | не создавать |

## WEB: аварийный цикл закрыт

Старый WEB-чат признан ОПЕРАТОРОМ неработоспособным. Штатный self-assessment не использовался.

КООРДИНАТОР создал минимальный аварийный recovery из approved-источников и подтверждённой роли WEB, внешне опубликовал и проверил его.

Новый чистый WEB прошёл cold-start со статусом `initiation_verified`.

Cold-start зафиксировал commit:

`1e2c8092b17adb11a02fb91c908ce60e0464a6dd`

На этом commit подтверждены те же четыре recovery-файла и те же blob identifiers, что при предыдущей независимой проверке пакета. Старый чат не использовался как current state, production не менялся.

Статус WEB: `upgraded`.

`upgraded` означает работоспособность и проверяемость механизма инициации/recovery. Это не означает восстановление потерянной истории старого WEB.

## Проверенная технология аварийной инициации

Эксперимент WEB подтвердил рабочую схему:

> минимальное подтверждённое ядро → внешняя публикация → независимая проверка → clean cold-start → `initiation_verified` → read-only аудит реальности.

Процедура оформлена отдельным кандидатом:

`standards/chat-entity-operations/candidates/emergency-entity-initiation-v01-candidate.md`

Статус: `tested_candidate_for_operator_review`, не approved-канон.

## Следующий шаг

> новый WEB выполняет отдельный read-only аудит фактического внешнего веб-контура и по результатам обновляет свой snapshot проверенными данными; production не менять.

---
document_type: entity-recovery-registry
version: v0.10
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.9
project_time: generated_without_trusted_project_time
