# ARH replacement current-writer r0.1

status: `CURRENT_WRITER_ESTABLISHMENT_CANDIDATE`
entity: `ARH / АРХИВАРИУС`
initiation_status: `initiation_verified`
replacement_instance: `this ARH cold-start instance`
old_writer_state: `frozen_for_new_authoritative_profile_mutations`
canonical_recovery_change: `no`
historical_task_replay: `none`
project_time: omitted; trusted project-time source not used

## Verified initiation basis

Canonical predecessor:
`puev5691/wellbeing-entity-bootstrap@9ffe7190298689bd90f047c249151213e101450e:entities/arh/recovery/current`

Verified fresher overlay:
`puev5691/wellbeing-entity-bootstrap@5172d37f9a3560cd177b4fa39e2ead24bc5b458d:entities/arh/preservation/pending/pre-replacement-self-preservation-r02`

Overlay commit tree:
`acf8c2b583ef7d06319a68be21351adec5148544`

Independent KOO verification:
`puev5691/wellbeing-hq@d89e101a4c7fef7d689bb48ddc6569ef656d64ba:entities/koordinator/outbox/KOO__ARH-replacement-cold-start-verification-r02__ARH.md`
verdict: `PASS_ARH_REPLACEMENT_COLD_START_PREPARED`

Snapshot boundary reconciled from:
`puev5691/wellbeing-hq@c83bf0e5cb5a38b4ce2d460d3d8d57ab4ff6b727`

Fresh pre-publication HQ HEAD:
`dece5b49b4da36274f059478637747b5623278d2`

## Writer Gate evidence

1. OPERATOR replacement decision: present in the replacement cold-start instruction and recorded by KOO authority artifact.
2. Old ARH writer freeze: `entities/koordinator/outbox/KOO__ARH-replacement-cold-start-authority-r01__OPERATOR.md`; old writer frozen for new authoritative profile mutations.
3. Competing ARH writer: none found in fresh reconciliation through pre-publication HEAD.
4. ARH role/powers: unchanged against active approved `entity-roles-short-v2_3-approved.md`.

This artifact establishes only ARH current-writer identity after successful cold-start. It does not execute pending profile tasks, sanitation tails, foreign current-state changes, production/external actions, or canonical recovery promotion.

Pending `KOO__RED-emergency-preservation-checkpoint-r01__ARH.md` remains `pending/revalidation` and is not executed in this cycle.

---
КТО: replacement ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: immutable current-writer establishment after verified cold-start and Writer Gate
СТАТУС: `CURRENT_WRITER_ESTABLISHMENT_CANDIDATE`
