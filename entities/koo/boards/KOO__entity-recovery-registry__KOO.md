# Реестр апгрейда Сущностей под recovery v1.2 — v0.7

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
| SIS | СИСАДМИН | `puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current/` | `externally_verified` | cold-start нового SIS |
| WEB | ВЕБМАСТЕР | не подтверждён | `role_confirmed_recovery_not_confirmed` | после SIS определить очередность |
| KOD | КОДЕР | не подтверждён | `role_confirmed_recovery_not_confirmed` | после SIS определить очередность |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после SIS определить очередность |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHT | ШТАБИСТ | не требуется сейчас | `deferred_role_design` | вернуться позже |
| — | ПРОВОДНИК БЛАГОПОЛУЧИЯ | не подтверждён | `not_in_chat_upgrade_scope_until_confirmed` | отдельно решить |
| — | Следопыт | legacy bootstrap | `legacy_unmapped` | определить статус |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | не требуется | `utility_chat_no_recovery` | recovery не создавать |

## СИСАДМИН: независимая внешняя проверка

Проверенный locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sis/recovery/current
    ref: main
    manifest: SIS__recovery-manifest__SIS.md
    checksums: sha256sums.txt

Immutable commit:

`df530d5344e9fa6967c0545e67c5203501355670`

На этом commit КООРДИНАТОР подтвердил:
- ровно четыре ожидаемых файла;
- blob identifiers:
  - initiation `1f7d082a890ec78756f08ffe58b56f9f04e6dd75`;
  - snapshot `22cf1c217a734e007ec7bb0318f89f6b2d5ca61c`;
  - manifest `b602d7e4925a68cb3f28924c4735fafcab33d585`;
  - checksums `4013a613ebd45235a9b0f40431444d95af094360`;
- опубликованный `sha256sums.txt` совпадает с assessment-отчётом;
- manifest запрещает восстанавливать secrets, production-конфиги и live-state автоматически;
- initiation требует свежей проверки перед production;
- snapshot прямо обозначен как не-live-monitoring.

Текущий статус SIS: `externally_verified`.

## Очередь
1. **СИСАДМИН** — cold-start нового чистого экземпляра.
2. После успешного SIS — выбрать следующую однозначно нужную рабочую Сущность ШТАБА.
3. Пилот Obsidian — после стабилизации основной recovery-волны.
4. GitHub как первичное внешнее файловое поле — `pending_architectural_review`.
5. «Мера» — pending до подтверждённого второго варианта.

---
document_type: entity-recovery-registry
version: v0.7
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.6
project_time: generated_without_trusted_project_time
