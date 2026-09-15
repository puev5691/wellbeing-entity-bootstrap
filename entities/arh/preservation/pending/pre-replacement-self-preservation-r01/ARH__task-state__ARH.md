# ARH task state — pre-replacement self-preservation r0.1

status: `PRESERVATION_TASK_STATE`
entity: `ARH / АРХИВАРИУС`
project_time: omitted; trusted project-time source not used

## ACTIVE

Одна exact ARH task:
`KOO__ARH-pre-replacement-self-preservation-r01__ARH.md`
commit `65eb351c2b428e4ec3ee38bbfd5e0a1644b421dc`.

Expected result:
`entities/archivarius/outbox/ARH__pre-replacement-self-preservation-r01__KOO.md`.

Разрешено только:
- fresh preflight;
- reconcile current ARH state;
- создать external pending preservation candidate;
- immutable readback/checksum verification;
- вернуть exact result KOO через Exchange Gate.

## NOT STARTED / FORBIDDEN IN THIS CYCLE

- replacement ARH initiation;
- ARH retirement/freeze;
- current-writer transfer/change;
- canonical promotion/replacement of `entities/arh/recovery/current`;
- unrelated sanitation tails;
- production/external execution;
- destructive cleanup;
- authority/canon changes.

## PARKED / RECHECK-LATER

Все ранее открытые ARH sanitation/service tails сохраняются как historical/current evidence, но не обрабатываются этой задачей. Their current status must be established by fresh evidence in a later separately authorized cycle.

## New external state to preserve, not execute

- KOO replacement v05 is now verified/current-writer established by commit `68aed55a23778cfa7c68a0cdb28ef08a6e3cd308`.
- KOD replacement writer v0.2 is established by commit `56db550005d6ed6956ba1bf753f3cb24ca295cc3`; profile work was not started by that artifact.

These are dependency/current-field facts, not ARH profile tasks.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: сохранить exact task classification without mixing other work
СТАТУС: `one_active_preservation_task_only`
