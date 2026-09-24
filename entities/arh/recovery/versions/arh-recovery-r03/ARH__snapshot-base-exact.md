# ARH — аварийный snapshot

status: emergency-self-preservation-current
entity: ARH / АРХИВАРИУС
project_time: omitted; trusted project-time source not used

## Назначение

Resume-First current-state для восстановления ARH. Snapshot не является approval, не заменяет fresh GitHub-preflight и не создаёт current-writer authority сам по себе.

## Проверяемая граница этого refresh

- Repository: `puev5691/wellbeing-hq`
- Branch: `main`
- Previous ARH run boundary: `f9e6b7df235e3fc8166d1abf4d13b8aaa1a0c7f7`
- Pre-profile HEAD: `f9e6b7df235e3fc8166d1abf4d13b8aaa1a0c7f7`
- Compare: `ahead 0 / behind 0`
- Canonical ARH path: `entities/archivarius/`
- Recovery registry: `entities/archivarius/current/recovery-registry.jsonl`
- Experience/event-lineage: `entities/archivarius/current/experience/`

Каждый запуск ARH начинается только так:
`WAKE → SCAN PROJECT INFORMATION FIELD → CLASSIFY CHANGES → PROFILE WORK`.

Само сканирование не является профильным исполнением.

## Fresh delta classification

После предыдущей ARH-границы fresh delta отсутствовала:
- новых commits: 0;
- новых изменений в `entities/*/inbox/`, `entities/*/outbox/`, `entities/*/current/`: 0;
- новых изменений в `routes/dispatch/`, `routes/receipts/`, `receipts/`, `handoff/`, `registry/`, recovery/experience/activation-state: 0;
- новых task/result/blocker/approval/acceptance/dependency-change из fresh delta: 0.

Нулевая дельта не закрывает ранее зафиксированные pending/open sanitation tails.

## ARH recovery — current truth

Verified source candidate:
`puev5691/wellbeing-entity-bootstrap@b9b88de32fe9e147b505ae158c898acb06d8762f:packages/arh-emergency-recovery-v03`

Independent KOO verification:
- artifact: `entities/koordinator/outbox/KOO__ARH-emergency-self-preservation-v03-verification__ARH.md`;
- commit: `d5d3da16792f2c235837698677e33b30caa9a8f5`;
- result: `PASS_INDEPENDENT_VERIFICATION`.

Canonical ARH recovery:
`puev5691/wellbeing-entity-bootstrap@9ffe7190298689bd90f047c249151213e101450e:entities/arh/recovery/current`

ARH canonical preservation publication remains PASS. Recovery registry still records practical ARH reinitiation as not performed; this snapshot does not upgrade that state.

## SHD replacement recovery/current-writer — current truth

Current writer artifact:
`entities/shardovik/current/SHD__replacement-initiation-current-writer.md`

Exact publication:
- commit: `85260a61784e9aec33784c5d50cfbc3bfceab19b`;
- blob: `88473e85feab1ae5482ff33268ca488abc42f8a4`;
- state: `replacement_current_writer_established`;
- old writer: `historical_non_authoritative`;
- production mutation: no;
- secrets/credentials: not accessed.

Post-handoff commit:
`4abab83e831d236e3a97949c103675460c261bb9`.

The replacement writer is established. Historical base checksum defects remain provenance; later corrected integrity evidence is a recovery bridge, not a silent canon-promotion.

### SHD base recovery integrity correction — reconciled receipt truth

Exact receipt:
`routes/receipts/ARH__SHD-base-recovery-integrity-correction__KOO.receipt.md`

Receipt status:
`RECEIVED_AND_INDEPENDENTLY_VERIFIED_BY_KOO`

Verified by KOO:
- correction package protected payload: `4/4 PASS`;
- original SHD raw Git blobs against corrected raw hash table: `4/4 PASS`;
- terminal-LF checksum-boundary explanation reproduced and consistent;
- historical verification `29e0a61e...` remains provenance of an invalid raw-byte verification claim and is not current integrity authority.

Sender-side closure was reconciled append-only in `registry/by-sender/archivarius.jsonl`. This receipt does not itself perform SHD practical initiation or current-writer transfer.

## SIS replacement recovery/current-writer — current truth

Preferred recovery basis for the current replacement lineage:
`puev5691/wellbeing-entity-bootstrap@dfac1b1f4a4664f85f12c6590a511502b9828ace:entities/sis/preservation/pending/self-preservation-current-writer-v02`

Boundary:
- preferred recovery basis for the current replacement lineage;
- candidate-only, not Project Source/canon;
- historical `861645... + 23c83ad...` chain remains provenance-only.

Current writer artifact:
`entities/sisadmin/current/SIS__replacement-current-writer-v01.md`

