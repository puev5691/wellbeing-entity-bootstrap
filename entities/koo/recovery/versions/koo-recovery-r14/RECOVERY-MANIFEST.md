# KOO recovery r1.4 manifest

status:
EXTERNAL_RECOVERY_SUCCESSOR

entity:
KOO / КООРДИНАТОР

target_repository:
puev5691/wellbeing-entity-bootstrap

target_path:
entities/koo/recovery/versions/koo-recovery-r14

project_time:
omitted

## Exact required composition

Exactly 9 files:

1. KOO__planned-chat-replacement-self-snapshot-r14.md
2. KOO__replacement-current-writer-r13.md
3. KOO__human-interface-contract-r02.md
4. SOURCES.md
5. TASK-STATE.md
6. KOO__recovery-initiation-boundary-r14.md
7. RECOVERY-LINEAGE.md
8. RECOVERY-MANIFEST.md
9. SHA256SUMS.txt

## Exact copied source identities

KOO self-snapshot:
source blob 8a39b17be502cfa4f356e69fb6f6374fdc2b5029
package blob 8a39b17be502cfa4f356e69fb6f6374fdc2b5029
SHA-256 0f82792f73a2d149937a90875ed6e7e32ff6c5bb5f0df9e415d039f464cf35f7

KOO current-writer:
source blob 5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1
package blob 5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1
SHA-256 cccc80f85f76ca1fcebd54fe9cef9fae1f404ac3802e59a4f5712f5ce5517749

Human Interface Contract:
source blob fdea31034c370220dfb961993059500716ccfe20
package blob fdea31034c370220dfb961993059500716ccfe20
SHA-256 34e365fb9675dccc6deaa5f48095cd65975f723f1ac798ea6bd5271f193df2ce

All three copied package Git blobs equal their exact source Git blobs.

## ARH-owned metadata provenance and identities

SOURCES.md
Git blob 901c10dab4c95f345ee908e177efb8cc22c3a039
SHA-256 615429abaee012a3acf246ac946b99ac54134c62e1a1fea6a4543db46045a05f

TASK-STATE.md
Git blob de031bb9b49a2cfbafb31ef0928283711c0dc223
SHA-256 c7f4487c206d1316b22fbaaeb611ad0cbd7040286ca5b9bc491587ff1830b504

KOO__recovery-initiation-boundary-r14.md
Git blob 8924c76f11dd717a6f1e1f7c2edcf250e7ebc5a3
SHA-256 ee58c42b36847c600c76bd087c8b3253e2d962f17191c751d96fce83b2505489

RECOVERY-LINEAGE.md
Git blob 0db3c435d8dfbef6197fb490c7434d6797381274
SHA-256 718e0e55965cd9b2a7ce54db2c54dcaf631f8c3f99989d60f6ea8aa803f68688

RECOVERY-MANIFEST.md
This manifest's own SHA-256 is recorded in SHA256SUMS.txt; its Git blob is recorded by the external recovery registry and terminal result.

SHA256SUMS.txt
Covers all 8 non-checksum files, including this manifest. The checksum file itself is excluded from its own coverage.

## Integrity rules

- exact composition: 9/9;
- copied source Git blob identity: 3/3;
- SHA256SUMS coverage: 8/8;
- independent immutable external readback required;
- exact source/current-writer equality required;
- manifest-to-tree correspondence required;
- no unexplained missing or extra files;
- mismatch is BLOCKED/FAIL, never silently repaired.

## Authority boundary

This package preserves known recovery state only. It does not establish KOO r1.4, perform Initiation Gate or Writer Gate, create task/profile/production authority, activate the prepared SHD task, replay historical prompts/tasks/queues, or mutate Project Sources/canons.
