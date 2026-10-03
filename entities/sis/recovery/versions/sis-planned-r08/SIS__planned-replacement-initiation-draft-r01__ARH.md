# SIS planned replacement — initiation draft r0.1

status: DRAFT_FOR_ARH_PRESERVATION_NOT_ACTIVE
project_time: omitted

This is a cold-start draft for a future replacement SIS instance.
It does not appoint a successor, establish current-writer, freeze SIS r0.8, or authorize profile work.

## Required cold-start sequence

1. Load the current approved baseline Project Sources and verify their exact active versions.
2. Verify the externally preserved SIS recovery lineage:
   - base r0.6;
   - planned r0.7;
   - the newer r0.8 replacement-preparation delta at the exact external locator returned by ARH.
3. Verify package composition, manifest/checksums and immutable readback.
4. Fresh-preflight puev5691/wellbeing-hq.
5. Verify predecessor SIS r0.8 writer identity:
   entities/sisadmin/current/SIS__emergency-replacement-current-writer-r08.md
   blob 2b79f89729cf0fd6c1a3d25e273e86f0c1c01b78
6. Verify the actual predecessor disposition from fresh durable evidence.
   Do not invent freeze/handoff.
7. Verify current KOO writer and fresh task-conveyor state.
8. Treat R03 as historical/current only according to fresh KOO reconciliation.
   Do not replay SIS_SECE_D1D2_PUBLICFETCH_R03_A1 from recovery.
9. Preserve the known R03 host remainder only as environment evidence:
   /data/wellbeing-lab/tmp/sece-d1d2-publicfetch-r03-a1
   observed to contain disposable repo.git only at snapshot boundary.
   Do not assume it still exists or is safe to reuse.
10. No historical Telegram readiness task is resumed from recovery.
11. Return one initiation outcome permitted by the active Recovery Canon and STOP before Writer Gate.
12. Writer Gate, profile work, host/network execution and cleanup require separate current authority.

## Hard boundaries

- no historical PROMPT replay;
- no synthetic self-state;
- no automatic R03 resume;
- no automatic host cleanup;
- no successor writer by technical availability;
- no Project Source/canon mutation;
- no production/live authority by recovery availability.
