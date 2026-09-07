# KOD recovery manifest v1.3

## Назначение

Проверяемый recovery-пакет КОДЕРА после принятия isolated external sandbox ОСС v0.6 и перед real-host stage.

Пакет должен позволить новому экземпляру восстановить роль, current-state, accepted executable baseline, ограничения и один безопасный следующий шаг без реконструкции по памяти.

## Состав

- `KOD__initiation-current__KOD.md`;
- `KOD__snapshot__KOD.md`;
- `KOD__recovery-manifest__KOD.md`;
- `artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`;
- `artifacts/KOD_entity-env-sandbox-v06-report_KOO.md`;
- `artifacts/KOO_entity-env-sandbox-v06-review_KOD.md`;
- `sha256sums.txt`.

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/kod/recovery/current
    ref: main
    manifest: KOD__recovery-manifest__KOD.md
    checksums: sha256sums.txt

`main` является mutable ref. После публикации текущий preservation-cycle должен быть зафиксирован immutable commit и readback.

## Обязательные Project Sources

- `project-instructions-core-v2_1-approved.md` — `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`;
- `entity-roles-short-v2_1-approved.md` — `1a644a378eea0edc0257884da26a15bbcfe5fbd41fdbdfb24f0540777a842e2b`;
- `entity-state-preservation-and-recovery-canon-v1_3-approved.md` — `9d493a9691e51bc1c2df85c74eaad7d35b03471828c91bf6ed504e5657061d47`;
- `file-work-canon-universal-v2_3-approved.md` — `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`;
- `source-loading-policy-v2-approved.md` — `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`.

## Значимые artifact references

### Accepted executable baseline

    artifact_identity: KOD_entity-env-sandbox-v06_KOO.tar.gz
    source_entity: KOD
    locator: entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz
    version_identity: sha256:2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
    normative_status: accepted_for_real_host_preflight
    purpose: code/package baseline for next deployment stage

### Independent acceptance

    artifact_identity: KOO_entity-env-sandbox-v06-review_KOD.md
    source_entity: KOO
    locator: entities/kod/recovery/current/artifacts/KOO_entity-env-sandbox-v06-review_KOD.md
    version_identity: sha256:f80ceefd3009aac283768ab7fde18b918cb6f7a87345fc1166e8bb3f2f499d01
    normative_status: accepted_review
    purpose: exact acceptance status and host-stage boundaries

### KOD report

    artifact_identity: KOD_entity-env-sandbox-v06-report_KOO.md
    source_entity: KOD
    locator: entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06-report_KOO.md
    version_identity: sha256:f879e22aad18c7e20661738588cc2e5a0ce27558e306a5133d42495fb88caf4e
    normative_status: implementation_report
    purpose: producer report for accepted baseline

## Cold-start procedure

1. Read the five approved Project Sources.
2. Open the external recovery locator.
3. Verify manifest and `sha256sums.txt`.
4. Record the immutable Git commit actually read.
5. Verify the sandbox archive SHA-256.
6. Read initiation, snapshot and KOO acceptance review.
7. Return `initiation_verified`, `initiation_loaded_external_unverified` or `initiation_failed`.
8. Do not deploy until a separate KOO task supplies verified host inputs.

## Failure rule

If the archive, review, required checksum or external locator is unavailable/mismatched, the active dependency is `unverified`/`unknown`; do not reconstruct or substitute a similar package.

---
entity: KOD
document_type: recovery-manifest
recovery_schema: v1.3
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
