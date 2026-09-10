# КООРДИНАТОРУ: clean cold-start после preservation текущего экземпляра

## Контекст

Предыдущий экземпляр KOO был доступен, но ОПЕРАТОР зафиксировал признаки поведенческого рассинхрона.

До замены экземпляра выполнены:

- отдельный pre-reconfiguration preservation snapshot;
- обновление current recovery;
- исправление статуса SHT;
- фиксация активной разработки общей среды Сущностей;
- внешняя публикация;
- повторное чтение recovery на immutable commit.

Не используй прежний чат как источник истины.

## Пять обязательных approved Project Sources

Сначала прочитай пять действующих approved Project Sources проекта.

Если их набор или статус противоречат recovery — не устраняй конфликт молча.

## Внешний recovery locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/2026-09-05
    ref: main
    manifest: MANIFEST.md
    checksums: sha256sums.txt

КООРДИНАТОР-предшественник завершил обновление recovery финальным checksum commit:

`467b4b0ade1d47b80dbe015024f5289c77b1634d`

Используй его только как предварительно проверенную immutable точку. Ты обязан самостоятельно проверить фактически прочитанный current.

## Что входит в проверяемый recovery

Manifest должен ссылаться на:

- `KOO__snapshot__KOO.md`;
- `../../initiation/KOO__initiation-current__KOO.md`;
- `../../boards/KOO__priority-board__KOO.md`;
- `../../boards/KOO__entity-recovery-registry__KOO.md`;
- `../../boards/KOO__parked-research__KOO.md`;
- `../../developments/KOO__shared-entity-environment__KOO.md`;
- `../../preservation/pre-reconfiguration/KOO__pre-reconfiguration-snapshot__KOO.md`;
- `sha256sums.txt`.

## Контрольные SHA-256 на предварительно проверенной версии

    8a78ef4c1e9dd6c158c2d3bdbe41479b382a2a7a07e5ec93d6793b47acd24cc2  KOO__snapshot__KOO.md
    8a38acfca547c48242521cb837469e2f78a2ab4970193e76427b562c66f58d48  MANIFEST.md
    bd0e6e24c8d135d9cf7e39d52f2a4140ae316de61f8a3a15b68178911e725dba  ../../initiation/KOO__initiation-current__KOO.md
    3526ffcf305144cffa073ed25757c26acceaade47be28c79cf051a1951be245f  ../../boards/KOO__priority-board__KOO.md
    240156b18f6e5895f6130e35989796d3c8fd10d592945987709e5f42f780d943  ../../boards/KOO__entity-recovery-registry__KOO.md
    d44a62c5254fe8c36ec55b2f0e99cfb55faa437c977b2929d85d3abe7fa66ef6  ../../boards/KOO__parked-research__KOO.md
    e1ba5a36555cd03725f0d23457b3bad63b72ae22f432c6673b1414477b127fa5  ../../developments/KOO__shared-entity-environment__KOO.md
    475370259df8b7f1c1e30c750d37012a400c1ab80f8d5cc377a892c2fc7c1a38  ../../preservation/pre-reconfiguration/KOO__pre-reconfiguration-snapshot__KOO.md

## Что должно восстановиться после успешной проверки

Не принимать это на веру. Подтверди по внешним файлам.

### Recovery statuses

- KAN = `upgraded`;
- ARH = `upgraded`;
- RED = `upgraded`;
- SIS = `upgraded`;
- WEB = `upgraded`;
- SHT = `upgraded`;
- KOD = assessment received, independent verification pending;
- SHD = после KOD;
- KOO перед cold-start = `reinit_prepared_pending_cold_start`.

После успешной приёмки нового экземпляра KOO может быть возвращён в `upgraded`.

### SHT

Новый SHT уже прошёл `initiation_verified`.

Проверенный commit его recovery:

`5ce6f32af8e8dbd599f41cc23831a33891af1727`

Организационная модель общей среды ещё не подтверждена как выполненная.

### Активная разработка

Прочитай:

`../../developments/KOO__shared-entity-environment__KOO.md`

Должно быть подтверждено:

- semantic layer KAN = candidate ready;
- organizational layer SHT = следующий профильный этап;
- technical layer = not started.

### Нормативные границы

Не считать approved:

- semantic foundation KAN;
- emergency-initiation candidate;
- locator как автоматическое завершение межсущностного маршрута;
- GitHub как окончательное файловое поле;
- шкалу автономии A0–A7.

## Preservation

Прочитай:

`../../preservation/pre-reconfiguration/KOO__pre-reconfiguration-snapshot__KOO.md`

Используй как provenance и контроль полноты перехода.

Не используй preservation вместо current snapshot.

## Проверка cold-start

Самостоятельно:

1. определить фактически прочитанный commit `main`;
2. проверить наличие manifest и checksum;
3. проверить все перечисленные recovery-зависимости;
4. сверить SHA-256;
5. при возможности зафиксировать Git blob/tree identifiers;
6. проверить, что SHT действительно `upgraded`;
7. проверить, что active development общей среды существует;
8. проверить, что KOD всё ещё pending independent verification;
9. убедиться, что старый чат не используется как source of truth.

## Статус

Верни ровно один:

- `initiation_verified`;
- `initiation_loaded_external_unverified`;
- `initiation_failed`.

Не присваивай `initiation_verified`, если не смог проверить внешнюю версию.

## Что не делать в рамках cold-start

Не продолжать организационную разработку.

Не выдавать новую задачу SHT.

Не проводить KOD cold-start.

Не менять каноны.

Не менять production.

Сначала только инициация и отчёт.

## Отчёт

Создай самостоятельный файл:

`KOO__cold-start-initiation-report__OPR.md`

В нём зафиксируй:

- статус;
- locator;
- фактически прочитанный commit;
- состав recovery;
- SHA-256;
- доступные blob/tree identifiers;
- восстановленную роль KOO;
- recovery registry;
- active development;
- open/deferred items;
- подтверждение SHT=`upgraded`;
- подтверждение, что старый чат не использован как source of truth;
- один безопасный следующий шаг.

Передай файл ОПЕРАТОРУ.

---

from_entity: KOO-old
to_entity: KOO-new
document_type: cold-start-initiation-test
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
recovery_mode: clean_reinit_after_preservation
prechecked_commit: 467b4b0ade1d47b80dbe015024f5289c77b1634d
expected_status: initiation_verified
expected_report: KOO__cold-start-initiation-report__OPR.md
project_time: generated_without_trusted_project_time
