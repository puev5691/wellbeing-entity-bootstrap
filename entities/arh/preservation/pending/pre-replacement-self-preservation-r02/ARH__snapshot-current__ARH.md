# ARH current snapshot — pre-replacement self-preservation r0.2

status: `CURRENT_WRITER_SELF_SNAPSHOT_CANDIDATE`
entity: `ARH / АРХИВАРИУС`
project_time: omitted; trusted project-time source not used

## Snapshot boundary

Fresh `puev5691/wellbeing-hq` boundary used for this snapshot:
`c83bf0e5cb5a38b4ce2d460d3d8d57ab4ff6b727`.

Current canonical ARH recovery remains:
`puev5691/wellbeing-entity-bootstrap@9ffe7190298689bd90f047c249151213e101450e:entities/arh/recovery/current`.

Previous pre-replacement candidate r0.1:
`puev5691/wellbeing-entity-bootstrap@f70b9ed04a98976a9f5e37f69171717fb6d49797:entities/arh/preservation/pending/pre-replacement-self-preservation-r01`.

## Current coordinator / writer boundary

KOO replacement initiation result:
`entities/koordinator/current/KOO__replacement-initiation-v05-result.md`.

Verified state:
- `initiation_verified`;
- `CURRENT_WRITER_ESTABLISHED`;
- writer readback PASS;
- competing writer `NONE_FOUND`.

This KOO instance is the current coordination authority within the existing KOO role.

## KOD boundary

KOD replacement current-writer v0.2 was established at:
`56db550005d6ed6956ba1bf753f3cb24ca295cc3`.

Later KOD work exists after that boundary. A future ARH must obtain fresh state from HQ rather than replay a stored KOD task list.

## Current ARH preservation / initiation preparation

ARH self-preservation r0.1 result:
`entities/archivarius/outbox/ARH__pre-replacement-self-preservation-r01__KOO.md`
commit `a36c6b34a5ff90ba91203cf4fa36b13251d19d21`.

Preparation request to KOO:
`entities/archivarius/outbox/ARH__replacement-initiation-preparation-r01__KOO.md`
commit `fc4320b50958d901673ca818a3bc39db441e94e4`.

Dispatch:
`24f7dd75e4a86b30c57c989eef37372a62844a78`.

KOO inbox locator:
`f833e141a7bca6c426a827e981eabc0ea3159d46`.

Activation record:
`c83bf0e5cb5a38b4ce2d460d3d8d57ab4ff6b727`.

At this snapshot boundary activation is evidence of detection only; it does not prove KOO processing or independent verification.

## New exact ARH task preserved but NOT processed in this preparation

KOO task:
`entities/koordinator/outbox/KOO__RED-emergency-preservation-checkpoint-r01__ARH.md`
commit `999542a004cd1fb4bc6364ee24c6dd8aaee47ca7`.

Inbox addressing:
commit `2f70ce273cf2b8bd4ead7ec5b26b256e5c72fec5`.

This RED preservation task is preserved as pending current-field evidence only. It is not executed by the ARH replacement-preparation cycle and must be revalidated after any future ARH cold-start.

## Recovery / authority invariants

- package presence does not prove initiation;
- initiation does not create writer authority;
- inbox/dispatch/activation does not prove processing;
- receipt does not equal broader acceptance;
- candidate/draft/research does not become canon by presence;
- fresher loose HQ evidence may constrain stale recovery but may not be synthesized into authoritative self-state;
- destructive cleanup/history rewrite is not authorized by preservation;
- exact task and dependency state must be revalidated immediately before processing.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: свежий self-owned snapshot перед возможной плановой заменой ARH
СТАТУС: `current_writer_self_snapshot_candidate`
