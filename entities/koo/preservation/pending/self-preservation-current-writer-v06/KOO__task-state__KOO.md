# KOO task state at preservation boundary

## ACTIVE, requires fresh reconciliation

### SIS / clean OpenAI runtime staging

Task:
`d9e54c4f5255c09b80a6de3e4e3ad83cb7219ba1`

Inbox:
`9dde15662a125a88b1cb10bc108310827a852cfb`

Purpose:
stage exact verified clean four-model runtime bytes on `ruvds-xnqc6` under `/home/pev5691/openai-d0-runtime-r01/package/`, with bounded backup and host SHA readback.

No provider call is authorized by staging task.

### SHD / Telegram live-ingest preparation verify

Task:
`846f9cf3aec6e6d67b4dd0d331dcd8d55e468fd8`

Inbox:
`f5332fe222dfcf8fa8e4688f8d2183a0b925e237`

Candidate:
`entities/koder/outbox/telegram-live-ingest-prep-r01/`
boundary commit `7388df5af8e987da70148ac97ed435930ea2ad12`.

Purpose:
independent verify of bounded real-read contract only. No live Telegram access.

## WAITING / CONDITIONAL

### OpenAI four-model cost matrix

Latest live task:
`a011be06d1bbb23b53dc74cd0ee3fb1c53291d34`.

Latest blocker:
`87ef5c98446e8bc824d7cece9eaeaa27ea46ce38`
`BLOCKED_SIS_OPENAI_COST_MATRIX_R02_CLEAN_RUNTIME_NOT_DEPLOYED_EXACT_BYTES`.

At blocker:
provider attempts 0, credential reads 0.

Resume only after exact clean runtime staging PASS and fresh reconciliation.

### SIS shard gateway plan

Preserved task:
`2857e5601a9d156c9f03594db9db3da740013426`.

Basis:
ARH host selection PASS `7f846d3d36a2497ef81346b19acf054d2d9339ce`.

Not known completed at this snapshot. Fresh-reconcile before resume.

## QUEUED / NOT ACTIVE

Telegram first real discussion ingestion requires:
- SHD preparation verification PASS;
- a separate single-use OPERATOR/KOO authority;
- exact inclusive `message_id` interval;
- max_messages <= 20;
- read-only, sends=0, retries=0, provider_calls=0.

No real-read authority has been issued.

## EDITORIAL TAIL

RED project history r0.2 has long remained without a confirmed terminal result. A separate investment-direction map does not close the history task.

Replacement must not spend an active WIP slot on this unless fresh HQ evidence or OPERATOR priority changes it.
