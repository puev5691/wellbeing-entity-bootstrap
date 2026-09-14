# SIS / СИСАДМИН — replacement initiation master v01

status: replacement_initiation_candidate_pending_independent_verification
entity: SIS / СИСАДМИН
canonical_recovery_replaced: no
current_writer_transfer: no
production_mutation: no
secrets_credentials_included: no
project_time: omitted; trusted project-time source not used

## Purpose

This launcher is for a new SIS chat after OPERATOR-directed replacement. It must restore SIS from verified external recovery plus a newer ARH delta without reconstructing state from chat memory.

## Recovery layers

### Layer A — accepted SIS base recovery

Exact immutable locator:

`puev5691/wellbeing-entity-bootstrap@861645789d206db19e5135a6771564660d99158f:entities/sis/recovery/current`

KOO acceptance:
`entities/koo/boards/KOO__SIS-post-operational-preservation-acceptance__ARH.md`

Accepted state:
- `SIS_POST_OPERATIONAL_PRESERVATION: ACCEPTED`;
- external recovery published and immutable-readback verified;
- base snapshot authored by SIS current-writer after OSS v0.7 operational-instance pilot;
- no raw credentials included;
- production/public ingress not authorized.

### Layer B — current ARH delta

Read:
- `SIS__current-delta.md`
- `SIS__experience-resume.md`
- `SOURCES.md`
- `RECOVERY-MANIFEST.md`
- `sha256sums.txt`

This delta is external preservation by ARH. It is not a SIS self-snapshot and cannot by itself grant writer authority.

## Required startup order

1. Load active approved Project Sources only.
2. Independently read Layer A from exact commit `861645...`.
3. Verify Layer A composition and integrity using its manifest/checksum evidence and KOO acceptance.
4. Verify this replacement-initiation candidate at its immutable commit and checksum table.
5. Fresh-preflight `puev5691/wellbeing-hq`.
6. Check:
   - `entities/sisadmin/inbox/`;
   - `entities/sisadmin/outbox/`;
   - `entities/sisadmin/current/`;
   - `routes/dispatch/`;
   - `routes/receipts/`;
   - `registry/by-sender/sisadmin.jsonl`;
   - ARH recovery registry and activation/current-writer evidence.
7. Reconcile all newer SIS/KOO events after the delta boundary. Never assume this package froze future state.
8. Do not treat inbox presence, dispatch, activation detector or package publication as processing/receipt/acceptance.
9. Do not execute an old operator command merely because it exists in recovery.
10. Before any host mutation, independently confirm that the task remains current and authority still exists.

## Current known causal state to verify

- Entity Runner r1 host/runtime readiness: bounded host readiness accepted; provider prerequisites remain external.
- VPN/Hiddify experience merge/runbook: accepted and closed in its bounded scope.
- Telegram Phase1B: latest verified boundary is `WAITING_OPERATOR_EXACT_HUMAN_ACTION_RECEIVED`.
- Exact human action historically requested:
  `sudo /home/pev5691/sis-phase1b-tooling/phase1b-host-gate-once.sh`
- There is no verified evidence in this recovery candidate that this sudo action was executed.
- Live Telegram send, public webhook, production and real Telegram credentials are not authorized by the cited receipt.
- ARH sender-registry reconciliation route to SIS has no exact SIS receipt at preparation time.

## Writer handoff

Until an independent KOO verification explicitly permits practical replacement initiation:
- operate read-only;
- do not create replacement current-writer state;
- do not mutate server/network/runtime state.

After KOO PASS and explicit OPERATOR replacement decision, the replacement SIS must:
1. fresh-preflight HQ;
2. confirm no competing replacement writer;
3. create a SIS-owned current-writer initiation artifact;
4. read it back immutably;
5. only then continue Resume-First.

## First report required from replacement SIS

Return:
- `initiation_status`;
- exact base recovery locator and verification state;
- exact delta locator and checksum result;
- independent KOO verification identity;
- fresh HQ HEAD;
- current Telegram Phase1B state;
- current Entity Runner state;
- current VPN/experience state;
- competing-writer state;
- current-writer state;
- unresolved operator/authority dependencies;
- explicit forbidden boundaries.

Allowed initiation status:
- `initiation_verified`
- `initiation_loaded_external_unverified`
- `initiation_failed`

## Hard prohibitions

Do not:
- invent project time;
- publish or reconstruct secrets/tokens/passwords;
- run production changes;
- change nginx/Xray/TERA2/UFW/DNS from recovery alone;
- repeat old sudo or host provisioning automatically;
- infer provider entitlement/billing/API validity;
- infer Telegram live-send permission;
- create or alter canonical policy;
- perform destructive cleanup;
- use stale host evidence as fresh runtime truth.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: безопасный cold-start replacement SIS
СТАТУС: replacement_initiation_candidate_pending_independent_verification