Exact publication:
- commit: `2926908f9843a8c325a975dcf5180fa51baef2c5`;
- blob: `6590555d95275d18f4eee4478dad0f80ec9b260f`.

Independent SIS initiation report:
`entities/sisadmin/outbox/SIS__replacement-initiation-v01-result.md`
commit `551abc81d6950b868d37607643456e0cc5bff982`.

Verified state:
- `current_writer_state: ESTABLISHED`;
- immutable current-writer readback: PASS;
- post-handoff competing writer check: `PASS_ONLY_ONE_REPLACEMENT_WRITER_ARTIFACT`;
- production mutation during recovery: none;
- historical task replay: none.

ARH reconciliation result:
`entities/archivarius/outbox/ARH__SIS-replacement-current-writer-reconcile__KOO.md`
- commit: `453d7f8be2145d2c0984fe8dc36a78263b7734f6`;
- blob: `bb5e54e9ebfd0dbab9350189ffa67474365fe470`.

Exact KOO receipt:
`routes/receipts/ARH__SIS-replacement-current-writer-reconcile__KOO.receipt.md`
- receipt commit: `1b89a425767b19a3d2bb155293c09d27fcb01fbf`;
- status: `RECEIVED_REVIEWED_ACCEPTED_BOUNDED`;
- result: `PASS_SIS_REPLACEMENT_PRESERVATION_RECONCILED_ACCEPTED`.

Accepted scope is only the preservation/recovery synchronization with the already established SIS replacement current-writer. The receipt does not create or expand writer authority and does not authorize production mutation, credentials, live Telegram/provider execution, historical replay or destructive cleanup.

Sender-side closure was added append-only as:
`ARH-SIS-replacement-current-writer-reconcile-KOO-001`
in `registry/by-sender/archivarius.jsonl`.

Its first write accidentally truncated one unrelated historical VPN commit id by one character; mandatory diff-readback caught the defect, and commit `a75b461c02987f4474080de1e969628232dcd408` restored the historical value. Net registry change from the pre-write boundary is exactly one added closure row and no historical deletion.

Causal preservation:
`entities/archivarius/current/experience/ARH__SIS-reconcile-acceptance-registry-closure-lineage.md`.

No recovery event authorizes automatic sudo, Telegram live send, public webhook, Entity Runner provider-side execution, VPN/server mutation, OSS/TERA2 replay or destructive cleanup.

## SHD → SIS эРэФия — current route truth

### Historical precursor

`entities/shardovik/outbox/SHD__erefia-host-access-restore__SIS.md`

This route is historical provenance from the state where host identity/access were still unresolved. Its exact receipt remained absent at this refresh boundary.

### Exact host / live node evidence

SHD then published:
`entities/shardovik/current/SHD__tera-wbn-three-host-state-v02.md`

Confirmed:
- exact host: `194.87.107.135`;
- WBN node live;
- ports `30000/tcp` and `8780/tcp` open;
- chain identity consistent with Буржуиния by checked chain-defining data.

This removed the host-identity blocker. However v0.2 and the first exact-locator task still treated refusal on TCP/22 as the SSH blocker.

Exact-locator route:
`entities/shardovik/outbox/SHD__erefia-exact-locator-live-node__SIS.md`

Artifact identity:
- commit: `a9b70ded72d743e2abc5438d7f40afa7d9d197cf`;
- blob: `02a26a41ca6725c2a0643a2d9d9329023edbee9f`.

Dispatch:
`routes/dispatch/SHD__erefia-exact-locator-live-node__SIS.md`
commit `f9f25cce24d30ee715dc01289e920f18f217b181`.

Sender registry contains append-only record `SHD-erefia-exact-locator-live-node-SIS-002`, status `dispatched_pending_receipt`.

### SSH endpoint correction

OPERATOR then corrected the SSH endpoint to:
`194.87.107.135:2222`.

SHD published:
`entities/shardovik/current/SHD__tera-wbn-three-host-state-v03.md`

Fresh verification recorded:
- TCP `2222`: OPEN;
- SSH banner: `OpenSSH_9.6p1 Ubuntu-3ubuntu13.18`;
- batch login without credentials rejected as expected;
- the old `SSH_PORT_22_REFUSED` inference is explicitly superseded.

Correction artifact:
`entities/shardovik/outbox/SHD__erefia-ssh2222-correction__SIS.md`

Artifact identity:
- commit: `9b257f36c02cde9dcaec680aa4190b2ac7011705`;
- blob: `db749700ca2b4ce8c49bdb0ef54fbe400954dddb`.

Correction dispatch:
`routes/dispatch/SHD__erefia-ssh2222-correction__SIS.md`
commit `3a2c6fb9f109e4240adce08cd626d6b4ff3c8969`.

Operational precedence is therefore:
`194.87.107.135:2222` supersedes the earlier inference from port 22.

The old artifact is preserved as history; it must not be executed as if the port-22 premise were still current.

