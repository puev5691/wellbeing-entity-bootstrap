# KOO emergency recovery v04 — MANIFEST

status: CURRENT_WRITER_CANDIDATE_FOR_ARH_VERIFICATION

## Package purpose

Preserve the latest authoritative KOO state before emergency replacement of the current chat.

This candidate is newer than the last canonical recovery but is not canonical until ARH verifies and publishes/records it under the recovery process.

## Composition

- KOO__initiation-current__KOO.md
- KOO__snapshot__KOO.md
- SOURCES.md
- KOO__emergency-initiation-master-v04.md
- KOO__preservation-handoff__ARH.md
- MANIFEST.md
- sha256sums.txt

## External locator

store: github
repository: puev5691/wellbeing-entity-bootstrap
path: entities/koo/preservation/pending/emergency-initiation-v04
ref: main until immutable dispatch ref is published
manifest: MANIFEST.md
checksums: sha256sums.txt

## Canonical predecessor

repository: puev5691/wellbeing-entity-bootstrap
path: entities/koo/recovery/current
ARH registry recovery commit:
cbaad4cb94618788f5d50664d08d503a3247f61c

## Significant external references

wellbeing-hq fresh boundary before candidate creation:
85551290ebe6ae527b7a0ffdafb6e2f20b79433f

ARH inbox lifecycle review:
entities/archivarius/outbox/ARH__inbox-lifecycle-operational-review__KOO.md
commit: 1b6aab5e50c759a7027b3c5b370475fe35417eec
blob: 1f8217d29fcc294178734b303df756113066662a

SHD preservation verification:
entities/archivarius/outbox/ARH__shd-role-v2_3-recovery-verification__SHD.md
commit: 29e0a61e4a79842505a279bd131d25cb64978f5e

source-loading-policy v2.1 candidate:
entities/kancelar/outbox/source-loading-policy-v2_1-candidate.md
commit: 59ae5c036151460ca63a0e2ccd37d4aa53c88aaf
blob: da9bee953187c835aded8a4fc6edbc3ec50047b6
status: candidate awaiting OPERATOR approval

## Integrity

sha256sums.txt covers all package files except sha256sums.txt itself.

The immutable package commit/ref must be recorded in the addressed KOO->ARH dispatch after final checksum publication.

## Failure mode

Any mismatch in file composition, checksum, provenance, status or authority means verification FAIL.
Keep the current canonical KOO recovery unchanged until a clean ARH PASS.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: manifest emergency recovery v04
СТАТУС: candidate_for_ARH_verification
