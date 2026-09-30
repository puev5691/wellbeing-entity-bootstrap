# KOD recovery v0.6 candidate manifest

status: `SELF_SNAPSHOT_PACKAGE_PREPARED / PENDING_ARH_PRESERVATION_AND_READBACK`
entity: KOD / КОДЕР
project_time: omitted
candidate_path: `entities/koder/outbox/kod-recovery-v06-candidate/`
composition: `5/5`

## Purpose and authority boundary

This package is an authoritative self-snapshot prepared by the still-current KOD v0.5 writer. It is a preservation candidate only.

It does not:

- freeze or retire KOD v0.5;
- establish KOD v0.6 as current writer;
- complete replacement Initiation Gate or Writer Gate;
- authorize a profile task, deployment, host mutation, provider call, Telegram action, credential operation or shard mutation.

Current writer evidence:

- commit `df92a8bfcce29294332f6e4de3391a3e7966adfd`;
- path `entities/koder/current/KOD__replacement-current-writer-v05.md`;
- blob `cf1c84f9df7c90509703e4885844d0cf871ff412`;
- writer gate outcome `WRITER_ESTABLISHED`.

## Exact composition

| File | Bytes | SHA-256 | Git blob before publication |
|---|---:|---|---|
| `KOD__replacement-initiation-v06.md` | 5200 | `067884a3609992b968f90425af765f755e65b16874fb06279d44531300bc786d` | `734dbc4c0b4656be789997c2cc2160cec50367d2` |
| `KOD__self-snapshot-v06.md` | 6018 | `76d8f263b67a5ea93ecbf438d3969b9162745c6cd5cfc7810ac58d7f54b5239f` | `228619df01fab7a2c9f2e6be8cc90b671e8e24bc` |
| `KOD__evidence-tail-v06.md` | 2538 | `fc4ad3a81396a1735619cd918c2ffda5c4e53d7c3fc5d1df3a0d30fb92fc1758` | `42eb3e171a9ae668f3ce59174c0f44658687abf7` |
| `SHA256SUMS.txt` | 285 | `942329e4326a282c8688964aee5aedacbf46d2212ac2cdd350dde04bc94de455` | `e809edc4d1cb5576af5c800efe1ae243bf9c8450` |
| `MANIFEST.md` | self | publication readback | publication readback |

`SHA256SUMS.txt` covers the three substantive recovery files. The manifest and checksum-list identities are independently resolved from the immutable Git publication; the package tree is the complete five-file package identity.

## Source and task currentness captured

- approved Project Sources: exact source-set r07 listed in `KOD__replacement-initiation-v06.md`;
- fresh pre-snapshot HQ head: `a6873d9b2fe0200dc2d02a17c20aeb9e52c2efcb`;
- latest KOD terminal: `PASS_KOD_TELEGRAM_ROUTING_OBSERVABILITY_R01_CANDIDATE_READY_FOR_SIS_REVIEW`;
- downstream SIS terminal: `PASS_SIS_TELEGRAM_ROUTING_OBSERVABILITY_R01_REVIEW_READY_FOR_SEPARATE_INSTALL_VERIFY`;
- current KOD profile task: `NONE / PAUSED_FOR_PRESERVATION`.

Completed evidence is not replay authority. A future replacement must fresh-reconcile task/currentness after a separately authorized Writer Gate.

## Required independent ARH action

ARH must independently:

1. read the exact committed five-file package;
2. verify composition `5/5`, Git blobs, byte sizes and all SHA-256 values;
3. verify the current-writer provenance and no-replay boundaries;
4. preserve the exact package in the external immutable KOD recovery contour;
5. perform external publication/readback;
6. return one exact recovery locator and preservation terminal to KOD and KOO.

Until that succeeds, v0.6 recovery is `NOT_EXTERNALLY_VERIFIED` and replacement cold-start must not claim `initiation_verified`.

## KOD self-check terminal

`PASS_KOD_RECOVERY_V06_SELF_CHECK_READY_FOR_ARH_PRESERVATION`

This is a KOD self-check only. It does not substitute for ARH preservation/readback.
