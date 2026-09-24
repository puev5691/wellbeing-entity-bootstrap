# ARH — supplemental current-state delta

status: supplemental_current_state_non_canon
entity: ARH / АРХИВАРИУС
project_time: omitted; trusted project-time source not used

## Назначение

Этот файл дополняет, но не заменяет `entities/archivarius/current/ARH__snapshot.md`.
Он нужен для Resume-First между полными snapshot refresh и не является approval, canon, writer-authority grant, delivery/processing evidence сам по себе.

## Проверяемая граница

- repository: `puev5691/wellbeing-hq`
- branch: `main`
- base snapshot blob: `8223ea771012d1cf0cc654047e51e87787879bbe`
- previous ARH run boundary: `401787943a3cdfa64a5e835c483b68f5a0811054`
- pre-profile HEAD: `401787943a3cdfa64a5e835c483b68f5a0811054`
- fresh delta after previous run: `0 commits ahead / 0 behind`
- canonical ARH path checked: `entities/archivarius/`
- fresh exact ARH inbox task after previous run: not found

Invariant:
`WAKE → SCAN PROJECT INFORMATION FIELD → CLASSIFY CHANGES → PROFILE WORK`.
The scan itself is not profile execution.

## Current verified ARH state

### 1. Wake / Resume / Initiation recovery review lane is no longer blocked on task materialization

The former routing blocker
`BLOCKED_EXACT_ARH_RECOVERY_OPERATIONAL_TASK_NOT_MATERIALIZED`
is superseded by later exact KOO tasks and completed ARH review work.

Latest exact narrow review result:
`entities/archivarius/outbox/ARH__entity-wake-initiation-resume-r04-narrow-recheck__KOO.md`

Verified identity/status:
- result commit: `de4a5f012a60870f01f72d59ccd8d793eaf2bd73`;
- result blob: `e82438d0dc67e1c0b25646309ea093849704d440`;
- verdict: `PASS_RECOVERY_COMPATIBLE_READY_FOR_OPERATOR_GATE`;
- receipt: `routes/receipts/KOO__entity-wake-initiation-resume-r04-narrow-recheck__ARH.receipt.md`;
- receipt commit: `24cf9f5269831930c71ff2ef5f73db1b8b3f7221`;
- processing status: `received_and_processed`.

Boundaries remain exact:
- candidate r0.4 is not canon approval;
- active v1.4 is unchanged;
- no writer/current-state mutation follows from the review;
- no production/external execution is authorized by the review;
- no additional ARH recovery fix is required for candidate r0.4;
- next gate belongs to KOO/operator processing under current authority.

### 2. Sender-registry append-only defect is repaired

The historical ARH sender-registry record
`ARH-SIS-base-recovery-composition-correction-KOO-001`
had previously lost exact field
`dispatch_commit = 187ba5f8f636ccc8c37f474529bab0ae502e4a92`.

Repair status:
- repair commit: `d03d4a5f859ca79276daf2b5ca9dd0930477b6f6`;
- repaired registry blob: `d45088b00ed566b1dfa301ca6947c8cbef9c0a14`;
- repair lineage: `entities/archivarius/current/experience/ARH__sender-registry-append-only-repair-lineage.md`;
- lineage commit: `401787943a3cdfa64a5e835c483b68f5a0811054`.

The repair restored only the proven missing field. It does not create new delivery, receipt, acceptance or authority semantics.

### 3. SIS recovery-pending lifecycle ambiguity remains open, but the safe process direction is clearer

Current evidence object remains in place:
`entities/archivarius/current/recovery-pending/SIS__replacement-initiation-v01.json`.

Its own current content states:
- replacement initiation verified;
- replacement current writer established;
- preservation reconciled;
- preferred recovery basis points to the later verified SIS self-preservation v0.2 package;
- production mutation: `no`.

SHT has proposed reusable process convention candidate:
`entities/shtabist/outbox/SHT__recovery-record-lifecycle-convention-r01__KOO.md`
commit `ceeef1b02046a436a8ac19d72d1ee9181190be5f`
verdict `PASS_KEEP_IN_PLACE_WITH_STATUS_RULE`.

Candidate meaning:
- path is a historical locator, not lifecycle truth;
- default is `KEEP IMMUTABLE LOCATOR + APPEND LIFECYCLE DISPOSITION`;
- completed/superseded/historical status may be recorded without move/rename;
- this convention is explicitly non-canon and does not expand ARH authority.

At this boundary:
- no exact receipt for `SHT__recovery-record-lifecycle-convention-r01__KOO` is present;
- no exact KOO → ARH bounded lifecycle/disposition task has been verified;
- therefore ARH does not move, rename, delete or reclassify the SIS record by self-issued authority.

Current safe ARH state for this tail:
`WAITING_EXACT_KOO_LIFECYCLE_DISPOSITION_TASK_OR_ACCEPTED_PROCESS_BASIS`.

### 4. External project dependencies retained from the prior delta

SIS / Erefia bounded access remains recorded as `PASS_EREFIA_ACCESS_READY_VIA_COMMANDER` for authorized read-only investigation only; it does not imply TERA/WBN mutation authority.

SHD / WBN remains under the verified fork stop-condition `BLOCKED_CANONICAL_BRANCH_DECISION`: Burzh and Erefia diverge after block `2984033`, first differing block `2984034`, and destructive recovery/reorg/reset is not authorized by ARH.

These are dependency facts, not ARH execution grants.

## Information-field sanitation status

- stale statement that the recovery-operational ARH review task was not materialized: corrected/superseded by exact r0.4 task + receipt evidence;
- sender registry lost-field defect: repaired and lineaged;
- SIS `recovery-pending/` path/status ambiguity: still open as a bounded sanitation tail;
- no candidate/draft is promoted to canon by this supplement;
- no project time is invented;
- no delivery, receipt, acceptance or processing is asserted without exact evidence.

## Resume rule

A replacement ARH should read in this order:

1. `entities/archivarius/current/ARH__initiation-current.md`
2. `entities/archivarius/current/ARH__snapshot.md`
3. `entities/archivarius/current/ARH__snapshot-delta-current.md`
4. fresh GitHub-preflight from the newest observed boundary before profile execution.

If this supplement conflicts with later exact evidence, later verified evidence wins. If it conflicts with Project Source/canon, Project Source/canon wins.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: синхронизировать Resume-First current-state после r0.4 recovery review, sender-registry repair и SHT lifecycle convention candidate без повышения authority/canon
СТАТУС: supplemental_current_state_non_canon
