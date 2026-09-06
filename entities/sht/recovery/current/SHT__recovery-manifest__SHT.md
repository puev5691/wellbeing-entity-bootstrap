# ШТАБИСТ: recovery manifest

## Locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/recovery/current
    ref: main
    manifest: SHT__recovery-manifest__SHT.md
    checksums: sha256sums.txt

`main` изменяемый. При cold-start необходимо зафиксировать конкретный commit и blob identifiers.

## Состав current recovery

- `SHT__role-definition-current__SHT.md`
- `SHT__initiation-current__SHT.md`
- `SHT__snapshot__SHT.md`
- `SHT__recovery-manifest__SHT.md`
- `sha256sums.txt`

## Preservation старого экземпляра

До clean cold-start выполнено отдельное внешнее сохранение старого доступного экземпляра:

    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sht/preservation/pre-reconfiguration/SHT__pre-reconfiguration-snapshot__KOO.md
    publication_commit: 41be23ce9b75451d71d60570910655c0aa0c101f
    sha256: 07c8b79dccdd46526ba3df9e4d9ebc456f112d7ac1ed921a819d8b1b53658d02

Preservation-файл является provenance/evidence старого экземпляра и не входит в current recovery как current-state.

Новый экземпляр не обязан читать его полностью для `initiation_verified`, если current snapshot и manifest доступны и целостны. Но locator должен быть сохранён как provenance.

## Входные артефакты текущей задачи

Текущая организационная задача передаётся после cold-start отдельным адресным пакетом:

- `KAN__entity-environment-semantic-foundation-v01-candidate__KOO.md`;
- `KOO__organizational-model-task__SHT.md`.

Они не являются частью recovery-памяти SHT и не требуются для подтверждения `initiation_verified`.

## Порядок проверки

1. проверить внешний current recovery каталог;
2. убедиться, что recovery содержит ожидаемые пять файлов;
3. прочитать `sha256sums.txt`;
4. пересчитать/сверить SHA-256 четырёх содержательных recovery-файлов;
5. зафиксировать commit/blob identifiers;
6. только затем принять role-definition и current snapshot;
7. зафиксировать preservation locator как provenance старого экземпляра;
8. вернуть статус инициации.

Входные task-артефакты проверяются уже после успешной инициации, перед профильным исполнением.

## Границы recovery

Recovery не делает current:

- старую память чатов SHT;
- старый представительский профиль;
- старые незавершённые маршруты;
- старые draft-каноны;
- неподтверждённые пути;
- secrets;
- production-конфигурации;
- техническую спецификацию будущей среды.

Старые незавершённые маршруты сохранены только как `legacy_unfinished_routes` в current snapshot и не возобновляются автоматически.

---

entity: SHT
document_type: recovery-manifest
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
preservation_before_reconfiguration: completed
project_time: generated_without_trusted_project_time
