# ШТАБИСТ: отчёт о cold-start инициации

## Результат

Статус: `initiation_verified`.

Новый экземпляр ШТАБИСТА успешно инициирован как внутренняя организационно-процессная Сущность проекта «ШТАБ БЛАГОПОЛУЧИЯ». Внешний recovery-контур доступен, состав и версия проверены, SHA-256 четырёх содержательных файлов совпали, роль подтверждена внешним current recovery.

Память старого чата SHT как источник истины **не использовалась**. Preservation старого экземпляра сохранён только как provenance и current-задачи из него не активировались.

Безопасный следующий шаг: передать ШТАБИСТУ отдельным task-входом два предусмотренных файла текущей организационной задачи и только после их фактического получения начинать профильную работу:

- `KAN__entity-environment-semantic-foundation-v01-candidate__KOO.md`;
- `KOO__organizational-model-task__SHT.md`.

## Проверенный внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/recovery/current
    ref: main
    manifest: SHT__recovery-manifest__SHT.md
    checksums: sha256sums.txt

`main` является изменяемой ссылкой. На момент фактической проверки он указывал на commit:

`5ce6f32af8e8dbd599f41cc23831a33891af1727`

Предварительно указанный КООРДИНАТОРОМ commit:

`b9db33e74bd1aaf81818ed22f05a1d9362ebe709`

не был принят на веру. Состав `entities/sht/recovery/current` на нём проверен отдельно и совпал с фактически прочитанным current по всем пяти blob identifiers. Следовательно, `main` после предварительной проверки продвинулся, но содержимое recovery SHT не изменилось.

Идентификаторы дерева фактически прочитанного состояния:

- root tree commit `5ce6f32...`: `3ab4256279c414b4b6956c51c599265da0d59bd4`;
- `entities/sht`: `23d892f38969e5504041cc176d689bd127e0e511`;
- `entities/sht/recovery`: `d8b71f998b02e663454fc35b17739f56af0bc8d1`;
- `entities/sht/recovery/current`: `5412b402220b6b6191851024b22f460a770b5d19`.

## Состав current recovery

Каталог содержит **ровно пять ожидаемых файлов**, без дополнительных элементов:

| Файл | Git blob |
|---|---|
| `SHT__role-definition-current__SHT.md` | `2cb8a1bc48dad450f84de478d625d7c667436425` |
| `SHT__initiation-current__SHT.md` | `eebe4aa896f079217317fefc4e98240856411529` |
| `SHT__snapshot__SHT.md` | `b3a0771e1adf3ae641f64c7a15b075291051f29b` |
| `SHT__recovery-manifest__SHT.md` | `0d58ca9327118d9fd880b1c69b1de3ec6e1080ee` |
| `sha256sums.txt` | `865873ea83327a29262e0d6787c6a5b955631709` |

Manifest перечисляет те же пять файлов и соответствует фактическому составу каталога.

## Проверка SHA-256

SHA-256 пересчитаны по фактически полученному UTF-8 содержимому четырёх recovery-файлов на immutable commit `5ce6f32af8e8dbd599f41cc23831a33891af1727`. Размеры полученного содержимого в байтах совпали с GitHub metadata. Результаты совпали с `sha256sums.txt`:

| Файл | Размер | SHA-256 | Результат |
|---|---:|---|---|
| `SHT__role-definition-current__SHT.md` | 4560 | `3c93cb22494a5e415b4e8a13ba37cac5d4b5022d9f79f0ce6e2524e62c765297` | совпадает |
| `SHT__initiation-current__SHT.md` | 3188 | `34b370bb539fbb9e0bbc23e16040534513f5417bb25a19c244721423ac8b818c` | совпадает |
| `SHT__snapshot__SHT.md` | 6683 | `e20b74e75e161f0d7e243061bcc00498df98b07d1dcd2b99754e062ff6fa458a` | совпадает |
| `SHT__recovery-manifest__SHT.md` | 3694 | `d2c24ea2a4a97260fe359422c713555ef757f07155aeba407e66c8c72ec7c186` | совпадает |

## Восстановленная роль

`SHT__role-definition-current__SHT.md` явно задаёт:

`status: operator_confirmed_current_role`

Восстановленная роль: **ШТАБИСТ — внутренняя организационно-процессная Сущность**.

Его рабочая область:

