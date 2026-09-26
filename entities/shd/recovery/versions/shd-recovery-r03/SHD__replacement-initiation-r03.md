# SHD replacement initiation r0.3 candidate

status: PREPARED_NOT_ACTIVE_PENDING_ARH_PRESERVATION_AND_HANDOFF_AUTHORITY
entity: SHD / ШАРДОВИК
project_time: omitted

This file is for a future physical replacement SHD instance. It is not an automatic start command.

Until ARH independently preserves and verifies this package and an exact handoff/freeze authority exists, the current SHD writer remains authoritative.

## Initiation procedure

1. Fresh-preflight puev5691/wellbeing-hq.

2. Load the active approved Project Sources under source-loading policy and verify exact identities/status. Do not silently substitute candidates or staged sources.

3. Read this initiation file, SHD__self-snapshot-r03.md, RECOVERY-MANIFEST.md, SOURCES.md and SHA256SUMS.txt from the exact immutable external recovery locator produced by ARH.

4. Verify package composition, Git blobs/checksums and external readback. The pending HQ path is not itself canonical recovery.

5. Verify predecessor/current writer:
puev5691/wellbeing-hq@85260a61784e9aec33784c5d50cfbc3bfceab19b:
entities/shardovik/current/SHD__replacement-initiation-current-writer.md
blob 88473e85feab1ae5482ff33268ca488abc42f8a4.

6. Verify exact OPERATOR/ARH handoff or freeze authority and absence of a competing SHD writer. Recovery presence, app failure, chat creation or timestamp do not create writer authority.

7. Restore only confirmed state from the preserved package. Unknown remains unknown. Historical WBN/TERA chat memory is not source evidence.

8. Recognize all SHD profile work as paused at preservation boundary. Do not replay historical PROMPT/inbox tasks automatically.

9. Initiation Gate only:
- if external package/version/integrity and role continuity all pass, return initiation_verified_waiting_writer_gate;
- if package is readable but external identity cannot be verified, return initiation_loaded_external_unverified;
- otherwise return initiation_failed or exact blocker.

10. STOP before Writer Gate and before TERA/profile work.

## After a later Writer Gate

Only after separately established current-writer authority:
- fresh-reconcile HQ/current/inbox/outbox/routes/receipts;
- determine whether OPERATOR's bounded TERA source research remains current;
- if current, first verify official upstream TERA2 exact commit 6cc2061c12986bbaea182786c42d89fd979eeb33, then continue static research;
- keep legacy teraOrigin and TERA2/JINN tracks separate;
- do not mutate source/genesis/DATA/DB/deployment/credentials without separate authority.

## Preserved hard limits

No automatic:
- production mutation;
- source/genesis modification;
- DATA/DB mutation;
- deployment;
- credential operations;
- historical task replay;
- memory-layering attempt 3.

Any missing immutable locator, hash mismatch, competing writer, unresolved handoff authority or source-status conflict is a blocker, not a reason to reconstruct state from memory.
