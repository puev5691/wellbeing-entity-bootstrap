# Реестр апгрейда Сущностей под recovery v1.2 — v0.9

## Смысл и граница задачи

Текущая recovery-кампания относится только к проекту **«ШТАБ БЛАГОПОЛУЧИЯ»**. В текущую волну входят только однозначно нужные рабочие Сущности.

`discovered -> assessed -> recovery_prepared -> externally_published -> externally_verified -> cold_start_verified -> upgraded`

## Реестр текущей кампании

| Код | Сущность | Current recovery | Migration state | Следующий шаг |
|---|---|---|---|---|
| KOO | КООРДИНАТОР | `puev5691/wellbeing-entity-bootstrap/entities/koo/` | `upgraded` | событийное обновление |
| KAN | КАНЦЕЛЯР | `puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current/` | `upgraded` | событийное обновление |
| ARH | АРХИВАРИУС | `puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current/` | `upgraded` | событийное обновление |
| RED | РЕДАКТОР | `puev5691/wellbeing-entity-bootstrap/entities/red/recovery/current/` | `upgraded` | событийное обновление |
| SIS | СИСАДМИН | `puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current/` | `upgraded` | событийное обновление |
| WEB | ВЕБМАСТЕР | `puev5691/wellbeing-entity-bootstrap/entities/web/recovery/current/` | `externally_verified` | cold-start нового чистого WEB по аварийному bootstrap-recovery |
| KOD | КОДЕР | не подтверждён | `role_confirmed_recovery_not_confirmed` | после WEB определить очередность |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после WEB определить очередность |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHT | ШТАБИСТ | не требуется сейчас | `deferred_role_design` | вернуться позже |
| — | ПРОВОДНИК БЛАГОПОЛУЧИЯ | не подтверждён | `not_in_chat_upgrade_scope_until_confirmed` | отдельно решить |
| — | Следопыт | legacy bootstrap | `legacy_unmapped` | определить статус |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | не требуется | `utility_chat_no_recovery` | recovery не создавать |

## ВЕБМАСТЕР: аварийная технология

ОПЕРАТОР сообщил, что старый WEB-чат неработоспособен и не может выполнить штатный self-assessment.

Поэтому для WEB применён аварийный bootstrap-recovery:

1. не использовать старый чат как источник истины;
2. взять только approved role/source и явное решение ОПЕРАТОРА;
3. проверить отсутствие конфликтующего current recovery в выбранном внешнем контуре;
4. КООРДИНАТОР создаёт минимальный initiation + snapshot + manifest + checksums;
5. минимальный snapshot прямо фиксирует неизвестное и не реконструирует старые хвосты;
6. пакет публикуется и независимо проверяется;
7. новый чистый WEB проходит cold-start;
8. только после `initiation_verified` новый WEB делает read-only аудит внешнего веб-контура и обновляет snapshot уже собственными проверенными данными.

Этот режим является проверяемым рабочим экспериментом, а не новым approved-каноном. После успешного WEB cold-start его можно отдельно оформить как общую процедуру аварийной инициации.

## Внешняя проверка WEB

Проверенный locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/web/recovery/current
    ref: main
    manifest: WEB__recovery-manifest__WEB.md
    checksums: sha256sums.txt

Immutable package commit:

`fb1c08457a8ee0962a9191752b7a642217e4c7d5`

На нём подтверждены ровно четыре файла и blob identifiers:

- initiation `1f81c77b50fcf40a8f5a6ca5c8c2b5b927ff1a38`;
- snapshot `14fd417f8c3ee9ee4b4682a0d57e5705cc393796`;
- manifest `edb15bcb5b92463007217e192c0106ed65fbda5b`;
- checksums `73c8105f136e83ea55ef646a58acc51af5830863`.

Внешний `sha256sums.txt` совпадает с предпубликационными SHA-256 трёх содержательных файлов.

Статус WEB: `externally_verified`.

## Следующий шаг

> создать новый чистый чат ВЕБМАСТЕРА и провести cold-start только по approved Project Sources и внешнему аварийному recovery. Старый WEB-чат и старые задачи не передавать.

---

document_type: entity-recovery-registry
version: v0.9
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.8
project_time: generated_without_trusted_project_time
