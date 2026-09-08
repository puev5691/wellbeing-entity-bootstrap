# ARH recovery manifest v1.4 — post-OSS v0.6 checkpoint

## Назначение

Manifest внешнего recovery-пакета АРХИВАРИУСА после KOD exact-binary recovery repair, SIS recovery publication/readback и последующей fresh SIS verification.

## Locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/arh/recovery/current
    ref: main
    manifest: ARH__recovery-manifest__ARH.md
    checksums: sha256sums.txt

`main` mutable; immutable publication commit фиксируется completion report после публикации.

## Состав

1. `ARH__initiation-current__ARH.md`
2. `ARH__snapshot__ARH.md`
3. `ARH__recovery-manifest__ARH.md`
4. `ARH__recovery-registry__ARH.md`
5. `ARH__source-change-cycle-report__KOO.md` — сохранённый provenance предыдущего source-change cycle, не текущий checkpoint report.
6. `sha256sums.txt` — SHA-256 пяти содержательных файлов.

## Integrity / readback

Recovery package считается externally published/verified только после:
1. публикации всех шести файлов;
2. immutable commit fixation;
3. fresh external readback;
4. `sha256sum -c sha256sums.txt` = `5/5 OK`;
5. фиксации Git blob identities recovery-файлов.

## Active sources

Точные active source identities находятся в initiation/snapshot. Project Sources в пакет не копируются.

## Provenance

Предыдущий значимый ARH registry commit до этого checkpoint:
`fd7366983561a25c6be74d85f6280df915e2f244`.

KOD repair:
`48a8aa581147cfe1c0560e46a2edee291ed371e8`.

SIS recovery publication:
`950f01dc5cdb56c3ea63ba540c4e72eda24973bb`.

## Границы

- чужой self-state не переписывается;
- Stage A staging не является production/deployment authority;
- fresh ARH cold-start этим checkpoint не требуется;
- mass checkpoint campaign запрещена;
- approved Project Sources не меняются.

## Следующий безопасный шаг

Завершить external publication/readback текущего ARH package и вернуть completion report КООРДИНАТОРУ.

---
package_id: ARH-recovery-current-v1.4-post-OSS-v06
source_location: authoritative current-writer ARH current chat
status: current_manifest
recovery_standard: v1.4
project_time: generated_without_trusted_project_time
