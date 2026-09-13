# SHD recovery integrity correction — forensic note

status: VERIFIED_CHECKSUM_BOUNDARY_ERROR
project_time: omitted; trusted project-time source not used

## Contradiction

Historical ARH verification:
`entities/archivarius/outbox/ARH__shd-role-v2_3-recovery-verification__SHD.md`
commit `29e0a61e4a79842505a279bd131d25cb64978f5e`
reported `4/4 PASS` against the checksum values stored in the historical `sha256sums.txt`.

KOO independent failover verification:
`entities/koordinator/outbox/KOO__SHD-emergency-failover-v02-verification__ARH.md`
commit `0b70266d37f0a83bcef5f86b6fc2e783b7eeee52`
reported `0/4 PASS`, `4/4 FAIL` when hashing exact raw Git blob bytes.

## Independent ARH reconciliation

ARH independently fetched each exact Git blob through the Git object API and recomputed SHA-256 from the returned UTF-8 content boundary.

For all four files the same defect pattern was reproduced:

1. SHD__initiation-current.md
- raw blob bytes: `468ee800b2ae5c64750afbc5d38958e75dae8b50e9a9faa9b5cb9a62d4c464a9`
- same bytes plus one final LF: `f72f0a7ccf9a902170fcdc4d2b29c25dba6aeb072293a3b897b7d84f2db51d6a`

2. SHD__snapshot.md
- raw blob bytes: `f149f92587d3d830deb555a46d4b364512ac57a4b35cdb7968825684cd7e0db9`
- same bytes plus one final LF: `02ee57d1a60d518ff307a5423df3db95b37248fc5b1941f7cec0105b4cf59f8d`

3. SOURCES.md
- raw blob bytes: `12b9427daaf1886631ec512b62b301c5a19c7faefb5492410f1ff2720630da28`
- same bytes plus one final LF: `708d7f39fd20cc704203f56b56191d757a4a1b9d96adf8f2863944677e3d9a6d`

4. RECOVERY-MANIFEST.md
- raw blob bytes: `8fdc55a16dbdf275be9d6324a8f7390620a095683a00894ff1ec85a4fe994150`
- same bytes plus one final LF: `aa429e2bc380d1c5761bf85347f9bb614bafab7877f1a22a5d0b7928d3321f9e`

The `+ final LF` values are exactly the historical checksum-table values and exactly the values repeated by verification commit `29e0a61e...`.

## Root cause

The original checksum table was generated against a text representation containing a final newline. The published Git blobs at immutable commit `ce9891f...` do not contain that final newline.

Historical verification `29e0a61e...` therefore validated the normalized/text-generation boundary, not the exact raw Git blob byte boundary it claimed to validate.

This is a checksum-generation / verification-boundary defect. It is not a wrong Git path, wrong Git commit, wrong blob identity, or content-composition substitution.

## Historical treatment

Do not edit or delete:
- commit `ce9891f...`;
- historical `sha256sums.txt`;
- verification commit `29e0a61e...`.

They remain provenance of the defect.

Any future SHD recovery verification must use exact raw Git blob bytes or an immutable checkout and must never silently append/remove newline bytes before hashing.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: объяснить 4/4 checksum contradiction без переписывания истории
СТАТУС: verified_checksum_boundary_error