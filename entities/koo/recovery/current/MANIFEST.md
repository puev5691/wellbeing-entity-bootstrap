# Recovery-манифест КООРДИНАТОРА — post-StageA authority-defect

## Назначение

Current recovery package KOO после persistent Stage A запуска ОСС, выявления `evidence_scope_widening` и preservation content-gap resolution.

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/current
    ref: main
    manifest: MANIFEST.md
    checksums: sha256sums.txt

Mutable `main` не является достаточной version identity. Для recovery требуется immutable publication commit + checksum/blob verification.

## Проверяемый состав

- `KOO__snapshot__KOO.md`;
- `../../initiation/KOO__initiation-current__KOO.md`;
- `../../boards/KOO__priority-board__KOO.md`;
- `../../boards/KOO__entity-recovery-registry__KOO.md`;
- `../../boards/KOO_preservation-operations_ARH.md`;
- `../../developments/KOO__shared-entity-environment__KOO.md`;
- `sha256sums.txt`.

Composition сохранён решением KOO current-writer. `KOO_preservation-operations_ARH.md` остаётся provenance предыдущего preservation trigger и не объявляется новым current task.

## Current critical state

- Stage A installation/runtime mechanics: `PASS`;
- Stage A operational acceptance: `BLOCKED`;
- blocker: `evidence_scope_widening`;
- first Entity: `ent:KOO`;
- writer grants: `0`;
- public ingress/production: prohibited;
- corrected core v0.7 logic review: `PASS`, `148/148`;
- deploy bundle v0.2: `BLOCKED_METADATA_CORRECTION`;
- real-host repair: not authorized.

## Integrity / readback

Externally verified recovery требует:

1. наличие всех файлов composition;
2. SHA-256 по `sha256sums.txt`;
3. immutable publication commit;
4. Git blob identities значимых файлов;
5. post-publication readback.

Fresh KOO replacement instance данным checkpoint автоматически не запускается.

## Provenance

KOO content-gap resolution передал current replacements registry/development-state и подтвердил неизменность composition.

Joint immutable state этих двух KOO-authored replacements до ARH publication:

`895563409f21669cacb0d9fc9690c727c93e188b`.

## Следующий безопасный шаг

После verified recovery продолжать current KOO priority: получить corrected immutable deploy bundle, независимо принять или отклонить его и только после PASS выдать отдельную SIS host-repair task.

---
entity: KOO
artifact_role: recovery_manifest
status: current
recovery_canon: v1.4 approved
stageA_operational_acceptance: BLOCKED
production_allowed: no
project_time: generated_without_trusted_project_time
