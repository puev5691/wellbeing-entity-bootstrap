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

## Обязательные внешние входы текущей задачи

- `entities/kan/reports/KAN__entity-environment-semantic-foundation-v01-candidate__KOO.md`
- `entities/sht/tasks/KOO__organizational-model-task__SHT.md`

Они не являются частью recovery-памяти SHT, но являются входными артефактами текущей задачи.

## Порядок проверки

1. проверить внешний каталог;
2. убедиться, что recovery содержит ожидаемые файлы;
3. прочитать `sha256sums.txt`;
4. пересчитать/сверить SHA-256 четырёх содержательных recovery-файлов;
5. зафиксировать commit/blob identifiers;
6. только затем принять роль и snapshot;
7. проверить доступность двух входных артефактов;
8. вернуть статус инициации.

## Границы recovery

Recovery не содержит:

- старую память чатов SHT;
- secrets;
- production-конфигурации;
- старые задачи без подтверждения;
- техническую спецификацию будущей среды.

---

entity: SHT
document_type: recovery-manifest
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
