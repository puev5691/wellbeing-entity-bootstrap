# SIS — task state for planned replacement v03

status: `self_preservation_candidate`
rule: `preserve causal states without promotion`
project_time: omitted; trusted project-time source not used

## ACTIVE_PRESERVATION_ONLY

### SIS self-preservation / replacement preparation

Triggered explicitly by OPERATOR.

Required current cycle:
- publish v03 self-owned recovery candidate externally;
- compute checksums after final substantive bytes;
- perform immutable post-publication readback;
- route preservation result to ARH and KOO;
- stop before writer transfer.

This state does not itself initiate a replacement instance.

## BLOCKED / WAITING_REVERIFY

### OpenAI comparative cost matrix r0.1

KOO task commit:
`512cad6059a4911ee16fb6012a9e05366dc3b547`.

SIS blocker commit:
`8139700f5f31523073d7bbe3ee93e393308d0775`.

Exact blocker:
`BLOCKED_OPENAI_COST_MATRIX_ASTRA_NOT_IN_VERIFIED_RUNTIME_ALLOWLIST`.

At blocker point:
- provider calls: 0;
- credential not read;
- Luna/Terra/Sol/Astra matrix not started.

New KOD candidate:
commit `627b4ffa136de996598c64bde4fb3d87c6cbce16`
status `PASS_KOD_OPENAI_ASTRA_CLEAN_R01_READY_FOR_REVERIFY`.

Do not treat that candidate as deployed/accepted runtime. Replacement SIS waits for fresh exact task/authority to reverify/stage before any provider call.

## CLOSED_VERIFIED

### OpenAI Luna D0
commit `28f92b1a72b96fefcb991d1ecccfd57752330301`
`PASS_SIS_OPENAI_LUNA_D0_R01`.

### Telegram discussion probe
commit `09b6fdfd04da84533185b11b0861b2220b72dfb3`
`PASS_SIS_TELEGRAM_DISCUSSION_PROBE_R01`.

### Telegram first channel one-send
commit `a8d46d205a3233b04aa9cf95cb4b349a166df119`
`PASS_SIS_TELEGRAM_EXPERIMENTAL_ONE_SEND_R01`.

### Telegram target mapping
commit `977a482936a8c0b4ad809c1b718048b1903fec9e`
`PASS_SIS_TELEGRAM_EXPERIMENTAL_TARGET_API_MAPPING_R01`.

### Mazhor preservation pilot
SIS commit `b7081ab521953206ac60b4bbaae9b83c27783a7b`;
ARH independent readback `758e7500c914472c35b7e5b521e51d374aa8d198`.

### Burzh/erefia shard benchmark
commit `52e9a70c2d507e299caaad58bacbf65b6f59aefd`
`PASS_SIS_SHARD_BENCHMARK_R01_READY_FOR_SELECTION`.

### Entity Resource Gateway live-worker
commit `18af0b778d5b30f15c20da989a39006f503dcff3`
`PASS_SIS_ENTITY_RESOURCE_GATEWAY_LIVE_WORKER_FINAL_R01`.

## EXTERNAL / OTHER ENTITY QUEUE

Fresh KOO active queue at the last read before preservation still showed other-entity work such as KOD Telegram semantic synthetic and ARH shard selection review. These are not SIS tasks and are not inherited as SIS work.

## HISTORICAL / DO_NOT_AUTO_REPLAY

- TERA2/WBN historical infrastructure;
- old VPN/Xray mutation paths;
- historical sudo scripts;
- Telegram Phase 1B older host-gate scripts;
- Entity Runner provider-side experiments;
- old OpenAI three-model staging prior to the Astra correction chain.

Historical evidence may remain useful, but it is not a current execution queue.

## One safe next step for replacement

After verified initiation and writer reconciliation:
fresh-read HQ active queue and SIS inbox.

If the OpenAI cost-matrix line remains current, require exact accepted/reverified Astra runtime evidence before provider execution.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: preserve task causality across planned replacement
СТАТУС: `self_preservation_candidate_task_state_v03`
