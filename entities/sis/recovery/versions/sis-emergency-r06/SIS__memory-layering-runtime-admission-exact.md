# SIS → KOO: memory-layering E2E r0.1 p552203 runtime admission

verdict: PASS_SIS_MEMORY_LAYERING_E2E_R01_P552203_RUNTIME_ADMISSION
project_time: omitted

## Человеческий смысл

Exact synthetic E2E runtime на p552203.kvmvps материализован и прошёл bounded runtime admission.

MAIN не запускался.

OLD-01 и NEW-01 task logic не запускались.

Существующая MAIN authority:
AUTHORIZE_MEMORY_LAYERING_E2E_R01_MAIN_SYNTHETIC_EXECUTION

остаётся неизрасходованной:
main_authority_consumed=false
main_attempts_started=0.

Среда готова только к отдельному будущему решению о MAIN.

## Scope

RUNTIME_ADMISSION_ONLY
MAIN_NOT_STARTED

Current OPERATOR runtime-admission authority:
AUTHORIZE_MEMORY_LAYERING_E2E_R01_P552203_RUNTIME_ADMISSION

No automatic transfer of MAIN authority to this host is claimed.

## Fresh GitHub basis

Fresh HQ HEAD before runtime work:
6e097922baf9eb47b54deb57d0d796d95f696d2e

Design:
puev5691/wellbeing-hq@9887cd2b3ea7ab09ba58dfa50f27a7f5f6718dca:
entities/koder/outbox/KOD__memory-layering-e2e-design-r01__KOO-SHT.md
blob b1db36b9d2f7510ce4a4efe92071d2f97d0df0a0

Preparation package:
puev5691/wellbeing-hq@5e03bfb59e763ba48e2ea982f31ae3fc33b69b23:
entities/koder/outbox/test/memory-layering-e2e-r01-preparation

subtree:
c3a4f352d5d65e363d569803bc726bac164bd086

files:
42

Host materialization SHA256SUMS readback:
PASS

ARH:
PASS_ARH_MEMORY_LAYERING_E2E_R01_PREPARATION_PRESERVATION
commit c80f578227c864f3c6034eafd2ed410b9738422a
blob 6f6ad66f066c9b81d98e8c4376c1bf0872f5d5cb

SHT:
PASS_SHT_MEMORY_LAYERING_E2E_R01_PREPARATION_VERIFICATION
commit 511ca4170009382eab94ec3bf91c093eb2c8cfac
blob a5f50e6944e450121c690d511845d79198cf2ebe

Previous KOD blocker remains evidence of the old unsuitable runtime only:
BLOCKED_KOD_MEMORY_LAYERING_E2E_R01_RUNTIME_ISOLATION_UNAVAILABLE

It is not replay authority and was not treated as MAIN authorization.

## Fresh host reconciliation

Exact host:
p552203.kvmvps

Observed before final materialization:
- Ubuntu 24.04.1 LTS;
- kernel 6.8.0-51-generic;
- x86_64;
- user shd uid 1000;
- virtualization microsoft;
- machine-id SHA-256 8c109d3a8fabdd5dae11510668967ba94ea2314b20374e8218cf76e1dbcba1f4;
- kernel.unprivileged_userns_clone=1;
- user.max_user_namespaces=7588;
- apparmor_restrict_unprivileged_userns=0;
- actual unshare -Ur probe PASS.

This matches the prior feasibility evidence in all material runtime properties.

An earlier temporary staging created before this cycle's explicit host re-read was removed completely and rebuilt only after fresh reconciliation. Final admission binds only the post-reconciliation materialization.

## Materialized supervisor area

Non-production supervisor-owned root:
 /home/shd/ml-e2e-r01-admission

Materialized:
- exact immutable preparation package supervisor-side;
- OLD-01 worker projection;
- NEW-01 worker bootstrap projection;
- bounded semantic broker code/config;
- sandbox launcher;
- one-attempt gate;
- empty future worker-code slots;
- empty OLD-01/NEW-01 runtime root directories;
- immutable readiness evidence.

Not materialized into worker view:
- package root;
- verifier-private;
- oracle;
- expected final result;
- project repository;
- project credentials;
- project home;
- project writer capability.

## Worker projections

OLD-01 receives only:
- recovery/input.json;
- recovery/task-v2.json.

NEW-01 initial projection receives only:
- recovery/identity-authority.json;
- recovery/current-state.json;
- recovery/history-index.json;
- recovery/mandatory-sources.json;
- six exact approved source copies.

Mandatory source bytes:
192853.

Initial recovery bytes:
2962.

Package-root is never mounted into either worker sandbox.

## Runtime mechanism

Materialized sandbox launcher SHA-256:
b5975eb19349f65bb58051b4bb9c124970c91bf431fd18bb3da852ad8ce520f4

Mechanism:
- fresh unprivileged user namespace;
- fresh mount namespace;
- fresh PID namespace;
- fresh network namespace;
- tmpfs/chroot root;
- /usr read-only runtime mount;
- per-instance worker projection read-only;
- NEW-01 broker socket directory read-only;
- env -i before worker;
- all capability sets zero;
- NoNewPrivs=1;
- timeout 5 s;
- no automatic retry.

Python runtime self-populated LC_CTYPE=C.UTF-8 after env -i. No host/project environment variable was inherited; forbidden environment canary remained absent.

## Oracle boundary

Supervisor-side oracle SHA-256:
4605465d21b519556bc07dd4341d5d32db3336efff072303ce31a2473fd0e4b7

