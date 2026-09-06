# Реестр апгрейда Сущностей под recovery v1.2 — v0.6

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
| RED | РЕДАКТОР | входит | `puev5691/wellbeing-entity-bootstrap/entities/red/recovery/current/` | `upgraded` | cold-start `initiation_verified`; внешний пакет повторно проверен КООРДИНАТОРОМ |
| SIS | СИСАДМИН | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | следующий профильный цикл: assessment current state и recovery v1.2 |
| WEB | ВЕБМАСТЕР | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | после SIS определить очередь по активности и риску потери состояния |
| KOD | КОДЕР | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | после SIS определить очередь по активности и риску потери состояния |
| SHD | ШАРДОВИК | входит | не подтверждён | `role_confirmed_recovery_not_confirmed` | после SIS определить очередь по активности и риску потери состояния |
| KON | КОНСУЛЬТАНТ | входит в реестр, но не выбран в текущую штабную волну | не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически до отдельного решения о месте роли в ШТАБЕ |
| SHT | ШТАБИСТ | в проекте, но не в текущей очереди | не требуется сейчас | `deferred_role_design` | вернуться после подъёма основных рабочих Сущностей |
| — | ПРОВОДНИК БЛАГОПОЛУЧИЯ | пока не классифицирован как отдельная чат-Сущность | не подтверждён | `not_in_chat_upgrade_scope_until_confirmed` | отдельно решить, нужен ли entity-recovery |
| — | Следопыт | legacy-находка | `packages/core/sledopyt-v01/` | `legacy_unmapped` | определить: legacy, часть КОДЕРА или отдельная Сущность |
| SHK | ШКОЛА БЛАГОПОЛУЧИЯ | другой проект | не рассматривается | `out_of_scope_other_project` | исключена |
| VOL | ВОЛОНТЁР | утилитарный чат | не требуется | `utility_chat_no_recovery` | initiation/snapshot/recovery не создавать |

## РЕДАКТОР: цикл закрыт

Cold-start нового экземпляра RED завершён со статусом:

`initiation_verified`

Проверенный locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/red/recovery/current
    ref: main
    manifest: RED__recovery-manifest__RED.md
    checksums: sha256sums.txt

Новый экземпляр зафиксировал при проверке:

- commit `2c3612761f22580be93b0834da5a02e1fe4378e4`;
- tree `76f291b01c0376c336df9c09d352be286d40ff89`;
- blob `a933f77d5ef5ae8e2711a56704624054c7e4bfcc` для initiation;
- blob `a74b778c2a53586d06cb6221fe36276c04661820` для snapshot;
- blob `80d8dd53d58670509dfcefa56eb7c375f587355b` для manifest;
- blob `f1556e45c99315bca1a5d636a59bce7e160e7b4c` для `sha256sums.txt`;
- совпадение трёх SHA-256 содержательных recovery-файлов.

КООРДИНАТОР независимо повторно прочитал manifest, initiation, snapshot и `sha256sums.txt` на указанном immutable commit. Blob identifiers и checksum-набор совпали с cold-start отчётом.

Статус RED: `upgraded`.

## Следующий цикл: СИСАДМИН

СИСАДМИН выбран следующим, потому что его current approved-роль относится к базовой инфраструктуре ШТАБА: серверы, сеть, шлюзы, туннели, firewall, deploy, health-check, systemd и мониторинг.

По проверенному GitHub-поиску отдельный current recovery SIS пока не подтверждён. Это **не доказывает его отсутствие** в локальном или другом внешнем контуре.

Первый шаг SIS — assessment фактического current state и поиск существующих initiation/snapshot/recovery-материалов. Нельзя создавать его состояние из памяти других чатов.

## Очередь

1. **СИСАДМИН** — следующий recovery-cycle.
2. После SIS — следующая однозначно нужная рабочая Сущность ШТАБА по активности и риску потери состояния.
3. Пилот Obsidian — после стабилизации основной волны recovery-апгрейда.
4. Рекомендация ARH о GitHub как первичном внешнем файловом поле — отдельная `pending_architectural_review` тема, не канон.
5. «Мера» — pending до появления подтверждённого второго варианта.

## Следующий шаг

> передать текущему чату СИСАДМИНА assessment-задачу на recovery v1.2; сначала установить подтверждённое состояние и существующие внешние материалы, затем готовить current recovery.

---

document_type: entity-recovery-registry
version: v0.6
entity: KOO
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: current_registry
supersedes: v0.5
project_time: generated_without_trusted_project_time
