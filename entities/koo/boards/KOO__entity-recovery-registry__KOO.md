# Реестр апгрейда Сущностей под recovery v1.2 — v0.8

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
| SIS | СИСАДМИН | `puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current/` | `upgraded` | cold-start `initiation_verified`; production не менялся |
| WEB | ВЕБМАСТЕР | не подтверждён | `role_confirmed_recovery_not_confirmed` | следующий профильный цикл: assessment current state и recovery v1.2 |
| KOD | КОДЕР | не подтверждён | `role_confirmed_recovery_not_confirmed` | после WEB определить очередность |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после WEB определить очередность |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHT | ШТАБИСТ | не требуется сейчас | `deferred_role_design` | вернуться позже |
| — | ПРОВОДНИК БЛАГОПОЛУЧИЯ | не подтверждён | `not_in_chat_upgrade_scope_until_confirmed` | отдельно решить |
| — | Следопыт | legacy bootstrap | `legacy_unmapped` | определить статус |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | не требуется | `utility_chat_no_recovery` | recovery не создавать |

## СИСАДМИН: цикл закрыт

Новый экземпляр SIS прошёл cold-start со статусом:

`initiation_verified`

Проверенный locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sis/recovery/current
    ref: main
    manifest: SIS__recovery-manifest__SIS.md
    checksums: sha256sums.txt

Во время cold-start `main` указывал на commit:

`ff08e550441d4a011a9963cdcf90f78a33c4f439`

Новый SIS подтвердил:

- четыре ожидаемых файла;
- blob identifiers:
  - initiation `1f7d082a890ec78756f08ffe58b56f9f04e6dd75`;
  - snapshot `22cf1c217a734e007ec7bb0318f89f6b2d5ca61c`;
  - manifest `b602d7e4925a68cb3f28924c4735fafcab33d585`;
  - checksums `4013a613ebd45235a9b0f40431444d95af094360`;
- совпадение трёх SHA-256;
- `secrets_detected: no`;
- `production_changes: none`;
- snapshot трактуется только как evidence прежних проверок, а не live-state.

КООРДИНАТОР независимо прочитал каталог SIS и checksum-файл на commit `ff08e550441d4a011a9963cdcf90f78a33c4f439`. Состав и blob identifiers совпали с cold-start отчётом. Recovery-файлы SIS на этом commit идентичны ранее независимо проверенному пакету.

Статус SIS: `upgraded`.

## Следующий цикл: ВЕБМАСТЕР

Current approved-роль WEB: сайт, HTML/CSS/JS, навигация, публикационные страницы, Проводник как web-интерфейс. WEB не утверждает DNS, HTTPS, безопасность VDS и policy.

В проверенных внешних источниках current recovery WEB пока не подтверждён. Это не доказывает отсутствие локальных либо иных внешних материалов.

Первый шаг WEB — assessment собственного current state и существующих initiation/snapshot/recovery материалов; только затем current recovery v1.2 либо конкретный blocker.

## Очередь

1. **ВЕБМАСТЕР** — следующий recovery-cycle.
2. После WEB — КОДЕР или ШАРДОВИК по фактически обнаруженному состоянию и риску потери.
3. Пилот Obsidian — после стабилизации основной recovery-волны.
4. GitHub как первичное внешнее файловое поле — `pending_architectural_review`.
5. «Мера» — pending до подтверждённого второго варианта.

---
document_type: entity-recovery-registry
version: v0.8
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.7
project_time: generated_without_trusted_project_time
