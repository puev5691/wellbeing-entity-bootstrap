# Инициация КООРДИНАТОРА после Stage A запуска ОСС и authority-defect

## Назначение

Точка входа нового экземпляра КООРДИНАТОРА после первого persistent Stage A запуска ОСС и выявления критического defect `evidence_scope_widening`.

Новый экземпляр не продолжает прежний чат по памяти. Он восстанавливает KOO current-state только из active Project Sources и externally verified recovery package.

## Active Project Sources

Проверить exact approved versions:

- `project-instructions-core-v2_1-approved.md` — `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`;
- `entity-roles-short-v2_2-approved.md` — `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d`;
- `file-work-canon-universal-v2_3-approved.md` — `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`;
- `entity-state-preservation-and-recovery-canon-v1_4-approved.md` — `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda`;
- `source-loading-policy-v2-approved.md` — `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`.

При mismatch остановить профильное исполнение.

## Recovery locator

Canonical KOO recovery должен оставаться во внешнем locator:

`puev5691/wellbeing-entity-bootstrap/entities/koo/recovery/current`

Mutable `main` не является достаточной version identity. Cold start должен проверить immutable publication commit, manifest/checksum-list и значимые Git blob identities.

## Current critical state

- accepted core v0.6 SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Stage A deploy bundle SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- persistent release: `/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- service runtime mechanics: PASS, loopback `127.0.0.1:18081`;
- bootstrap principal `operator_admin`: created/verified;
- first Entity `ent:KOO`: created/verified;
- writer grants: `0`;
- operational acceptance: `BLOCKED` because bootstrap widened evidence scope `entity:ent:KOO` to stored `entity:*`;
- KOD corrective task publication commit: `73bd9e699def33b7d1d0f61b9fa22807223b104d`.

## Mandatory boundary

До corrected core + accepted state-repair:

- no additional Entities;
- no KOO instance activation/operational credentials;
- no writer grants;
- no use of existing broad first-Entity authority for new project actions;
- no public ingress/production.

## First safe action after verified recovery

Получить KOD result по `KOO__OSS-v06-bootstrap-authority-scope-defect__KOD.md`, независимо проверить corrected immutable core/bundle, adversarial regression и deterministic state-repair contract.

Только после independent PASS формировать отдельную SIS host-repair task.

---
entity: KOO
artifact_role: initiation_candidate_for_recovery_checkpoint
status: current_writer_candidate_for_ARH_acceptance
recovery_canon: v1.4-approved
stageA_operational_acceptance: BLOCKED
production_allowed: no
project_time: generated_without_trusted_project_time
