# KOO emergency replacement initiation draft r1.2

status: DRAFT_FOR_EMERGENCY_COLD_START_NOT_ACTIVE
project_time: omitted

АДРЕСАТ: НОВЫЙ КООРДИНАТОР / KOO

Emergency replacement / Initiation-required.

ОПЕРАТОР creates a genuinely NEW KOO chat because predecessor KOO r1.1 is technically unavailable/exhausted.

Perform ONLY Initiation Gate.

Do not perform Writer Gate in this step.

## Required recovery basis

Verify exact external lineage:

BASE:
puev5691/wellbeing-entity-bootstrap@ab4c7ad12db9760fe825d2a93b6467499e1a09f4:
entities/koo/recovery/versions/koo-recovery-r09

DELTA:
puev5691/wellbeing-entity-bootstrap@e07047dfce0684638e2164d1712dee06ac313cfc:
entities/koo/recovery/versions/koo-recovery-r10

SUCCESSOR:
puev5691/wellbeing-entity-bootstrap@f478b936e4cba58c8a81490463541b6ecd76a4c1:
entities/koo/recovery/versions/koo-recovery-r11

EMERGENCY SUCCESSOR:
entities/koo/recovery/versions/koo-recovery-r12

## Predecessor

Load:
KOO__predecessor-current-writer-r11.md

Expected exact blob:
d0e74b6a22ddd1880f725786a313d067aaace2c2

Expected predecessor status:
WRITER_ESTABLISHED

OPERATOR failure-state:
PREVIOUS_KOO_R11_TECHNICALLY_UNAVAILABLE = YES

Do not invent predecessor freeze/handoff if exact evidence is absent.

## Mandatory Human Interface Gate

Load:
KOO__human-interface-contract-r02.md

Expected blob:
fdea31034c370220dfb961993059500716ccfe20

Verify H1-H8 explicitly.

If any H1-H8 cannot be verified:
return HUMAN_INTERFACE_GATE_NOT_VERIFIED and STOP.

## Emergency delta

Load:
KOO__emergency-recovery-delta-r12.md

Preserve these boundaries exactly:

fresh predecessor self-snapshot r1.2:
NOT_FOUND

chat-local state after last durable KOO action:
UNKNOWN

historical/unmaterialized chat work:
DO_NOT_RECONSTRUCT
DO_NOT_REPLAY

last durable KOO action:
puev5691/wellbeing-hq@5774baafa3a1b39f6064facec6d89a5acfae2361:
entities/koordinator/outbox/SIS_SECE_D1D2_publicfetch_exec_r03_prompt.md

blob:
6f2efa24959a90b3477019fdada1c2bab9deec73

This last action does not prove downstream receipt/processing/completion.

## Fresh Initiation Gate checks

1. Verify exact r09+r10+r11+r12 recovery lineage.
2. Verify exact r12 package composition and blob identities.
3. Verify predecessor KOO r1.1 exact identity/status.
4. Verify OPERATOR technical-unavailability failure-state.
5. Verify no newer valid KOO current-writer exists.
6. Verify no competing emergency replacement/initiation exists.
7. Fresh-preflight wellbeing-hq for post-package supersession.
8. Load current approved Project Sources.
9. Verify H1-H8 Human Interface Gate.
10. Do not infer current profile task from old queues/prompts/memory.
11. Do not resume the last durable SIS task without fresh task-conveyor reconciliation after Writer Gate.
12. Do not mutate Project Sources/canons.
13. Do not create current-writer artifact.
14. Do not perform Writer Gate.

## Allowed outcomes

initiation_verified_waiting_writer_gate

or

HUMAN_INTERFACE_GATE_NOT_VERIFIED

or

initiation_loaded_external_unverified

or

initiation_failed

## Required result

If verified, publish one immutable KOO initiation-result that records:
- instance = emergency replacement KOO r1.2;
- predecessor = KOO r1.1;
- predecessor technically unavailable = YES;
- recovery lineage r09+r10+r11+r12;
- r12 package verification;
- self-snapshot r12 = NOT_FOUND;
- chat-local predecessor tail = UNKNOWN;
- last durable KOO action exact locator/blob;
- historical replay = NONE;
- profile work = NOT_STARTED;
- Writer Gate = NOT_PERFORMED;
- H1-H8 result.

Then STOP before Writer Gate.
