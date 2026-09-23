# SIS emergency current evidence index r0.6

status: BOUNDED_REPOSITORY_EVIDENCE_INDEX
project_time: omitted

This index preserves only fresh repository evidence. It is not a synthetic self-snapshot.

## Writer

CURRENT_WRITER_R05_ESTABLISHED
writer blob 3a2ecb35e54aad11ae6611a820b7f2dad01ceffc
establishment 489cc912c7907d7ed0ec9b504843a0947f46fab0.

Older r0.2/v0.1 writer files remain historical predecessor evidence, not competing current authority.

## Memory-layering current lineage

Runtime admission:
PASS_SIS_MEMORY_LAYERING_E2E_R01_P552203_RUNTIME_ADMISSION
commit 737805abd3ccbe288089255fde1ab9e62c1816cd
artifact copied exactly in this recovery.

Authority identifiers preserved by terminal evidence:
AUTHORIZE_MEMORY_LAYERING_E2E_R01_MAIN_SYNTHETIC_EXECUTION
AUTHORIZE_MEMORY_LAYERING_E2E_R01_MAIN_ON_ADMITTED_P552203

Latest terminal:
BLOCKED_SIS_MEMORY_LAYERING_E2E_R01_MAIN_PRECLAIM_BROKER_BUDGET_MISMATCH
commit 374091a6fa662d418f94c392f3e6a52d04d86672
artifact copied exactly in this recovery.

Critical state:
main_attempts_started=0
main_authority_consumed=false
MAIN claim=absent
automatic retries=0
broker admitted sentinel_request_budget=4
required MAIN semantic reads=7
max_reads=32
max_bytes=262144
required semantic bytes=3531

The blocker is pre-claim lifecycle/event-budget incompatibility. MAIN did not start. No automatic retry is authorized.

## Other repository evidence

Fresh repository history contains additional SIS technical terminals (including Booster utility/checker/failure-metadata lineage and prior Telegram/recovery lineage). They are not reconstructed into current chat-local state here. Replacement must fresh-reconcile SIS current/inbox/outbox/routes/receipts and classify them by exact current authority/status.

Historical PROMPT files are evidence only and must not be replayed.