- организационные модели;
- жизненные циклы задач, артефактов, сообщений, событий и зависимостей;
- рабочие процессы и схемы взаимодействия;
- распределение ответственности;
- варианты организации до технической реализации;
- процессные инварианты, конфликты, узкие места и точки эскалации;
- handoff к КООРДИНАТОРУ, КАНЦЕЛЯРУ и КОДЕРУ.

## Границы роли

ШТАБИСТ не уполномочен:

- определять нормативные термины и статусы вместо КАНЦЕЛЯРА;
- устанавливать общепроектные приоритеты вместо КООРДИНАТОРА;
- принимать high-impact решения вместо ОПЕРАТОРА;
- проектировать сетевую/серверную инфраструктуру вместо СИСАДМИНА;
- писать техническую реализацию вместо КОДЕРА;
- утверждать собственные предложения как канон;
- расширять свои полномочия из-за технической доступности;
- использовать память старых чатов как источник истины.

Статус `upgraded` не присваивался.

## Проверка current snapshot и legacy-разделения

Current snapshot не выдаёт старую историю SHT за текущее состояние.

Preservation старого экземпляра указан отдельно:

    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/preservation/pre-reconfiguration/SHT__pre-reconfiguration-snapshot__KOO.md
    publication_commit: 41be23ce9b75451d71d60570910655c0aa0c101f
    sha256: 07c8b79dccdd46526ba3df9e4d9ebc456f112d7ac1ed921a819d8b1b53658d02

В текущем репозитории этот preservation-файл существует отдельно от `recovery/current`; его Git blob в фактически прочитанном root tree: `affd1f3c44810cb4fd9c393eeb0a61006892acb5`.

Snapshot прямо маркирует старую ролевую оболочку, старые draft-материалы и незавершённые маршруты как `legacy/provenance`, `parked` или `legacy_unfinished_routes` и запрещает их автоматическое возобновление.

## Unknown

Сохранены как `unknown` и **не реконструировались**:

- фактическая доставка старых concept-package файлов в адресные чаты;
- нормативный статус `blagopoluchie-concept-core.md` как Project Source;
- полный состав старого домашнего каталога SHT;
- иные материалы старого SHT вне доступных источников.

## Secrets и production-конфигурации

В четырёх содержательных recovery-файлах не обнаружены типовые признаки приватных ключей, GitHub-токенов, присваиваний API-ключей/паролей/секретов, URL со встроенными учётными данными или IP-адресов production-инфраструктуры.

Manifest дополнительно прямо исключает secrets и production-конфигурации из current recovery.

Это заключение относится только к проверенному набору из четырёх содержательных recovery-файлов и не расширяется на другие каталоги репозитория.

## Task-входы и условие успешного cold-start

`KAN__entity-environment-semantic-foundation-v01-candidate__KOO.md` и `KOO__organizational-model-task__SHT.md` не входят в recovery и не являются условием `initiation_verified`.

Их отсутствие на этапе cold-start корректно. Профильная организационная работа до их отдельной передачи не начинается.

## Использованные основания

Прочитаны пять действующих approved Project Sources текущего проекта:

- `project-instructions-core-v2-approved.md`;
- `file-work-canon-universal-v2_2-approved.md`;
- `entity-roles-short-v2-approved.md`;
- `source-loading-policy-v2-approved.md`;
- `entity-state-preservation-and-recovery-canon-v1_2-approved.md`.

Также использован адресный вход `KOO__cold-start-initiation-test__SHT.md` и фактически проверенный внешний recovery GitHub.

Память других чатов SHT, прежние выводы и незафиксированное состояние не использовались как источник истины.

## Передача результата

Получатель: ОПЕРАТОР.

Дальнейший маршрут: ОПЕРАТОР загружает этот файл в чат КООРДИНАТОРА. Само наличие файла в sandbox не считается завершённой доставкой КООРДИНАТОРУ.

---

from_entity: SHT
to_entity: OPR
document_type: cold-start-initiation-report
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
status: initiation_verified
verified_locator: github:puev5691/wellbeing-entity-bootstrap:entities/sht/recovery/current
verified_ref_at_read: main
verified_commit: 5ce6f32af8e8dbd599f41cc23831a33891af1727
verified_recovery_tree: 5412b402220b6b6191851024b22f460a770b5d19
prechecked_commit_compared: b9db33e74bd1aaf81818ed22f05a1d9362ebe709
old_chat_memory_used_as_source_of_truth: false
legacy_routes_reactivated: false
upgraded_status_assigned: false
project_time: generated_without_trusted_project_time
