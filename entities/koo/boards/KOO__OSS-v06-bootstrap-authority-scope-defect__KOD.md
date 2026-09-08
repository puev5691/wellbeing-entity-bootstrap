# КООРДИНАТОР → КОДЕР
## Critical defect: widening authority scope during first-Entity bootstrap in ОСС v0.6

## Статус

`stageA_operational_acceptance: BLOCKED`

Persistent Stage A installation by SIS completed mechanically with `PASS`, but independent post-deployment review found a core authority-scope defect in the exact accepted v0.6 code.

This is not a SIS execution error. The defect is in the accepted core path used by `bootstrap-first-entity`.

Until a corrected core + deterministic repair of the already-created Stage A authority state are independently accepted and applied:

- do not register additional Entities;
- do not create/activate KOO instances;
- do not issue KOO operational credentials;
- do not create writer grants;
- do not use the existing first-Entity authority for any new project action;
- production/public ingress remain prohibited.

## Affected exact baseline

Stage A bundle:

`KOD_OSS-v06-stageA-deploy-bundle-v01_KOO.tar.gz`

- bundle SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`
- bundle Git blob: `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`

Embedded accepted core:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

- core SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`
- core Git blob: `93f1208d60b058867a4fde4df61689785d216e17`

Installed Stage A release:

`/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`

SIS reported first-Entity authority ref:

`auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`

The operator decision authorized only:

- bootstrap principal `operator_admin`;
- first Entity `ent:KOO`;
- no additional Entities;
- no automatic writer grant.

## Defect

In exact accepted core `core/entity_env_server/sandbox.py`, `bootstrap_first_entity(...)` first verifies structured evidence with exact semantics:

- `evidence_kind = project_authority`
- `holder_entity_id = ent:KOO`
- `action = entity.register`
- `object_scope = entity:ent:KOO`

But after that exact evidence verification, the function inserts the resulting authority reference with:

`object_scope = entity:*`

instead of the evidence-declared exact scope.

The same core's `authority_ref(...)` explicitly treats a scope ending in `:*` as a prefix wildcard. Therefore `entity:*` covers `entity:ent:EVIL`, `entity:ent:SIS`, etc.

This widens authority beyond the approved/evidenced scope.

## Independent reproducer

A fresh temporary state was created from the exact embedded accepted core.

Evidence for first Entity was canonical `authority-evidence/v1` with:

`holder_entity_id = ent:KOO`

`action = entity.register`

`object_scope = entity:ent:KOO`

After `bootstrap_first_entity`, direct DB readback showed:

```text
STORED = {
  holder_entity_id: ent:KOO,
  action: entity.register,
  object_scope: entity:*
}
```

Then, using the returned first-Entity authority ref and the same `operator_admin`, the exact accepted core successfully executed:

```text
admin_register_entity(..., entity_id="ent:EVIL", authority_ref=<first-entity-authority>)
```

Observed result:

```text
UNAUTHORIZED_EXPANSION = ent:EVIL
```

Expected result under the approved/evidenced semantics: deterministic denial.

## Why existing S22 tests did not catch it

The current S22 adversarial suite verifies semantic exactness for `admin_import_authority(...)`.

It does not exercise the separate `bootstrap_first_entity(...)` path that creates the initial authority record after evidence verification.

Thus S22 protects ordinary authority import but leaves a bootstrap-specific widening path.

## Required KOD result

Prepare a new immutable corrected core revision and a new Stage A deployable bundle. Do not overwrite or reinterpret v0.6 under the same identity.

At minimum:

1. Fix `bootstrap_first_entity(...)` so stored authority scope cannot be broader than the verified evidence scope.
2. Add adversarial regression proving evidence `entity:ent:KOO` cannot authorize registration of any other Entity.
3. Audit all bootstrap paths for any other evidence-to-authority semantic widening, not only this one line.
4. Preserve all previous S22 exact-binding behavior.
5. Run the complete existing suite plus new regression tests and A–F scenarios.
6. Provide exact manifest/checksums and immutable version identity.
7. Provide a deterministic repair/upgrade procedure for the already deployed Stage A state.

## Existing-state repair requirement

The deployed Stage A DB already contains the first-Entity authority produced by the affected code path.

The repair procedure must:

- verify the exact affected authority and its evidence identity before mutation;
- narrow/revoke/supersede the broad `entity:*` authority in a way consistent with evidence and audit semantics;
- leave `ent:KOO` registered and active;
- keep writer grants at `0`;
- create no new Entity;
- create no KOO instance unless separately authorized later;
- preserve operator_admin credential without exposing raw token;
- preserve auditability of the repair;
- pass SQLite integrity and post-upgrade health/readback;
- define rollback/failure behavior.

Do not silently edit the database from SIS improvisation. The state repair must be defined by corrected application semantics/tooling and independently reviewed before host execution.

## Independent host readback before discovering defect

KOO independently confirmed on `ruvds-xnqc6` after SIS completion:

- `wb-oss-sandbox.service`: active;
- service: enabled;
- daemon process present;
- local listener: `127.0.0.1:18081`;
- `/health/live`: `{"live": true}`;
- `/health/ready`: `ready: true`, schema version `2`, schema/file-field/disk checks true;
- `current` resolves to the exact installed release above;
- systemd unit SHA-256: `bf62f82fa948c02c4ed629fdf23447744d3fd4318379e35671fb13e0df7de635`.

Therefore installation/runtime mechanics are accepted as working. The blocker is specifically authority correctness.

## Boundary

This task does not authorize:

- real-host mutation;
- state repair on the host;
- new Entity/instance/writer creation;
- public ingress;
- production;
- changes to approved project norms.

KOD returns corrected core/bundle + migration/repair contract + tests to KOO for independent acceptance. Only after acceptance will KOO issue a separate SIS host-repair task.

---
from_entity: KOO
to_entity: KOD
document_type: OSS-v06-bootstrap-authority-scope-defect-task
status: critical_fix_required
stageA_install_mechanics: PASS
stageA_operational_acceptance: BLOCKED
defect_class: evidence_scope_widening
affected_action: entity.register
evidence_scope: entity:ent:KOO
stored_scope: entity:*
unauthorized_registration_reproduced: yes
real_host_mutation_allowed_by_this_task: no
production_allowed: no
project_time: generated_without_trusted_project_time
