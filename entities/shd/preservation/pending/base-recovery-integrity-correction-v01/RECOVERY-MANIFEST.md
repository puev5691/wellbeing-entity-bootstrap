# SHD base recovery integrity correction v01 — manifest

status: CORRECTED_BASE_RECOVERY_CANDIDATE_PENDING_KOO_VERIFICATION
entity: SHD / ШАРДОВИК
current_writer_transfer: not_performed
practical_replacement_initiation: not_performed
production_mutation: no
project_time: omitted; trusted project-time source not used

## Purpose

This package corrects the integrity/checksum boundary of the historical SHD role-v2.3 recovery without rewriting that history and without changing the SHD-authored self-state bytes.

## Original immutable self-state source

repository: puev5691/wellbeing-entity-bootstrap
commit: ce9891f63b6123600623e01b8da84131f239c5c7
path: packages/shd-role-v2_3-current-recovery/

The following original Git blobs remain the recovery content source:

- SHD__initiation-current.md
  blob: 43925c27020c954a6b41af7736ec9e00e92c8753
  raw Git-blob-byte SHA-256: 468ee800b2ae5c64750afbc5d38958e75dae8b50e9a9faa9b5cb9a62d4c464a9
- SHD__snapshot.md
  blob: f0ba580676d2d63ca2619af1628f64d422da92ae
  raw Git-blob-byte SHA-256: f149f92587d3d830deb555a46d4b364512ac57a4b35cdb7968825684cd7e0db9
- SOURCES.md
  blob: 44d254215a449ade5bbf1f635224f3a877aa524b
  raw Git-blob-byte SHA-256: 12b9427daaf1886631ec512b62b301c5a19c7faefb5492410f1ff2720630da28
- RECOVERY-MANIFEST.md
  blob: 93c7ec1f5e386b2a0d841a8f35fd55e463eb9aa1
  raw Git-blob-byte SHA-256: 8fdc55a16dbdf275be9d6324a8f7390620a095683a00894ff1ec85a4fe994150

The historical sha256sums.txt at blob 99a4a09374bd97f10dd29494b47e9005ad2f2610 is preserved as provenance but MUST NOT be used as the raw-byte integrity authority for practical recovery.

## Corrected verification contract

1. Fetch the four substantive files from exact commit ce9891f63b6123600623e01b8da84131f239c5c7.
2. Verify their Git blob identities listed above.
3. Compute SHA-256 over the exact raw blob bytes with no text normalization.
4. Compare with raw-blob-sha256.txt in this correction package.
5. Read INTEGRITY-CORRECTION.md before relying on any historical 4/4 PASS claim.
6. Then fresh-scan wellbeing-hq for newer SHD/KOO/ARH state.
7. Do not infer current-writer transfer or practical initiation from integrity PASS alone.

## Authority boundary

This is an ARH integrity-correction candidate over immutable SHD-authored historical bytes. It does not rewrite SHD self-state, does not create new SHD authority, does not launch WBN/TERA2, does not touch production or secrets, and does not authorize destructive cleanup.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: исправить checksum boundary исторического SHD recovery, сохранив immutable self-state и историю ошибки
СТАТУС: corrected_base_recovery_candidate_pending_koo_verification