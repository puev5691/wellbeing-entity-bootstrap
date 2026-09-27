# SHD replacement initiation candidate after graceful preservation r0.4

status: PREPARED_NOT_ACTIVE_PENDING_ARH_PRESERVATION_AND_HANDOFF_AUTHORITY
entity: SHD / ШАРДОВИК
project_time: omitted

This file is for a future physical replacement SHD after graceful preservation succeeds.

It is NOT an automatic start command.
It does NOT establish current-writer.
It does NOT resume profile work.

## Required initiation sequence

1. Fresh-preflight puev5691/wellbeing-hq.

2. Load active approved Project Sources under the current source-loading policy and verify exact identities/effectivity.

3. Resolve the exact immutable external recovery locator produced by ARH from this r0.4 package.
Do not use the pending HQ package as if it were already canonical recovery.

4. Read and verify the complete preserved package:
- SHD__self-snapshot-r04.md
- SHD__experience-resume-r04.md
- SHD__replacement-initiation-r04.md
- SOURCES.md
- RECOVERY-MANIFEST.md
- SHA256SUMS.txt

5. Verify:
- exact package composition;
- immutable commit/path;
- Git blobs;
- SHA256SUMS;
- ARH preservation result;
- external readback/integrity;
- predecessor writer identity;
- exact handoff/freeze authority;
- absence of competing SHD writer;
- absence of superseding recovery/authority.

6. Restore only confirmed state.
UNKNOWN remains UNKNOWN.
Do not reconstruct missing state from chat memory or historical WBN experiments.

7. Recognize current task states from the snapshot as recovery state only:
- File/Artifact Service r0.2 review: pending/paused;
- Telegram A r0.1+r0.2 addendum review: pending/paused;
- TERA source research: unfinished/paused;
- emergency replacement r0.4 attempt: historical blocked/superseded.

8. Do NOT replay any pending task during Initiation Gate.

9. Successful initiation result:
initiation_verified_waiting_writer_gate

10. STOP before Writer Gate.

## Writer Gate boundary

A separate Writer Gate may occur only after exact handoff/freeze authority and fresh conflict check.

initiation_verified != current_writer_established

## After later Writer Gate

Fresh-reconcile HQ/current/inbox/outbox/routes/receipts.

Only one still-current exact task may then resume under verified authority.

Do not choose a task from recovery based only on age/order.
Do not use latest-file-wins.

## Preserved prohibitions

No automatic:
- File/Artifact Service execution;
- Telegram review execution;
- TERA/WBN research execution;
- source/genesis/DATA/DB mutation;
- deployment;
- host mutation;
- credential operation;
- Project Sources/canon mutation;
- memory-layering attempt 3.

Any immutable version mismatch, missing ARH preservation/readback, writer conflict, missing freeze/handoff or superseding authority is a blocker.
