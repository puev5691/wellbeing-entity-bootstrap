# SIS self-preservation recovery manifest v03

status: `candidate_not_canonical`
entity: `SIS / СИСАДМИН`
source_writer_blob: `6590555d95275d18f4eee4478dad0f80ec9b260f`
writer_transfer: `not_performed`
replacement_initiation: `not_declared`
project_time: omitted; trusted project-time source not used

## External publication target

store: `github`
repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/sis/preservation/pending/self-preservation-current-writer-v03`
discovery_ref: `main`

The immutable publication commit is recorded in the separately routed SIS preservation result after all eight files are published. It is intentionally not embedded self-referentially here.

## Exact package composition

Exactly 8 files, no undeclared entries:

1. `SIS__initiation-current__SIS.md`
2. `SIS__snapshot__SIS.md`
3. `SIS__task-state__SIS.md`
4. `SIS__experience-resume__SIS.md`
5. `SIS__host-state-nonsecrets__SIS.md`
6. `SOURCES.md`
7. `RECOVERY-MANIFEST.md`
8. `sha256sums.txt`

`sha256sums.txt` hashes the seven substantive files and does not hash itself.

## Integrity procedure

1. Finalize seven substantive files.
2. Publish them.
3. Read the exact seven published bytes at a pinned Git commit.
4. Compute SHA-256 from those bytes.
5. Publish `sha256sums.txt`.
6. Obtain final immutable publication commit.
7. Read back the final directory at that commit and verify exactly eight entries.
8. Read back the seven substantive files at that commit.
9. Verify all SHA-256 values.
10. Route the immutable locator/result to ARH and KOO.

## Current-writer boundary

This candidate does not transfer writer authority.

At package creation the authoritative SIS writer is:
`entities/sisadmin/current/SIS__replacement-current-writer-v01.md`
blob `6590555d95275d18f4eee4478dad0f80ec9b260f`.

The existing chat remains current-writer until a separate explicit verified handoff/freeze decision and replacement initiation.

## Active dependency caution

The OpenAI cost matrix is blocked in SIS state while a newer KOD Astra clean package is `READY_FOR_REVERIFY`. That dependency must be fresh-reconciled after replacement. No provider calls are authorized by this package.

## Secret boundary

This package contains no passwords, access tokens, API keys, private keys, usable VPN/Telegram access URI/QR, Telegram bot token, webhook secret, OpenAI key, or credential-file contents.

## Allowed next step after SIS self-verification

Route the immutable candidate result to:
- ARH for preservation-check, external recovery accounting and recoverability review;
- KOO for checkpoint/writer-handoff coordination.

Then stop profile execution unless a separate exact instruction is issued.

Do not declare canonical recovery, replacement `initiation_verified`, or writer transfer from this package alone.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: exact v03 recovery composition and verification boundary
СТАТУС: `candidate_not_canonical_v03`
