# Реестр апгрейда Сущностей под recovery v1.2 — v0.13

## Смысл

Текущая recovery-кампания относится только к проекту **«ШТАБ БЛАГОПОЛУЧИЯ»**.

`discovered -> assessed -> recovery_prepared -> externally_published -> externally_verified -> cold_start_verified -> upgraded`

## Реестр

| Код | Сущность | Current recovery | Migration state | Следующий шаг |
|---|---|---|---|---|
| KOO | КООРДИНАТОР | `entities/koo/` | `upgraded` | событийное обновление |
| KAN | КАНЦЕЛЯР | `wellbeing-archivist/docs/entities/kancelyariya/recovery-current/` | `upgraded` | событийное обновление |
| ARH | АРХИВАРИУС | `entities/arh/recovery/current/` | `upgraded` | событийное обновление |
| RED | РЕДАКТОР | `entities/red/recovery/current/` | `upgraded` | событийное обновление |
| SIS | СИСАДМИН | `entities/sis/recovery/current/` | `upgraded` | событийное обновление |
| WEB | ВЕБМАСТЕР | `entities/web/recovery/current/` | `upgraded` | post-init аудит `deferred_nonurgent` |
| SHT | ШТАБИСТ | `entities/sht/recovery/current/` | `externally_verified` | clean cold-start после pre-reconfiguration preservation |
| KOD | КОДЕР | `entities/kod/recovery/current/` заявлен в assessment | `assessment_received_pending_independent_verification` | после SHT независимо проверить KOD recovery и провести cold-start |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после KOD |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | recovery не требуется | `utility_chat_no_recovery` | не создавать |

## SHT: сохранение старого экземпляра

Перед clean cold-start старый доступный чат SHT выполнил pre-reconfiguration preservation snapshot.

Внешнее сохранение:

    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/preservation/pre-reconfiguration/SHT__pre-reconfiguration-snapshot__KOO.md
    publication_commit: 41be23ce9b75451d71d60570910655c0aa0c101f
    sha256: 07c8b79dccdd46526ba3df9e4d9ebc456f112d7ac1ed921a819d8b1b53658d02

Старый snapshot подтвердил:

- роль старого SHT была неоднозначной и менялась;
- ранний представительско-переговорный профиль нельзя переносить в current автоматически;
- поздняя работа содержала ценный организационно-методический материал;
- старые concept-package маршруты не подтверждены как доставленные;
- иной active workload старого SHT, кроме preservation, не подтверждён.

## Решение о переносе

В новый current SHT переносится **не старая ролевая оболочка и не незавершённые маршруты**, а только полезный provenance:

- различение стадий результата;
- тема стоимости и уровней долговременной фиксации;
- вклад в СКРИЖАЛИ;
- материалы понятийной модели БЛАГОПОЛУЧИЯ;
- принцип отделения понятийного ядра от исследовательских гипотез.

Не активируются автоматически:

- старый представительский цикл;
- старые briefing-пакеты;
- старые `legacy_unfinished_routes`;
- старый draft файлового канона.

## Current recovery SHT после preservation

Locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/recovery/current
    ref: main
    manifest: SHT__recovery-manifest__SHT.md
    checksums: sha256sums.txt

Финальный independently checked immutable commit после интеграции preservation:

`b9db33e74bd1aaf81818ed22f05a1d9362ebe709`

На нём подтверждены пять recovery-файлов:

- role-definition blob `2cb8a1bc48dad450f84de478d625d7c667436425`;
- initiation blob `eebe4aa896f079217317fefc4e98240856411529`;
- snapshot blob `b3a0771e1adf3ae641f64c7a15b075291051f29b`;
- manifest blob `0d58ca9327118d9fd880b1c69b1de3ec6e1080ee`;
- checksums blob `865873ea83327a29262e0d6787c6a5b955631709`.

Внешний `sha256sums.txt` повторно прочитан на том же commit.

Статус SHT остаётся `externally_verified`.

## Следующий шаг

> создать новый чистый чат SHT и провести cold-start по обновлённому current recovery на commit `b9db33e74bd1aaf81818ed22f05a1d9362ebe709`.

После `initiation_verified` отдельно передать:

- `KAN__entity-environment-semantic-foundation-v01-candidate__KOO.md`;
- `KOO__organizational-model-task__SHT.md`.

---

document_type: entity-recovery-registry
version: v0.13
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.12
project_time: generated_without_trusted_project_time
