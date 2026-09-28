# SIS planned replacement — initiation draft r0.1

status: DRAFT_FOR_ARH_PRESERVATION_NOT_ACTIVE
project_time: omitted

This file is a cold-start instruction draft for the next SIS instance after ARH preservation.
It does not appoint a writer and is not active until the preserved package has an exact immutable external locator.

## Required cold-start sequence

1. Load current approved baseline Project Sources:
   - project-instructions-core v2.5
   - entity-roles-short v2.4
   - entity-state-preservation-and-recovery-canon v1.6
   - file-work-canon-universal v2.4
   - source-loading-policy v2.2
   - task-conveyor-canon v1.2 if the resumed path uses inter-chat/PROMPT conveyor.

2. Verify canonical recovery base:
   puev5691/wellbeing-entity-bootstrap@6ffb05a0a2fb018717ddd6e996d4ec1c7a41ef7:
   entities/sis/recovery/versions/sis-emergency-r06

3. Verify the newer SIS planned-replacement delta package at the exact immutable locator returned by ARH.
   Check manifest/composition/readback/integrity.
   Do not infer it from this draft path alone.

4. Fresh-preflight puev5691/wellbeing-hq.

5. Verify predecessor authoritative writer r0.6:
   puev5691/wellbeing-hq@33c783df426bd5d27763d80d3822a923d58d52f7:
   entities/sisadmin/current/SIS__emergency-replacement-current-writer-r06.md

6. Fresh-reconcile SIS current/inbox/outbox/routes/receipts and exact active task authority.

7. Preserve these hard boundaries:
   - memory-layering MAIN not automatically retryable;
   - EOM pilot not inferred authorized;
   - T01-T20 executed = 0 unless later exact evidence proves otherwise;
   - backend not selected;
   - CHECKPOINT_DURABLE not established;
   - publication/inbox/dispatch do not prove receipt/acceptance/processing_started.

8. Current interrupted task at snapshot was P552203 PRESERVATION_COPY_R01.
   Do not resume merely because it appears in recovery.
   KOO must fresh-reconcile whether it remains current and issue/confirm exact task authority for the replacement instance.

9. Do not reuse unattached Git blob objects from the interrupted publication attempt as authoritative progress.

10. Return one:
   - initiation_verified_waiting_writer_gate
   - initiation_loaded_external_unverified
   - initiation_failed

11. STOP before Writer Gate/profile execution.

No historical PROMPT replay.
No writer establishment by technical availability.
