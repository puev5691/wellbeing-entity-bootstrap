# KOD recovery evidence tail v0.6 candidate

classification: `CURRENT_DEPENDENCIES / COMPLETED_RESULTS / PARKED_BOUNDARIES`
project_time: omitted

## Writer and source baseline

- KOD current-writer v0.5: commit `df92a8bfcce29294332f6e4de3391a3e7966adfd`, blob `cf1c84f9df7c90509703e4885844d0cf871ff412`.
- Writer Gate readback result: commit `fd48a57fc49f0330c93e632fa8221b5476e6cfe9`, blob `34781b7a66a99c161cc46c85a1a67c1f55aaa958`.
- Active Project Sources: source-set r07, exact six blobs listed in initiation v0.6.
- Fresh pre-snapshot HQ HEAD: `a6873d9b2fe0200dc2d02a17c20aeb9e52c2efcb`.

## Current completed result chain

KOD routing-observability result:
- commit `b13efdd6fe32a72c4e8a0f58e2a009457b2e329b`;
- blob `20aa087daec5497007b1cd307c36e17047156723`;
- terminal `PASS_KOD_TELEGRAM_ROUTING_OBSERVABILITY_R01_CANDIDATE_READY_FOR_SIS_REVIEW`;
- package commit `7bc9ab9df85a80bedd6717aa38b0478c3c12ecb1`;
- package tree `bbe40dc80670b33594f997cea52e42508a7ae12b`;
- status `CANDIDATE_NOT_INSTALLED`.

KOO reconciliation:
- commit `e5f561b4eaba41214a4a570f2872d27b1e5b5f0c`;
- artifact blob `f1c5e97180f87c4873619ca9abbe20d4f0769f08`;
- selected SIS independent review/install-readiness as the one next step;

SIS independent review:
- exact commit `a6873d9b2fe0200dc2d02a17c20aeb9e52c2efcb`;
- artifact blob `fe98163b93e5bb7266d2d11a01e4a52012b89495`;
- terminal `PASS_SIS_TELEGRAM_ROUTING_OBSERVABILITY_R01_REVIEW_READY_FOR_SEPARATE_INSTALL_VERIFY`;
- result: 35/35 offline PASS, additive/idempotent migration PASS, privacy PASS, no install/live call;
- next: separate new bounded install/verify task required.

Do not replay any completed KOD task from this chain.

## Explicitly parked / not authorized

- current KOD profile task: none;
- Telegram installation/service start/live call: not authorized by existing result;
- memory-layering attempt 3: `NOT_AUTHORIZED`;
- `CHECKPOINT_DURABLE`: `NOT_ESTABLISHED`;
- EOM shard pilot execution: blocked/not authorized;
- live shard WRITE/CAS: not authorized;
- STP-C T01–T20/backend run: not authorized by KOD design/corpus artifacts;
- old provider one-shot authorities: consumed where recorded; never replay.

## No-replay invariant

Recovery carries exact evidence for continuity only. Historical prompts, tasks, candidate packages, dispatches and wake/activation records do not become current assignments merely because they are present or newer than the previous recovery.

Fresh task/currentness/authority/writer checks are mandatory before `processing_started=yes`.
