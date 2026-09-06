# Recovery-манифест КООРДИНАТОРА

## Назначение

Манифест current recovery Сущности KOO / КООРДИНАТОР.

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/2026-09-05
    ref: main
    manifest: MANIFEST.md
    checksums: sha256sums.txt

## Проверяемый состав

- `KOO__snapshot__KOO.md` — current snapshot;
- `../../initiation/KOO__initiation-current__KOO.md` — current initiation;
- `../../boards/KOO__priority-board__KOO.md` — current priority board;
- `../../boards/KOO__entity-recovery-registry__KOO.md` — recovery registry;
- `../../boards/KOO__parked-research__KOO.md` — parked research;
- `../../developments/KOO__shared-entity-environment__KOO.md` — active development-state;
- `../../preservation/pre-reconfiguration/KOO__pre-reconfiguration-snapshot__KOO.md` — provenance заменяемого экземпляра;
- `sha256sums.txt` — SHA-256 проверяемого состава.

## Обязательные внешние источники

Пять действующих approved Project Sources проекта.

## Порядок cold-start

1. Прочитать approved Project Sources.
2. Открыть этот locator.
3. Проверить фактический состав.
4. Сопоставить SHA-256.
5. При mutable `main` зафиксировать фактически прочитанный commit.
6. Прочитать current initiation, snapshot, board, registry и development-state.
7. Preservation использовать как provenance, а не как замену current.
8. Вернуть один из статусов:
   - `initiation_verified`;
   - `initiation_loaded_external_unverified`;
   - `initiation_failed`.

## Acceptance

`initiation_verified` допустим только после внешней проверки.

После успешного cold-start новый KOO должен увидеть как минимум:

- SHT = `upgraded`;
- common entity environment = active development;
- organizational model SHT = ближайший профильный шаг;
- KOD independent verification = pending.

Если эти факты не подтверждаются проверяемым current state, cold-start не должен молча их выдумывать.

---

entity: KOO
artifact_role: recovery_manifest
storage: GitHub
status: current
recovery_canon: v1.2 approved
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
