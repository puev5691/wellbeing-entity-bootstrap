# Реестр апгрейда Сущностей под recovery v1.2 — v0.5

## Смысл и граница задачи

Это текущая проверяемая карта апгрейда **только для проекта «ШТАБ БЛАГОПОЛУЧИЯ»**.

ОПЕРАТОР уточнил:

- **ШКОЛА БЛАГОПОЛУЧИЯ** — другой проект;
- **ВОЛОНТЁР** — утилитарный чат без initiation/snapshot/recovery;
- **ШТАБИСТ** — будущая внутренняя административно-организационная Сущность; проектирование и recovery отложены.

В текущую очередь входят только Сущности, необходимость которых для работы ШТАБА уже однозначна.

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
| ARH | АРХИВАРИУС | входит | `puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current/` | `upgraded` | cold-start `initiation_verified` |
| RED | РЕДАКТОР | входит | `puev5691/wellbeing-entity-bootstrap/entities/red/recovery/current/` | `externally_verified` | current-пакет независимо проверен КООРДИНАТОРОМ; следующий шаг — cold-start нового RED |
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

## АРХИВАРИУС

Цикл закрыт.

Проверенный current locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/arh/recovery/current
    ref: main
    manifest: ARH__recovery-manifest__ARH.md
    checksums: sha256sums.txt

Cold-start нового экземпляра завершён со статусом `initiation_verified`.

## РЕДАКТОР: внешняя проверка выполнена

Assessment RED завершён. Старый `packages/core/redaktor-v01/` использован только как provenance.

Проверенный current locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/red/recovery/current
    ref: main
    manifest: RED__recovery-manifest__RED.md
    checksums: sha256sums.txt

КООРДИНАТОР независимо проверил current-каталог:

- присутствуют ровно четыре ожидаемых файла;
- blob identifiers совпадают с отчётом RED;
- immutable commit assessment: `7b79f118664648c63b60fa5af84f17936d83e57b`;
- `sha256sums.txt` на этом commit содержит заявленные SHA-256 трёх содержательных файлов;
- manifest на immutable commit содержит тот же locator, состав и требование cold-start-проверки.

Текущий статус RED: `externally_verified`.

`upgraded` будет присвоен только после нового чистого экземпляра RED со статусом `initiation_verified`.

## Очередь

1. **РЕДАКТОР** — cold-start.
2. После успешного RED — следующая однозначно нужная рабочая Сущность ШТАБА по активности и риску потери состояния.
3. Рекомендация ARH о GitHub как первичном внешнем файловом поле — отдельная pending-архитектурная тема, не канон.

## Следующий шаг

> создать новый чистый экземпляр РЕДАКТОРА и проверить cold-start по current recovery v1.2 без использования памяти прежнего чата как источника истины.

---

document_type: entity-recovery-registry
version: v0.5
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.4
project_time: generated_without_trusted_project_time
