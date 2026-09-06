# Recovery-манифест КООРДИНАТОРА

## Назначение

Манифест текущего recovery-пакета Сущности KOO / КООРДИНАТОР.

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/2026-09-05
    ref: main
    manifest: MANIFEST.md
    checksums: sha256sums.txt

## Проверяемый состав

- `KOO__snapshot__KOO.md` — текущее состояние КООРДИНАТОРА;
- `../../initiation/KOO__initiation-current__KOO.md` — актуальная инициация;
- `../../boards/KOO__priority-board__KOO.md` — текущая доска ближайших работ;
- `../../boards/KOO__entity-recovery-registry__KOO.md` — текущий реестр recovery-апгрейда;
- `../../boards/KOO__parked-research__KOO.md` — parked research;
- `sha256sums.txt` — контрольные суммы проверяемого recovery-состава.

## Обязательные внешние источники

- `../../../../policies/entity-state-preservation-and-recovery-canon.md`;
- действующий универсальный файловый канон проекта;
- действующая core-инструкция проекта;
- краткие роли Сущностей;
- политика загрузки источников.

## Проверка инициации

Новый экземпляр должен:

1. открыть locator;
2. проверить наличие перечисленных файлов;
3. сопоставить контрольные суммы с `sha256sums.txt`;
4. различить `initiation_verified`, `initiation_loaded_external_unverified`, `initiation_failed`;
5. только после успешной проверки утверждать, что recovery внешне подтверждён.

## Статус

Пакет приведён к требованиям утверждённого recovery-канона v1.2.

---

entity: KOO  
artifact_role: recovery_manifest  
storage: GitHub  
status: current  
recovery_canon: v1.2 approved  
project_scope: ШТАБ БЛАГОПОЛУЧИЯ  
project_time: generated_without_trusted_project_time
