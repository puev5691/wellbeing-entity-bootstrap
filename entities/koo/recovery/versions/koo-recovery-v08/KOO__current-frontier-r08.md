# KOO current causal frontier r0.8

status: BOUNDED_REPOSITORY_EVIDENCE_INDEX
project_time: omitted

This file is not a reconstructed chat snapshot. It records only fresh repository evidence required for replacement cold-start.

## KOO authority

Current authoritative KOO writer:
entities/koordinator/current/KOO__replacement-current-writer-v06.md
blob 90edff69b20879231fda8b882cbb172173e456f0.

No later KOO writer was found in fresh current reconciliation.

## Fast Memory / memory-layering

Current terminal:
FAIL_SIS_MEMORY_LAYERING_E2E_R01_MAIN_ATTEMPT_2_EXECUTION
artifact copied exactly in this recovery.

Attempt 2 state:
- durable claim created;
- attempt 2 authority consumed;
- failure stage POST_CLAIM_PRE_OLD_EXECUTION;
- OLD-01 execution=0;
- NEW-01 execution=0;
- semantic reads=0;
- provider calls=0;
- automatic retry=0;
- attempt 3 NOT_AUTHORIZED.

Cause:
structural verifier import created package/__pycache__/verifier.cpython-312.pyc after claim, changing immutable package composition. Structural gate returned BLOCKED_INTEGRITY.

Cleanup evidence in terminal:
__pycache__ removed; preparation SHA256SUMS PASS; python3 -B structural verifier PASS; runtime roots empty; worker code removed; broker socket absent; no standing broker/worker.

Boundary:
future correction may use no-bytecode/read-only verifier execution, but this recovery creates no authority for attempt 3.

Predecessor evidence retained by repository and must be fresh-reconciled:
- broker correction verification/readmission lineage;
- historical attempt 1 consumed;
- current SIS r0.6 writer lineage.

## Queue/materialization warning

entities/koordinator/current/KOO__active-queue-r110.md exists but is stale relative to this frontier: it describes the earlier KOO v0.7 preservation cycle and an older memory-layering state. It MUST NOT be replayed as current queue authority.

Replacement must rebuild/classify queue from fresh current/inbox/outbox/routes/receipts.

## Other current project gates

Fresh repository evidence near this preservation boundary includes:
- Project Instructions v3 review/correction/K5 handoff chain;
- human-interface/literary-journal work in KAN/RED/SHT lineage;
- Booster utility lineage with later SIS/KOD verification results;
- Telegram lineage requiring fresh terminal classification;
- Entity recovery/writer boundaries.

These are pointers for fresh reconciliation, not synthetic classifications. If exact current/completed/blocked/superseded/waiting_operator status cannot be established from immutable evidence, replacement must preserve UNKNOWN and stop rather than infer from chronology.
