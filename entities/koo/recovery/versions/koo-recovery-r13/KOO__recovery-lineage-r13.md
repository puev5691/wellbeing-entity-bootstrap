# KOO recovery lineage r1.3

status: RECOVERY_SUCCESSOR_LINEAGE
project_time: omitted

## Recovery chain

BASE r09:
puev5691/wellbeing-entity-bootstrap@ab4c7ad12db9760fe825d2a93b6467499e1a09f4:
entities/koo/recovery/versions/koo-recovery-r09

DELTA r10:
puev5691/wellbeing-entity-bootstrap@e07047dfce0684638e2164d1712dee06ac313cfc:
entities/koo/recovery/versions/koo-recovery-r10

SUCCESSOR r11:
puev5691/wellbeing-entity-bootstrap@f478b936e4cba58c8a81490463541b6ecd76a4c1:
entities/koo/recovery/versions/koo-recovery-r11

EMERGENCY SUCCESSOR r12:
puev5691/wellbeing-entity-bootstrap@122fcd2172781cc87e2cc15afc46f715193f63db:
entities/koo/recovery/versions/koo-recovery-r12

NEW SUCCESSOR r13:
entities/koo/recovery/versions/koo-recovery-r13

## Exact current-state provenance

Authoritative writer at snapshot:
entities/koordinator/current/KOO__replacement-current-writer-r12.md

expected blob:
b68e1dd2e79781f4ea8fab7e48e7456fada14c80

Exact source snapshot:
puev5691/wellbeing-hq@0178dde20cca04fc1d8d5147d9c32addac87b616:
entities/koordinator/outbox/koo-emergency-preparation-r13/KOO__emergency-preparation-self-snapshot-r13.md

expected blob:
bf8144c5bd9365f9096c03ea92deee8ea37a8d8b

terminal:
PASS_KOO_R12_SELF_SNAPSHOT_R13_READY_FOR_ARH_PRESERVATION

Exact global pause:
puev5691/wellbeing-hq@d15850fee62634a507d3e4473d19e8cfd43b6e31:
entities/koordinator/current/KOO__global-pause-emergency-initiation-preparation-r13.md

expected blob:
10522b06a9f3a58298823a2a251df1b9859e8aad

status:
GLOBAL_PROFILE_TASK_PAUSE_ACTIVE

## Recovery semantics

r12 is the external recovery base for this successor.
r13 preserves fresher authoritative self-snapshot evidence and the controlling global pause.

The global pause remains controlling after replacement until the OPERATOR explicitly changes it.

No paused profile task becomes current task authority by appearing in recovery.

Historical PROMPT/task/queue replay remains forbidden.

After a later successful Writer Gate, fresh reconciliation is required before any task selection.

## Mandatory interface lineage

KOO__human-interface-contract-r02.md is preserved unchanged from r12.

expected blob:
fdea31034c370220dfb961993059500716ccfe20

H1-H8 remain mandatory during future replacement Initiation Gate.

## Authority boundary

This recovery package:
- does not freeze or retire KOO r1.2;
- does not initiate a replacement;
- does not establish a writer;
- does not perform Writer Gate;
- does not resume SECE/KOD/SHD/SIS;
- does not mutate Project Sources/canons;
- does not activate the prepared cold-start PROMPT.
