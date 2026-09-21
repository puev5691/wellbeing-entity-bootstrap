# KOO task state v0.7

## PRIORITY 1 — Бустер

### Verified state

KOD response-shape diagnostics r0.2:
`PASS_KOD_BOOSTER_V2_SHAPE_DIAG_PERSIST_R02_READY_FOR_SIS_REVERIFY`
commit `844bf5867c7f9acfb9a0ca6751913008c50d338a`.

Independent SIS reverify:
`PASS_SIS_BOOSTER_V2_SHAPE_DIAG_PERSIST_R02_REVERIFY`
commit `77c860e303b0b9f4c8adf0beb30d834b9694af86`.

Exact successor:
`entities/koder/outbox/openai-booster-shape-diagnostic-persistence-r02/`
boundary commit `f7134d215e55f1f3e072b8b540d302bd3754a47a`
tree `7e99798f7162d712d9f7a3fda580636d5ae39c03`.

39/39 deterministic tests independently reproduced.

### Current causal gate

Host `ruvds-xnqc6` still has predecessor runtime installed.

KOO opened decision gate:
`entities/koordinator/outbox/KOO__booster-v2-shape-r02-host-gate__OPERATOR.md`
commit `d9661e1bc007502c0b7f664323ff597b935bd655`.

Requested decision:
`AUTHORIZE_BOOSTER_V2_SHAPE_DIAG_R02_HOST_UPDATE_READINESS`.

At snapshot boundary this authorization is NOT recorded.

Therefore:
- no host mutation;
- no provider call;
- no credential access;
- no live mode;
- no project acceptance.

Historical live acceptance remains BLOCKED and its consumed authority is NON_REUSABLE.

After any future host-update/readiness PASS, a separate fresh one-shot diagnostic-live gate is required.

## PRIORITY 2 — Быстрая память / memory-layering

Historical design task:
`entities/koder/inbox/KOO__memory-layering-e2e-design__KOD.md`

task commit:
`153618d3d1c597c7a414c9df36cffce417a6820e`

inbox commit:
`895961d948dc1828a96d837552c30b5744d2235a`.

Historical manual-activation dependency:
`93a5f9f7151a45396d970b8cf9bf175234f503b1`.

No later KOD profile terminal for that exact branch was established by the preservation preflight.

Do NOT replay the old PROMPT automatically.
Replacement KOO must fresh-reconcile the whole memory-layering branch and determine the nearest current causal step.

## PRIORITY 3 — Telegram-фасилитатор

Independently verified foundations include:
- facilitator core;
- normalized-event bridge;
- semantic-input contract.

Latest exact semantic-input independent PASS:
`PASS_SIS_TELEGRAM_FACILITATOR_SEMANTIC_INPUT_CONTRACT_R01`
commit `8d738f6a2eafb84485ab5e11e1961adb60d017ac`.

That PASS authorizes no real Telegram ingestion, provider/LLM use, credentials, DB/systemd deployment, automatic approval or production integration.

Replacement KOO must fresh-reconcile later Telegram facilitator results before choosing a next step.

## PENDING NORMATIVE DECISION — task-conveyor v1.3

Decision gate:
`entities/koordinator/outbox/KOO__task-conveyor-v1_3-gate__OPERATOR.md`
commit `984711364e2902e61500ed43a4db183cbf92fffe`.

Requested token:
`APPROVE_TASK_CONVEYOR_CANON_V1_3_INCREMENTAL_JOURNAL_FEED`.

At snapshot boundary no explicit approval is established.
v1.2 remains active.

## NEW INCOMING / NON-PREEMPTING

KAN bounded working-circle experiment:
`entities/kancelar/outbox/KAN__bounded-working-circle-experiment-r01__OPERATOR-KOO-SHT-ARH.md`
commit `39cb6f6c9473dd49e126c1cbfa0cf45eae68895b`.

KOO review prompt:
`entities/kancelar/outbox/KOO_circle_topology_r01_review_prompt.md`
commit `91f849480e02eac83c736a8832ed087a15f5aded`.

KOO inbox locator:
commit `dcbd62df02f316eb5e36c6dd101aef392305d688`.

The sender explicitly marked this work:
`do not displace active exact work`.

Treat as pending incoming, not as a priority override.

## Replacement rule

After verified initiation, replacement KOO must fresh-reconcile all terminal results newer than snapshot boundary before acting.
Historical PROMPTs are evidence, not task authority.
