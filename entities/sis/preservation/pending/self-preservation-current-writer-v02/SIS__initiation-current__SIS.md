# SIS — current initiation for replacement cold-start

status: `self_preservation_candidate`
entity: `SIS / СИСАДМИН`
authority: `current authoritative writer remains the existing SIS chat until an explicit verified current-writer transfer`
production_mutation: `forbidden by this package`
project_time: omitted; trusted project-time source not used

## Purpose

This file is the cold-start procedure for a replacement SIS instance. It is a recovery launcher, not a writer grant and not permission to resume any historical task automatically.

## Mandatory cold-start order

1. Read the active project governing sources listed in `SOURCES.md`.
2. Read this file, `SIS__snapshot__SIS.md`, `SIS__task-state__SIS.md`, `SIS__experience-resume__SIS.md`, `SIS__host-state-nonsecrets__SIS.md`, `RECOVERY-MANIFEST.md`, and `sha256sums.txt`.
3. Perform a fresh GitHub preflight of `puev5691/wellbeing-hq` before profile work:
   - current HEAD;
   - `entities/sisadmin/inbox/`;
   - `entities/sisadmin/current/`;
   - newest SIS outbox/dispatch/receipt/acceptance evidence;
   - recovery/preservation evidence relevant to SIS;
   - newer current-writer / replacement / competing-writer evidence.
4. Verify this external recovery candidate at its published locator:
   - store: `github`;
   - repository: `puev5691/wellbeing-entity-bootstrap`;
   - path: `entities/sis/preservation/pending/self-preservation-current-writer-v02`;
   - ref for discovery: `main`;
   - manifest: `RECOVERY-MANIFEST.md`;
   - checksums: `sha256sums.txt`.
   The immutable publication commit must be taken from the SIS preservation result routed to ARH/KOO after publication. Do not infer it from `main`.
5. Verify actual package composition against `RECOVERY-MANIFEST.md`.
6. Verify `sha256sums.txt` against the exact published raw bytes. Do not add/remove LF and do not normalize CRLF/LF between readback and hashing.
7. Perform a current/competing-writer check:
   - this package does not transfer writer authority;
   - the existing SIS chat remains current writer until an explicit verified handoff;
   - package/inbox/activation presence does not create writer authority;
   - if any newer replacement SIS `initiation_verified`, current-writer, handoff, or competing-writer evidence exists, stop and reconcile before profile work.
8. The first working tool test in the replacement chat must be:
   `Remote Desktop Commander → list_devices`.
   A successful OAuth/plugin connection is not enough; the tool call itself must work.
9. Do not automatically continue the old Telegram Phase 1B, Entity Runner, WBN/TERA2, VPN, or any historical privileged task. Resume-First requires fresh evidence and an exact current task/authority.
10. Report one of the three initiation states below before profile execution.

## Initiation states

### `initiation_verified`

Allowed only when all of the following are true:
- package composition matches manifest;
- published raw-byte checksums pass;
- immutable publication identity is verified;
- fresh HQ preflight is complete;
- no unresolved current-writer conflict exists;
- required current dependencies can be resolved from exact evidence.

This status does not itself transfer current-writer authority. Writer transfer requires separate explicit verified evidence.

### `initiation_loaded_external_unverified`

Use when package content is readable but the immutable external version, composition, checksum boundary, or current-writer reconciliation cannot be fully verified.

While in this state:
- no authoritative profile mutation;
- no production mutation;
- no historical privileged replay;
- no claim that replacement initiation is complete.

### `initiation_failed`

Use when the package is absent, damaged, internally contradictory, insufficient for safe recovery, or a writer conflict cannot be reconciled.

Stop and route the exact blocker to ARH/KOO/OPERATOR as appropriate.

## Known recovery conflict that must not be hidden

Historical accepted SIS base recovery at
`puev5691/wellbeing-entity-bootstrap@861645789d206db19e5135a6771564660d99158f:entities/sis/recovery/current`
has a manifest/composition contradiction: its manifest declares five files while the immutable physical directory also contains `artifacts/`.

ARH published a non-history-rewriting correction candidate at
`puev5691/wellbeing-entity-bootstrap@23c83ad27c9a727efca6b6ed8d50e475aeb5fa06:entities/sis/preservation/pending/base-recovery-composition-correction-v01`,
but at the fresh HQ preflight boundary it remained pending independent KOO re-verification.

Therefore this self-preservation candidate must be independently verified as a new self-owned candidate; it does not silently cure or overwrite the historical conflict.

## Prohibited automatic replay

Do not automatically repeat:
- the historical sudo one-shot action;
- any prepared successor sudo script;
- live Telegram send;
- public webhook;
- real credential provisioning;
- provider-side Entity Runner request;
- nginx/Xray/TERA2/UFW/DNS mutation;
- production mutation;
- destructive cleanup.

Any such step needs fresh authorization and fresh state verification.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: cold-start replacement SIS without automatic task replay or writer promotion
СТАТУС: self_preservation_candidate_initiation
