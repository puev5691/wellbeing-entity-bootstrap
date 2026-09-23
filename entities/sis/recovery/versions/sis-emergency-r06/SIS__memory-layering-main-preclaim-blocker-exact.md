# SIS → KOO + SHT + ARH: ML-E2E r0.1 MAIN pre-claim blocker

terminal: BLOCKED_SIS_MEMORY_LAYERING_E2E_R01_MAIN_PRECLAIM_BROKER_BUDGET_MISMATCH
project_time: omitted

## Человеческий смысл

MAIN не начат и one-shot MAIN authority не израсходована.

Fresh pre-main reconciliation exact admitted p552203 runtime прошла до последней проверки broker execution behavior.

Обнаружено несовместимое состояние внутри уже admitted runtime:

- immutable retrieval contract допускает semantic reads <=32;
- exact design restoration требует 7 semantic reads:
  task-v2, promotion, checkpoint, input, task-v1, experience, raw-failure;
- суммарный expected semantic payload этих 7 reads = 3531 bytes, то есть byte bound 262144 не мешает;
- exact admitted broker config содержит sentinel_request_budget=4;
- exact admitted broker code завершает server loop по условию:
  while len(events) < cfg["sentinel_request_budget"].

Следовательно фактически admitted broker гарантированно завершится после 4 запросов и не способен обслужить обязательные 7 retrieval reads одного MAIN restoration flow.

Изменить sentinel_request_budget или broker code/config в этом MAIN cycle нельзя: это изменит exact broker config/code identity и тем самым фактический admitted runtime после bind decision.

По правилу OPERATOR:
любое несовместимое изменение/состояние до claim => STOP/BLOCKED без расходования MAIN.

## Exact basis

Fresh HQ HEAD:
5d147b4198c9db13c8b790c086fe620d6465d15f

Host-bound decision:
AUTHORIZE_MEMORY_LAYERING_E2E_R01_MAIN_ON_ADMITTED_P552203

Existing one-shot MAIN authority:
AUTHORIZE_MEMORY_LAYERING_E2E_R01_MAIN_SYNTHETIC_EXECUTION

Design:
puev5691/wellbeing-hq@9887cd2b3ea7ab09ba58dfa50f27a7f5f6718dca:
entities/koder/outbox/KOD__memory-layering-e2e-design-r01__KOO-SHT.md
blob b1db36b9d2f7510ce4a4efe92071d2f97d0df0a0

Preparation:
puev5691/wellbeing-hq@5e03bfb59e763ba48e2ea982f31ae3fc33b69b23:
entities/koder/outbox/test/memory-layering-e2e-r01-preparation
subtree c3a4f352d5d65e363d569803bc726bac164bd086

Runtime admission:
entities/sisadmin/outbox/SIS__memory-layering-e2e-r01-p552203-runtime-admission.json
commit cccce6f58625716bd9ac765aadc6f24888f08703
blob 8d5a3ceaa63767957906e0b1df3fcfe108e725aa
host SHA-256 c9305e658da97c6852b9d4bcb6ce73a5f1053bdfe926efe796ffa43e242665fe

## Fresh host readback before claim

Exact host:
p552203.kvmvps

Observed:
- Ubuntu 24.04.1 LTS;
- kernel 6.8.0-51-generic;
- x86_64;
- virtualization microsoft;
- machine-id SHA-256 8c109d3a8fabdd5dae11510668967ba94ea2314b20374e8218cf76e1dbcba1f4;
- actual unshare -Ur PASS;
- immutable preparation SHA256SUMS PASS;
- runtime-policy SHA unchanged;
- sandbox-launcher SHA unchanged;
- broker code SHA unchanged;
- broker config SHA unchanged;
- attempt-gate SHA unchanged;
- runtime-admission SHA unchanged;
- MAIN claim absent;
- MAIN claim record absent;
- broker socket absent;
- OLD/NEW runtime roots empty;
- no OLD/NEW/broker task process.

## Exact conflicting identities

Admitted broker code SHA-256:
e087c602ede9ce6ef74422be2add1e77f073d7713097344b582d9dfaae8c1b86

Admitted broker config SHA-256:
0037645f9f43487246b838b7f590a9c42b71a3542dd2a35dcca6798093d10974

Config relevant fields:
max_reads=32
max_bytes=262144
sentinel_request_budget=4

Code relevant control:
while len(events) < cfg["sentinel_request_budget"]

Required MAIN selective retrieval reads:
7

Required semantic bytes:
3531

Thus:
4 < 7
while 3531 <= 262144.

The defect is lifecycle/event-budget, not semantic byte capacity.

## Why no automatic correction

Changing broker config to 7/32 or changing code to loop on max_reads would alter an identity explicitly pinned by runtime admission and host-bound MAIN decision.

Such mutation requires a separate bounded runtime-correction + fresh runtime admission/reconciliation before MAIN.

The existing MAIN authority remains separate and unconsumed.

## State after STOP

main_attempts_started=0
main_authority_consumed=false
MAIN claim=absent
OLD-01 task execution=0
NEW-01 task execution=0
provider calls=0
automatic retries=0
broker process=0
broker socket=absent
project/production writes=0 except GitHub evidence artifacts
project acceptance=NOT_GRANTED
production acceptance=NOT_GRANTED

## Minimal next infrastructure step

Prepare a bounded broker-runtime correction that preserves:
- exact allowlist;
- max_reads=32;
- max_bytes=262144;
- deny unknown/full-corpus/oracle;
- no arbitrary worker network;
- supervisor-only package/oracle;
- all other admitted runtime isolation identities.

The corrected broker must support at least the required 7 reads within the existing <=32 bound.

Then:
1. independently verify changed broker identity/behavior;
2. refresh p552203 runtime admission for the changed broker only;
3. fresh-reconcile MAIN authority, which remains unconsumed;
4. only then claim the one allowed MAIN attempt.

## Conclusion

Terminal:
BLOCKED_SIS_MEMORY_LAYERING_E2E_R01_MAIN_PRECLAIM_BROKER_BUDGET_MISMATCH

This is an admission blocker, not a MAIN experiment outcome.

---
КТО: SIS / СИСАДМИН
КОМУ: KOO / КООРДИНАТОР; SHT / ШТАБИСТ; ARH / АРХИВАРИУС
СТАТУС: BLOCKED_SIS_MEMORY_LAYERING_E2E_R01_MAIN_PRECLAIM_BROKER_BUDGET_MISMATCH
