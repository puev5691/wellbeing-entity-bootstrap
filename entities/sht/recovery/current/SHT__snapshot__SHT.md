# ШТАБИСТ: current snapshot после сохранения старого экземпляра

## Что подтверждено

- код Сущности: `SHT`;
- имя: ШТАБИСТ;
- прежний approved role-source не определял его полномочия достаточно точно;
- ОПЕРАТОР перенастроил ШТАБИСТА как внутреннюю организационно-процессную Сущность;
- current role зафиксирован отдельным `SHT__role-definition-current__SHT.md`;
- старый доступный экземпляр перед перенастройкой создал preservation snapshot;
- preservation snapshot внешне сохранён отдельно от current recovery;
- новая роль не считается продолжением старой ролевой оболочки по памяти;
- первая current-задача новой роли — организационная модель общей среды Сущностей.

## Pre-reconfiguration provenance

Внешне сохранён snapshot старого экземпляра:

    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/preservation/pre-reconfiguration/SHT__pre-reconfiguration-snapshot__KOO.md
    publication_commit: 41be23ce9b75451d71d60570910655c0aa0c101f
    sha256: 07c8b79dccdd46526ba3df9e4d9ebc456f112d7ac1ed921a819d8b1b53658d02

Он является `pre-reconfiguration evidence / legacy provenance`, а не current snapshot новой роли.

## Что перенесено из старого экземпляра

Переносится только как полезный provenance:

- различение стадий результата: создание → доставка → запуск процесса → подтверждение → применение → возможная долговременная фиксация;
- постановка проблемы стоимости долговременной фиксации результата;
- различение рабочей, архивной и долговременной фиксации;
- вклад в обсуждение СКРИЖАЛЕЙ;
- материалы и идеи понятийной модели БЛАГОПОЛУЧИЯ;
- принцип отделения короткого понятийного ядра от исследовательских гипотез.

Эти пункты не создают автоматически current-задач и не отменяют более новые approved-источники.

## Что НЕ перенесено в current

### Legacy role

Старый представительско-переговорный профиль и связанные с ним материалы остаются `legacy/provenance`.

Не переносить автоматически:

- `shtabist-first-cycle-plan.md`;
- `shtabist-main-cycle.md`;
- `shtabist-audience-package-matrix.md`;
- `shtabist-resource-ally-briefing-note.md`;
- `shtabist-route-accepted.md`.

### Legacy draft

`file-work-canon-v2_1-proposed-amendments.md` — исторический вклад, но не current canon.

### Unfinished legacy routes

Старый snapshot зафиксировал неподтверждённые маршруты:

- `SHT__concept-model-development-brief__KOO.md` → KOO;
- `SHT__concept-model-skrijali-intake__ARH.md` → ARH;
- `SHT__concept-model-boundaries__KAN.md` → KAN;
- `SHT__blagopoluchie-concept-development-package__OPR.zip` → OPR.

Они сохраняются как `legacy_unfinished_routes`.

Новая роль не должна автоматически возобновлять их. Возврат к ним требует отдельного решения КООРДИНАТОРА/ОПЕРАТОРА с проверкой фактического состояния файлов и адресатов.

## Current active

Одна задача после успешного cold-start:

> превратить смысловую модель общей среды Сущностей в организационную модель процессов, жизненных циклов, ответственности, прямого взаимодействия, эскалации и уровней человеческого контроля.

Входы задачи передаются после `initiation_verified`.

## Pending

После организационной модели:

- КООРДИНАТОР анализирует её совместно со смысловым кандидатом КАНЦЕЛЯРА;
- спорные нормативные пункты возвращаются КАНЦЕЛЯРУ;
- готовые организационные примитивы передаются в техническую спецификацию КОДЕРУ.

## Parked / provenance-only

До отдельного решения:

- старый представительский цикл;
- незавершённые маршруты concept-package;
- дальнейшая разработка старой понятийной последовательности `Потребность/Желание → Мера → Польза...`;
- старые материалы по СКРИЖАЛЯМ, если они не востребованы текущей организационной задачей.

## Unknown

Не подтверждены:

- фактическая доставка старых concept-package файлов в адресные чаты;
- нормативный статус `blagopoluchie-concept-core.md` как Project Source;
- полный состав старого домашнего каталога SHT;
- иные материалы старого SHT вне доступных источников.

`unknown` не реконструировать.

## Safe next step

Clean cold-start нового SHT по внешнему current recovery.

После успешной инициации отдельно передать:

- `KAN__entity-environment-semantic-foundation-v01-candidate__KOO.md`;
- `KOO__organizational-model-task__SHT.md`.

---

entity: SHT
document_type: recovery-snapshot
status: current_snapshot
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
pre_reconfiguration_preservation: externally_published
old_role_state: legacy_provenance
legacy_unfinished_routes: preserved_not_reactivated
project_time: generated_without_trusted_project_time
