# KOO self-snapshot — emergency recovery v04

status: CURRENT_WRITER_EMERGENCY_SNAPSHOT_CANDIDATE
entity: KOO / КООРДИНАТОР
project_time: omitted; trusted project-time source not used

## Recovery baseline

Last externally verified canonical KOO recovery:
repository: puev5691/wellbeing-entity-bootstrap
path: entities/koo/recovery/current
recovery commit recorded by ARH registry: cbaad4cb94618788f5d50664d08d503a3247f61c

This v04 snapshot is newer current-writer state and does not replace canonical recovery until ARH preservation verification/publication/readback.

## Fresh project boundary

wellbeing-hq latest verified HEAD before v04 package creation:
85551290ebe6ae527b7a0ffdafb6e2f20b79433f

Latest relevant ARH result:
entities/archivarius/outbox/ARH__inbox-lifecycle-operational-review__KOO.md
commit: 1b6aab5e50c759a7027b3c5b370475fe35417eec
result: PASS_WITH_PRESERVATION_CONSTRAINTS

## Confirmed current decisions

### Delivery / source policy

OPERATOR chose Variant 1:
verified locator-based delivery is a valid terminal addressed-delivery mode when artifact/recipient/dispatch/locator/version/receipt/failure-mode requirements are met.

KAN source-loading-policy v2.1 candidate is ready but awaits explicit OPERATOR approval:
commit 59ae5c036151460ca63a0e2ccd37d4aa53c88aaf
blob da9bee953187c835aded8a4fc6edbc3ec50047b6

### Telegram media contour

Experimental channel:
https://t.me/wbnp_pev5691_15042026

Verified public facts:
- PUBLIC_VERIFIED
- title: Медиа Благополучие

Phase 0 behavior: PASS_BOUNDED.
Phase 1A: ACCEPTED_BOUNDED_PHASE1A_NONPRODUCTION.
KAN privacy gate: PASS_BOUNDED_WITH_PRE_LIVE_PRIVACY_FIXES.
KOO selected privacy mode: aggregate_only.

Live Phase 1B send remains NOT AUTHORIZED.

Addressed open dependencies:
- KOD: entities/koder/inbox/KOO__telegram-phase1b-privacy-code-fix__KOD.md
- SIS: entities/sisadmin/inbox/KOO__telegram-phase1b-runtime-privacy-readiness__SIS.md

Pre-live requirements:
- replace stale fail_closed_pending_KAN receipt semantics;
- no persistent raw Telegram update-body logging;
- exact sandbox DB path and cleanup action;
- later verify numeric chat id, discussion mapping, publisher bot/admin rights and webhook readiness.

### GitHub information-entry pilot

Bounded pilot r1 had prior bounded acceptance.
SHD cross-layer review found:
DEFECT_FOUND__TYPE_VALIDATION_GAP_CAN_OPEN_SECRET_DEPENDENCY_BYPASS

Exact KOD correction task:
entities/koder/inbox/KOO__github-info-entry-pilot-r1-defect__KOD.md

Public-ready promotion remains blocked until strict type-validation r2 is reviewed and SHD re-verifies cross-layer behavior.

### Inbox lifecycle

SHT design:
ACCEPTED_BOUNDED_DESIGN.

ARH preservation/operational review:
PASS_WITH_PRESERVATION_CONSTRAINTS.

ARH permits next bounded KOO-only pilot:
- entities/koordinator/current/inbox-lifecycle.jsonl
- entities/koordinator/current/active-queue.json

Constraints:
raw inbox append-only; no delete/move/rename; active queue is materialized view only; KOO owns its queue; ARH preserves provenance and checkpoints but does not mutate KOO queue.

KOO-only pilot files have NOT yet been created by this snapshot.

### COOP research conveyor

SHT v0.1 process model accepted:
ACCEPTED_BOUNDED_PROCESS_BASELINE.

No OSS implementation authorized.
No next file-first E2E research pilot has been opened yet.

### SHD staff/recovery

Operational role integration: PASS.
Project Source role v2.3 migration: PASS for current project source layer.
SHD current-writer recovery checkpoint verified by ARH:
PUBLISHED_CURRENT_PRESERVATION_VERIFIED__PRACTICAL_INITIATION_TEST_NOT_PERFORMED

External SHD package:
puev5691/wellbeing-entity-bootstrap/packages/shd-role-v2_3-current-recovery/
ref: ce9891f63b6123600623e01b8da84131f239c5c7

ARH checksum verification: 4/4 PASS.

Not proven:
- practical cold-start of a new SHD instance;
- exact historical ChatGPT Entity-chat resume.

### Activation continuity

Exact existing ChatGPT Entity start/resume remains unsupported/unproven.

Accepted boundary:
GitHub event -> detector/worker/local handler state is not proof of exact ChatGPT Entity profile processing.

SIS real-activation branch closed at:
BLOCKED_REAL_ENTITY_ACTIVATION_BOUNDARY.

Do not relabel local processing_started markers as exact Entity processing.

## Current automation evidence

Tool-verified during v04 preservation pass:

- KOO GitHub Work: enabled
- ARH GitHub Work: enabled
- KOD GitHub Work: disabled
- SHT GitHub Work: disabled
- SIS GitHub Work: disabled
- KAN GitHub Watch: disabled

Therefore newly addressed KOD/SIS/SHT/KAN tasks must not be assumed automatically processed.

## Current immediate KOO dependencies

1. ARH inbox-lifecycle review result exists and needs KOO receipt/decision before KOO-only queue pilot.
2. source-loading-policy v2.1 exact candidate awaits OPERATOR approval.
3. KOD Telegram privacy code fix awaits processing.
4. SIS Telegram runtime/privacy readiness awaits processing.
5. KOD information-entry type-validation r2 awaits processing.
6. sender-registry service-tail repair exists for SHT; non-blocking.
7. emergency recovery v04 preservation itself becomes the top priority until ARH verifies it.

## Experience / anti-regression references

Keep using the externally preserved KOO Experience Layer as historical/training evidence only:
- experience/KOO_experience-extraction.md
- experience/KOO_experience-cards.jsonl
- experience/KOO_anti-regression-cases.md

Important reusable lessons:
- fresh GitHub preflight before current-state claims;
- immutable code/tests > PASS prose;
- receipt != acceptance;
- Entity ID / Task ID / Instance ID are distinct;
- automation prompt text != applied automation;
- click != external resource creation;
- preserve state before chat degradation;
- if data + authority + capability suffice: execute -> verify -> short fixation.

## One safe next step after verified initiation

Fresh GitHub preflight, then process the exact ARH inbox-lifecycle result if it is still the highest-priority unresolved KOO-owned action.

Do not create KOO active-queue pilot before recovery initiation is verified and current-writer transfer is clear.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: authoritative current-writer self-snapshot before emergency handoff
СТАТУС: current_writer_emergency_snapshot_candidate
