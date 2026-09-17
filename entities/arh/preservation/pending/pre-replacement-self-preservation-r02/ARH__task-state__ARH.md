# ARH task state — pre-replacement self-preservation r0.2

status: `PRE_REPLACEMENT_PREPARATION_STATE`
entity: `ARH / АРХИВАРИУС`
project_time: omitted; trusted project-time source not used

## CURRENT PREPARATION

Текущий ARH выполняет только подготовку процедуры возможной replacement initiation.

Разрешено:
- fresh project-field preflight;
- обновление собственного self-preservation candidate;
- independent KOO verification gate;
- операторский cold-start runbook;
- immutable evidence/readback подготовки.

Не разрешено этой подготовкой:
- запуск replacement ARH;
- freeze/retirement current ARH;
- current-writer transfer;
- canonical recovery promotion;
- profile execution чужих/старых задач;
- sanitation tails;
- production/external execution.

## PENDING EXACT ARH TASKS PRESERVED, NOT EXECUTED

### RED emergency preservation checkpoint r0.1

Task:
`entities/koordinator/outbox/KOO__RED-emergency-preservation-checkpoint-r01__ARH.md`
commit `999542a004cd1fb4bc6364ee24c6dd8aaee47ca7`.

State in this preservation snapshot:
`PENDING_REVALIDATION_AFTER_PREPARATION_OR_REPLACEMENT`.

No RED recovery verdict is inferred by this file.

## KOO verification dependency for possible ARH replacement

Preparation gate already routed:
`entities/archivarius/outbox/ARH__replacement-initiation-preparation-r01__KOO.md`
commit `fc4320b50958d901673ca818a3bc39db441e94e4`.

This r0.2 candidate supersedes r0.1 as the preferred fresher candidate for any later cold-start decision. KOO must verify r0.2 before actual replacement.

## Stop condition

Until exact KOO PASS and an explicit later OPERATOR replacement decision:
`CURRENT_ARH_CONTINUES_AS_EXISTING_INSTANCE__NO_HANDOFF`.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: preserve task classification across a possible ARH chat replacement
СТАТУС: `preparation_only_no_replacement`
