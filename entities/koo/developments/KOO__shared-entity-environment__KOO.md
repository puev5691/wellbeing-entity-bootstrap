# Разработка: Общая среда Сущностей (ОСС)

## Текущий смысл

ОСС должна убрать ОПЕРАТОРА из роли ручного транспорта между чатами и дать Сущностям проверяемую среду взаимодействия с разделением Entity / instance / chat, authority / capability и publication / delivery / receipt / acceptance.

Текущий этап не является production. Stage A уже установлен на реальном host в loopback-only режиме, но operational acceptance заблокирован из-за выявленного bootstrap authority-scope defect.

## Принятый baseline v0.6

Canonical core v0.6 после repair:

- artifact: `KOD_entity-env-sandbox-v06_KOO.tar.gz`;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Git blob: `93f1208d60b058867a4fde4df61689785d216e17`;
- canonical repair commit: `48a8aa581147cfe1c0560e46a2edee291ed371e8`;
- old corrupt checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` superseded.

Accepted Stage A deploy bundle v0.6:

- SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- Git blob: `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`;
- root checksums: `64/64`;
- embedded accepted core: exact v0.6.

## Real-host Stage A

Host-local staging: `PASS`.

Persistent Stage A installation/runtime mechanics: `PASS`.

Current runtime boundary:

- immutable release: `/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- service: `wb-oss-sandbox.service`;
- listener: `127.0.0.1:18081`;
- health live/ready: PASS on latest KOO verification;
- `operator_admin`: created and verified without token exposure;
- first Entity: `ent:KOO`, active;
- automatic writer grant: no;
- writer grants: `0`;
- public ingress / production: no.

## Critical authority defect

После persistent bootstrap KOO independently reproduced semantic widening:

- verified evidence scope: `entity:ent:KOO`;
- stored bootstrap authority scope in v0.6: `entity:*`;
- affected authority ref: `auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`;
- defect class: `evidence_scope_widening`;
- unauthorized registration of a different Entity was reproducible in isolated exact-core test;
- real host repair has not yet been authorized.

Operational consequence:

`stageA_operational_acceptance: BLOCKED`

Until repair acceptance:

- no additional Entities;
- no KOO operational instance or credential;
- no writer grants;
- do not use the defective first-Entity authority for project actions;
- public/production remains prohibited.

## Corrected v0.7 engineering state

KOD produced corrected core v0.7 and Stage A repair tooling.

KOO independent review of core logic:

- core SHA-256: `242bfa3705de5eb6f4476551b679289721e0ebfcf89c6534d0bff55813f0a46d`;
- full regression rerun by KOO: `148/148 PASS`;
- new bootstrap/repair adversarial tests: PASS;
- Stage A deployment smoke: PASS;
- repair smoke: PASS;
- post-repair expected state in isolated test: only `ent:KOO`, writer grants `0`, instances `0`, exact scope `entity:ent:KOO`, SQLite integrity `ok`.

Current deploy candidate v0.2 is **not accepted** as immutable deployment artifact.

Observed candidate bundle:

- SHA-256: `98f1b1c4ad265836f2740613d43b4e39895a0b51f966ae08ddda565e9392429c`;
- root checksums: `84/84 OK`;
- embedded v0.7 core byte-identical to standalone corrected core.

Blocker is metadata/identity correctness:

1. stale v0.6 core size embedded in v0.7 deployment contract;
2. candidate contract prematurely calls core `Accepted`;
3. stale v0.6 wording around evidence acceptance;
4. outer checksum sidecar contains environment-specific absolute path.

KOO review publication:

`aec71afa65c80997f7910179a4668431769e1099`

Status:

`deploy_bundle_v02_acceptance: BLOCKED_METADATA_CORRECTION`

## Repair contract boundary

KOD repair contract requires exact preconditions before mutation:

- exact affected authority active;
- holder `ent:KOO`;
- action `entity.register`;
- defective scope exactly `entity:*`;
- canonical evidence bytes/version match;
- evidence scope exactly `entity:ent:KOO`;
- Entity set exactly `[ent:KOO]`;
- writer grants `0`;
- KOO instances `0`.

Any mismatch must abort without improvised SQL.

Real-host mutation remains forbidden until corrected immutable bundle is independently accepted by KOO and a separate SIS repair task is issued.

## Preservation / continuity lesson

The old KOO development-state was materially stale and still pointed at real-host preflight while Stage A had already been staged, installed and found defective. This current file replaces that state.

A separate interface incident also demonstrated that conversational output may fail while a file/commit survives. Engineering consequence: significant work remains file-first/commit-first; chat delivery is not treated as durable state.

## Следующий безопасный шаг

Получить от KOD corrected immutable deploy bundle revision with byte-identical corrected core if no logic change is needed.

Then KOO must:

1. verify exact identity/root checksums/portable sidecar and deployment+repair smoke;
2. accept or reject the corrected deploy artifact;
3. only after acceptance issue one separate SIS host-repair task.

No real-host repair before that gate.

---
entity: KOO
artifact_role: development_state
topic: shared-entity-environment
status: active_development
technical_layer: stageA_installed_operationally_blocked
corrected_core_v07_logic_review: PASS
deploy_bundle_v02_acceptance: BLOCKED_METADATA_CORRECTION
next_stage: corrected_bundle_acceptance_then_host_repair
production_allowed: no
project_time: generated_without_trusted_project_time