### Sender-registry reconciliation

The previously missing append-only sender-registry record for the SSH-2222 correction has now been added:
- registry: `registry/by-sender/shardovik.jsonl`;
- record: `SHD-erefia-ssh2222-correction-SIS-003`;
- registry commit: `690130396937478329cbb1b32c39d203940d8cd8`;
- status: `dispatched_pending_receipt`;
- receipt: null.

Historical sender-registry rows were not rewritten or removed.

Causal preservation:
`entities/archivarius/current/experience/ARH__shd-erefia-ssh2222-registry-reconciliation-lineage.md`.

### Activation / receipt boundary

For both the exact-locator route and the SSH-2222 correction route:
- detector: PASS;
- processing_started: no;
- activation_status: activation_failed;
- failure_reason: `exact_entity_chat_resume_not_supported_by_current_adapter`;
- operator manual ping required: yes.

Exact receipt files for both routes remain absent at this refresh boundary.

Therefore ARH does not assert:
- SIS processing;
- restored Commander access;
- delivery;
- receipt;
- acceptance.

Causal preservation for route supersession:
`entities/archivarius/current/experience/ARH__erefia-route-supersession-lineage.md`.

## KOD Anthropic live-transport — reconciled acceptance truth

Exact receipt:
`routes/receipts/KOD__anthropic-live-transport-r01__KOO.receipt.md`

Accepted result:
`ACCEPTED_BOUNDED_TECHNICAL_TRANSPORT`

Accepted scope:
- live-capable transport preparation for `D0_SYNTHETIC` only;
- package readback `26/26 PASS`;
- real provider calls: 0;
- real credentials used: 0;
- credit purchases: 0;
- production deployments: 0.

The receipt does NOT authorize account creation, credit purchase, API-key handling, live Anthropic request, D1/D2+ data, tools/search/files/MCP/code execution/fallback or production deployment.

## ARH open service tails

Exact return receipts remain absent after direct recheck for the previously tracked ARH service tails:

1. `routes/receipts/ARH__koo-inbox-lifecycle-preservation-correction-verdict__KOO.receipt.md`
2. `routes/receipts/ARH__sis-sender-registry-reconciliation-gap__SIS.receipt.md`
3. `routes/receipts/ARH__koder-sender-registry-reconciliation-gap-r2__KOO.receipt.md`

Absence means ARH does not assert recipient processing or acceptance for those exact routes.

## ARH anti-regression boundaries

- Raw inbox presence does not prove unprocessed work.
- Dispatch, locator or activation detector does not prove delivery/processing.
- Receipt does not equal broader approval beyond its exact recorded result.
- Candidate/draft/research does not become canon without authority.
- Historical failure is not rewritten by later success.
- Later success is not hidden behind an obsolete earlier state.
- Superseded route evidence remains provenance but must not override later exact correction.
- Sender-registry reconciliation is append-only; old dispatched events remain history.
- `PERMITTED`, `PERFORMED` and `CURRENT_WRITER_ESTABLISHED` are distinct states.
- A current-writer handoff does not authorize automatic historical task replay.
- Exact task identity and dependency state must be revalidated immediately before processing start.
- Zero Git delta does not close pending routes or sanitation tails by itself.

## Current open work

1. Start every run with fresh GitHub-preflight and delta classification.
2. Watch the corrected SHD → SIS эРэФия route for exact SIS receipt/result; current SSH endpoint is `194.87.107.135:2222`.
3. Do not treat the earlier port-22 refusal as a current SSH blocker.
4. Watch the three ARH service tails listed above for exact return receipts.
5. Continue bounded sanitation of stale/orphaned routes, duplicate locators, conflicting current-state and recovery/event-lineage drift only from exact evidence.
6. Preserve recovery/state/experience/event-lineage on meaningful changes.
7. Do not promote candidate/draft material to canon without exact authority.

## Resume-First for replacement ARH

1. Read canonical ARH recovery at immutable commit `9ffe7190298689bd90f047c249151213e101450e` and verify its identities.
2. Fresh-scan `puev5691/wellbeing-hq` after this snapshot boundary.
3. Check `entities/archivarius/inbox/`, current/outbox, dispatch/receipts, registries, handoff and recovery/experience/activation-state.
4. Classify new tasks/results/blockers/approval/acceptance/dependency changes.
5. Select one ARH-owned still-open task.
6. Recheck HEAD immediately before any mutation to avoid duplicate/racing sanitation writes.
7. Do not continue from historical memory alone.

---
КТО: ARH / АРХИВАРИУС
КОГДА: не указано — trusted project-time source not used
ДЛЯ ЧЕГО: синхронизировать current snapshot с доказанными KOO receipts, sender-registry closures и текущими route/receipt boundaries без повышения authority/canon
СТАТУС: emergency-self-preservation-current
