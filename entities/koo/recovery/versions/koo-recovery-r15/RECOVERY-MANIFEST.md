# KOO external recovery r15 manifest

status:
EXTERNAL_RECOVERY_SUCCESSOR

entity:
KOO / КООРДИНАТОР

target_repository:
puev5691/wellbeing-entity-bootstrap

target_path:
entities/koo/recovery/versions/koo-recovery-r15

project_time:
omitted

## Exact required composition

Exactly 9 files:

1. KOO__planned-chat-replacement-self-snapshot-r14.md
2. KOO__replacement-current-writer-r13.md
3. KOO__human-interface-contract-r02.md
4. SOURCES.md
5. TASK-STATE.md
6. KOO__recovery-initiation-boundary-r15.md
7. RECOVERY-LINEAGE.md
8. RECOVERY-MANIFEST.md
9. SHA256SUMS.txt

## Exact copied source identities and independently computed SHA-256

KOO self-snapshot:
source Git blob 8a39b17be502cfa4f356e69fb6f6374fdc2b5029
package Git blob 8a39b17be502cfa4f356e69fb6f6374fdc2b5029
SHA-256 64cc214effe0bc23cab9e60a20a251b89b441d3285d565659970ad0add840ef7

KOO current-writer:
source Git blob 5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1
package Git blob 5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1
SHA-256 5353ce3b90cbbe68ea34d715467965651d80dc9cea582265e292b5dd43754deb

Human Interface Contract:
source Git blob fdea31034c370220dfb961993059500716ccfe20
package Git blob fdea31034c370220dfb961993059500716ccfe20
SHA-256 b8f9cfa56636127ed013bda7a67c2b0bb77f75099ac081c13f5b06f8a2aa0175

All three copied package Git blobs equal their exact source Git blobs.

## ARH-owned recovery metadata SHA-256

SOURCES.md:
0aee0c78556965be5ab84b5641cc9213f84e2c9d4701266988b3a5715df5dc43

TASK-STATE.md:
322bf49bbd1974ff44cd77763a7fa0f367e07fef4109462528a61c5f38d823a8

KOO__recovery-initiation-boundary-r15.md:
06ad7d79ad025fce42cd1b5010f3626f87b8c4c0b465bf41ed89e10237e3131c

RECOVERY-LINEAGE.md:
e486714f009d6c1d263369d8312a92ea602b70114506d8d8ce24fd6414cfe359

RECOVERY-MANIFEST.md:
Its SHA-256 is recorded in SHA256SUMS.txt.

SHA256SUMS.txt:
Covers all 8 non-checksum files including this manifest. The checksum file itself is excluded from its own coverage.

## Integrity rules

- exact composition 9/9;
- copied source Git blob identity 3/3;
- independently recomputed SHA-256 8/8;
- immutable external readback required;
- exact source/current-writer equality required;
- manifest-to-tree correspondence required;
- no unexplained missing or extra files;
- mismatch is BLOCKED/FAIL, never silently repaired;
- failed r14 remains immutable and is not overwritten.

## Authority boundary

This package preserves known KOO recovery state only. It does not establish KOO r1.4, perform Initiation Gate or Writer Gate, create task/profile/production authority, activate the prepared SHD task, replay historical prompts/tasks/queues, mutate KOO authoritative current-state, or change Project Sources/canons.