Supervisor-side restoration oracle SHA-256:
ac64e0376ca6869ce4c580bd3d5cc0945db82b8184f6db3d7580ac05a4761f9f

Supervisor can read these files.

OLD-01/NEW-01 sentinel:
package-root unreadable,
oracle unreadable,
host home unreadable,
project repository unreadable.

Therefore oracle remains supervisor-only in the admitted runtime.

## Semantic broker

Broker code SHA-256:
e087c602ede9ce6ef74422be2add1e77f073d7713097344b582d9dfaae8c1b86

Broker config SHA-256:
0037645f9f43487246b838b7f590a9c42b71a3542dd2a35dcca6798093d10974

Exact request vocabulary:
JSON object with exactly:
- op=read;
- locator=<exact allowlisted path>.

Allowlist:
11 exact retrieval locators from immutable contracts/retrieval.json.

Limits:
- semantic reads <= 32;
- semantic bytes <= 262144.

Actual readiness:
- exact recovery/task-v2.json → ALLOW;
- missing locator → DENY_UNKNOWN_LOCATOR;
- full-corpus → DENY_FORBIDDEN_LOCATOR;
- verifier-private/oracle.json → DENY_FORBIDDEN_LOCATOR.

Sentinel accounting:
reads=4
semantic_bytes=562
wire_bytes=1366

Broker evidence SHA-256:
e9e6b7c87ee66c944bd00f9e24f39adc36ca7ccba9ce4d0385c40e1f77d13203

Broker socket is absent in final state.
No broker process remains running.

## Actual sentinel on materialized future layout

Both OLD-01 and NEW-01 contexts were created concurrently through the materialized sandbox launcher.

OLD-01 evidence SHA-256:
a2349d03f22ce2467af3fabd67ed2bac0211a5be26faa494af99fa35188662c8

NEW-01 evidence SHA-256:
b32592b418cc69df4453cb508d64dbe3c1aee4cb663ddf5f305eed29fb4d70b8

Both proved:
- allowed input readable;
- allowed input write denied;
- host canary inaccessible;
- package-root inaccessible;
- oracle/checker-private inaccessible;
- host home/SSH inaccessible;
- project repo inaccessible;
- forbidden env canary absent;
- outbound 1.1.1.1:53 denied with Network is unreachable;
- cwd=/work, not project cwd;
- CapInh/CapPrm/CapEff/CapBnd/CapAmb all zero;
- NoNewPrivs=1.

OLD-01:
broker path not visible.

NEW-01:
- exact semantic read allowed;
- unknown locator denied;
- full-corpus denied;
- oracle locator denied.

The two concurrent contexts had distinct user/mount/pid/network namespace identities.

No OLD/NEW task logic was executed.

## Attempt and deadline enforcement

One-attempt gate SHA-256:
2083a5913965b84bb5071caf6890b46cce19930c36a4a40d9a9393ad3c4584ec

Harmless gate probe:
first claim → ALLOW;
second claim → DENY_ATTEMPT_ALREADY_CLAIMED.

Probe claim was removed after readiness.

No MAIN claim exists.

Automatic retries:
0.

Deadline probe used the same namespace/chroot/capability mechanism.

A harmless sleep was killed by timeout:
probe deadline=1 s
rc=124
enforced=true

Future admitted deadline ceiling:
5 s.

## Immutable execution-admission record

Published machine-readable admission:
entities/sisadmin/outbox/SIS__memory-layering-e2e-r01-p552203-runtime-admission.json

publication commit:
cccce6f58625716bd9ac765aadc6f24888f08703

Git blob:
8d5a3ceaa63767957906e0b1df3fcfe108e725aa

Exact host file SHA-256:
c9305e658da97c6852b9d4bcb6ce73a5f1053bdfe926efe796ffa43e242665fe

Runtime policy SHA-256:
1b7a39191d6c2ccffc5972a395f99ea54742f96e451b501bd95a695ccfaeecc4

The record explicitly states:
RUNTIME_ADMISSION_ONLY
MAIN_NOT_STARTED
main_authority_consumed=false
main_attempts_started=0

## Final host state

Exact preparation package checksum:
PASS.

Worker-code slots:
empty.

Runtime roots:
empty.

Standing worker process:
none.

Standing broker process:
none.

Broker socket:
absent.

MAIN attempt claim:
absent.

Sentinel executable was removed from supervisor/worker slots after readiness and preserved only as evidence bound by SHA-256.

No privileged component installed.

## Boundary accounting

MAIN attempts = 0.
OLD-01 task execution = 0.
NEW-01 task execution = 0.
Provider calls = 0.
Automatic retries = 0.
Production/project writes = 0 except requested GitHub evidence artifacts.
Writer changes = 0.
Canon changes = 0.
Retention-policy changes = 0.
Project acceptance = NOT_GRANTED.
Production acceptance = NOT_GRANTED.
MAIN authority consumption = 0.

## Conclusion

Exact p552203 runtime is admitted for the synthetic memory-layering E2E r0.1 environment only.

Terminal:
PASS_SIS_MEMORY_LAYERING_E2E_R01_P552203_RUNTIME_ADMISSION

This PASS does not authorize MAIN execution.
KOO must fresh-reconcile this exact admission and obtain/use a separate MAIN decision before task executor materialization or OLD-01/NEW-01 task logic.

---
КТО: SIS / СИСАДМИН
КОМУ: KOO / КООРДИНАТОР
СТАТУС: PASS_SIS_MEMORY_LAYERING_E2E_R01_P552203_RUNTIME_ADMISSION
