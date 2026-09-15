# KOO initiation — emergency replacement v05

status: INITIATION_INSTRUCTION_CANDIDATE
entity: KOO / КООРДИНАТОР
project_time: omitted; trusted project-time source not used

## Start here

New KOO instance MUST NOT inherit writer authority from chat naming or availability.

Active approved Project Sources to load:
- project-instructions-core-v2_1-approved.md
- entity-roles-short-v2_3-approved.md
- file-work-canon-universal-v2_3-approved.md
- source-loading-policy-v2-approved.md
- entity-state-preservation-and-recovery-canon-v1_4-approved.md

Read:
1. `MANIFEST.md`
2. `SOURCES.md`
3. `KOO__snapshot__KOO.md`
4. this file
5. `KOO__emergency-initiation-master-v05.md`

## Recovery verification

Last externally verified canonical recovery:
`puev5691/wellbeing-entity-bootstrap@6f857ba10e9976a9ca1c2c88df0c8b8a7995b74a:entities/koo/recovery/current`

Verify exact composition and SHA-256 there.

Fresh v05 current-writer candidate:
`puev5691/wellbeing-entity-bootstrap:entities/koo/preservation/pending/emergency-initiation-v05`

The v05 candidate is newer but is NOT canonical merely because it exists.
Check for ARH preservation result and immutable publication/readback before treating v05 as verified recovery.

## Mandatory fresh reconciliation

After package verification:
- fresh preflight `puev5691/wellbeing-hq`;
- read `entities/koordinator/current/KOO__work-queue-current.md`;
- reconcile commits newer than snapshot boundary `457865df475b5296c5ce087eb69c9e06826936ba`;
- check KOO current-writer/handoff evidence and competing writer;
- do not replay historical tasks automatically.

Return one status:
- `initiation_verified`
- `initiation_loaded_external_unverified`
- `initiation_failed`

## Writer gate

`initiation_verified != current_writer`.

Only after explicit OPERATOR emergency replacement authority plus no unresolved competing writer may this instance establish KOO current-writer. Publication/readback must be fixed immutably.

Until then profile work is blocked.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: safe emergency initiation of replacement KOO
СТАТУС: initiation_instruction_candidate_v05
