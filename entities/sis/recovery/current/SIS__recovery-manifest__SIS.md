# SIS recovery manifest — instance replacement

## Состав

Core recovery files:

- `SIS__initiation-current__SIS.md`
- `SIS__snapshot__SIS.md`
- `SIS__recovery-manifest__SIS.md`
- `SIS__preservation-handoff__ARH.md`
- `sha256sums.txt`

Artifacts required to continue current task:

- `artifacts/KOO__OSS-v06-exact-binary-transport__SIS.md`
- `artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`
- `artifacts/SIS__OSS-real-host-preflight-report-verified__KOO.md`
- `artifacts/SIS__OSS-v06-recovery-artifact-integrity-blocker__KOO.md`

## Provenance

`KOO__OSS-v06-exact-binary-transport__SIS.md` and exact binary were supplied by ОПЕРАТОР in the current SIS conversation as the KOO handoff package.

Preflight and integrity-blocker reports were created by this SIS instance from verified tool results earlier in the same work cycle.

## Exact binary identity

- size: `109510` bytes
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`
- Git blob: `93f1208d60b058867a4fde4df61689785d216e17`
- internal checksum verification at preservation: `47/47 OK`

## Current Git task state

Repository:
`puev5691/wellbeing-entity-bootstrap`

Repair ref:
`refs/heads/repair/oss-v06-exact-binary-20260908`

Observed tip at preservation:
`ac4715118bf0ba5ed964c359117820b570d19eb1`

Binary transport is incomplete. Branch creation alone is not task completion.

## External recovery state

Existing external SIS recovery locator:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/sis/recovery/current
    ref: main

Observed existing package is an older SIS recovery v1.2 and must not silently overwrite this snapshot's newer self-state.

Under active preservation governance, this current-writer package is handed to АРХИВАРИУС for publication/readback/recovery-registry processing.

`external_publication_current_package: not_claimed`

`readback_current_package: not_claimed`

## Recoverability

The package itself is self-contained for the current exact-binary transport because it includes the exact binary and the task handoff.

A new SIS may load it and continue after checksum verification, but must mark external continuity as unverified until ARH completes publication/readback.

---
document_type: SIS-recovery-manifest
package_status: self_preservation_ready_for_ARH
production_allowed: no
project_time: generated_without_trusted_project_time
