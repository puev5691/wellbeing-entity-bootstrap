# KOO planned replacement initiation draft r1.1

status: DRAFT_FOR_EXTERNAL_PRESERVATION_NOT_ACTIVE
project_time: omitted

This is the cold-start initiation draft for a genuinely NEW KOO application chat.

It is preserved recovery material only.
It does not initiate a chat, freeze the current KOO r1.0 writer, establish a new writer, create task authority, or authorize profile work.

## Recovery lineage

BASE:
puev5691/wellbeing-entity-bootstrap@ab4c7ad12db9760fe825d2a93b6467499e1a09f4:
entities/koo/recovery/versions/koo-recovery-r09

DELTA:
puev5691/wellbeing-entity-bootstrap@e07047dfce0684638e2164d1712dee06ac313cfc:
entities/koo/recovery/versions/koo-recovery-r10

SUCCESSOR:
entities/koo/recovery/versions/koo-recovery-r11

The r1.1 successor supplements, and does not rewrite, the preserved r09+r10 lineage.

## Mandatory cold-start sequence

1. Load current approved common Project Sources.
2. Verify BASE r09, DELTA r10 and this exact r11 successor.
3. Verify exact r11 package composition and immutable identities.
4. Verify predecessor current writer KOO r1.0:
   entities/koordinator/current/KOO__replacement-current-writer-r10.md
   blob 8416e945418a4a86764edafbbd06682f6c84682b
   status WRITER_ESTABLISHED.
5. Verify the browser-transition correction:
   KOO__browser-transition-r11-initiation-correction.md.
   The historical browser-transition initiation artifact has NO initiation/writer/task/profile effect for the new replacement chat.
6. Load KOO__human-interface-contract-r02.md and explicitly pass H1-H8.
7. Load KOO__planned-replacement-self-snapshot-r11.md as authoritative predecessor self-snapshot evidence.
8. Fresh-preflight wellbeing-hq and reconcile newer events after snapshot publication.
9. Do not replay historical queues, tasks or prompts.
10. Return exactly one initiation outcome:
   - initiation_verified_waiting_writer_gate
   - HUMAN_INTERFACE_GATE_NOT_VERIFIED
   - initiation_loaded_external_unverified
   - initiation_failed
11. STOP before Writer Gate.

## Human Interface Gate

H1-H8 from KOO__human-interface-contract-r02.md are mandatory.

Technical recovery without a verified human interface is not a successful KOO cold start.

## Current durable frontier captured by r11 snapshot

- current predecessor writer: KOO r1.0;
- KOD v0.7 current writer established;
- KOD profile state: WAITING_EXACT_TASK;
- predecessor KOD chat-only unknown work:
  UNKNOWN / NOT_MATERIALIZED / DO_NOT_RECONSTRUCT / DO_NOT_REPLAY;
- SHT continuity candidate:
  PASS_SHT_CHAT_INFOFIELD_MATERIALIZATION_GAP_R01_CANDIDATE_READY_FOR_REVIEW;
- DURABLE_EXECUTION_STATE_R01:
  candidate only, NOT_ACTIVE;
- suggested KAN review:
  NOT_AUTO_AUTHORIZED.

## Authority boundary

No historical prompt replay.
No profile work during Initiation Gate.
No Writer Gate in the same step.
No Project Source/canon mutation.
No foreign current-state mutation.
No automation or production action is authorized by this recovery package.
