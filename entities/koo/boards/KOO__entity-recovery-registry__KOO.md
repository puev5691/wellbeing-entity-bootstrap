# Реестр апгрейда Сущностей под recovery v1.2 — v0.12

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
| SHT | ШТАБИСТ | `entities/sht/recovery/current/` | `externally_verified` | clean cold-start новой актуальной роли |
| KOD | КОДЕР | `entities/kod/recovery/current/` заявлен в assessment | `assessment_received_pending_independent_verification` | после SHT независимо проверить KOD recovery и провести cold-start |
| SHD | ШАРДОВИК | не подтверждён | `role_confirmed_recovery_not_confirmed` | после KOD |
| KON | КОНСУЛЬТАНТ | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | recovery не требуется | `utility_chat_no_recovery` | не создавать |

## SHT: новая актуальная роль

Approved role-source ранее прямо оставлял профиль полномочий SHT неопределённым.

ОПЕРАТОР решил перенастроить ШТАБИСТА как внутреннюю организационно-процессную Сущность для построения общей среды Сущностей.

Это не recovery прежнего незафиксированного профиля.

Current role:

- организационные модели;
- жизненные циклы;
- процессы;
- распределение ответственности;
- варианты организации;
- процессные инварианты;
- handoff к KOO/KAN/KOD.

Границы:

- не определяет нормативные термины за KAN;
- не устанавливает приоритеты за KOO;
- не принимает high-impact решения за OPR;
- не пишет реализацию за KOD.

## SHT recovery

Locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/recovery/current
    ref: main
    manifest: SHT__recovery-manifest__SHT.md
    checksums: sha256sums.txt

Независимо проверенный KOO immutable commit:

`aa717ccb19ea9e07327d2da1359eb0bfea2b6332`

На нём подтверждены пять файлов и Git blob identifiers:

- role-definition `2cb8a1bc48dad450f84de478d625d7c667436425`;
- initiation `eebe4aa896f079217317fefc4e98240856411529`;
- snapshot `aa613562faae18dc31e7f867e29ccc434ac488c5`;
- manifest `aeb9f2c02a2101786fcb7ed44f76a122e76ac97f`;
- checksums `3e3ab36d323091000e1f8bfdbf32c567b9ea8643`.

Git blob identifiers совпали с локально подготовленными байтами. Внешний checksum-файл совпал с рассчитанными SHA-256.

Статус SHT: `externally_verified`.

## Вход текущей работы SHT

После cold-start SHT отдельно получает:

- `KAN__entity-environment-semantic-foundation-v01-candidate__KOO.md`;
- `KOO__organizational-model-task__SHT.md`.

Recovery не зависит от наличия этих task-файлов.

## KOD

Assessment-отчёт КОДЕРА получен по GitHub locator и сообщает о созданном current recovery `entities/kod/recovery/current`.

КООРДИНАТОР ещё не выполнил независимую проверку этого recovery. Поэтому KOD не переводится в `externally_verified` до отдельного цикла.

## Следующий шаг

> создать новый чистый чат SHT и провести cold-start только по approved Project Sources и внешнему current recovery.

После `initiation_verified` передать SHT два task-входа организационной модели.

---

document_type: entity-recovery-registry
version: v0.12
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.11
project_time: generated_without_trusted_project_time
