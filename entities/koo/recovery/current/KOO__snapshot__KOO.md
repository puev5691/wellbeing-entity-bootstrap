# КООРДИНАТОР: self-snapshot после первого persistent Stage A запуска ОСС и authority-defect

## Краткий смысл

Этот self-snapshot создан authoritative current-writer текущего экземпляра КООРДИНАТОРА после существенного изменения рабочего состояния: ОСС v0.6 была доведена до persistent Stage A на реальном host, после чего независимая проверка КООРДИНАТОРА выявила критический дефект расширения authority scope в bootstrap первой Сущности.

Snapshot фиксирует состояние КООРДИНАТОРА до исправления дефекта и не объявляет Stage A operationally accepted.

## 1. Active Project Sources

Текущий checkpoint опирается на подтверждённые active Project Sources:

- `project-instructions-core-v2_1-approved.md` — SHA-256 `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`;
- `entity-roles-short-v2_2-approved.md` — SHA-256 `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d`;
- `file-work-canon-universal-v2_3-approved.md` — SHA-256 `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`;
- `entity-state-preservation-and-recovery-canon-v1_4-approved.md` — SHA-256 `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda`;
- `source-loading-policy-v2-approved.md` — SHA-256 `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`.

Нового approved source-change в этом checkpoint не зафиксировано.

## 2. Предыдущий внешний recovery KOO стал stale

Текущий внешний `entities/koo/recovery/current/KOO__snapshot__KOO.md` всё ещё фиксирует состояние до штатной передачи preservation/recovery АРХИВАРИУСУ и до real-host preflight ОСС.

Текущие `KOO__initiation-current__KOO.md`, `KOO__priority-board__KOO.md` и `MANIFEST.md` также описывают этап `real-host preflight` как будущий и потому больше не отражают фактический current-state.

Причина checkpoint: существенное изменение current-state КООРДИНАТОРА и появление нового критического blocker после реального Stage A запуска.

## 3. Preservation/recovery governance

АРХИВАРИУС принял process ownership preservation/recovery по recovery v1.4.

Post-OSS-v0.6 checkpoint ARH завершён и принят КООРДИНАТОРОМ:

- ARH immutable publication commit: `afe6d7d3d03288a1e56c927ea9924268f0696ebd`;
- KOO acceptance commit: `1f9c73ee6bf3125d55641c3dad9157eb1937a1b1`;
- ARH preservation state: `current_and_externally_verified`;
- fresh ARH initiation test этим checkpoint не требовался.

КООРДИНАТОР остаётся authoritative current-writer только собственного KOO self-state. АРХИВАРИУС должен принимать, проверять и публиковать этот self-state, но не переписывать его содержательно.

## 4. OSS v0.6 recovery repair и Stage A

Canonical repaired v0.6 executable:

- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Git blob: `93f1208d60b058867a4fde4df61689785d216e17`;
- repair commit: `48a8aa581147cfe1c0560e46a2edee291ed371e8`.

SIS recovery:

- immutable publication: `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`;
- fresh verification: `initiation_verified`.

Deployable Stage A bundle:

- SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- Git blob: `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`;
- root checksums: `64/64 OK`;
- embedded core: exact accepted v0.6.

Host-local staging на `uk.wbnetrus.ru`: `PASS`.

## 5. Persistent Stage A deployment

ОПЕРАТОР утвердил bootstrap principal и первую Сущность:

- principal: `operator_admin`;
- first Entity: `ent:KOO`.

SIS выполнил persistent install/bootstrap/systemd activation.

Подтверждённое runtime состояние:

- immutable release: `/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- service: `wb-oss-sandbox.service`;
- listener: `127.0.0.1:18081`;
- `/health/live`: PASS;
- `/health/ready`: PASS;
- service enabled/active;
- public listener: no;
- writer grants: `0`;
- production: no.

Persistent mechanics сами по себе не означают operational acceptance.

## 6. Critical authority defect

После bootstrap КООРДИНАТОР независимо проверил authority semantics и обнаружил:

- verified evidence scope: `entity:ent:KOO`;
- stored bootstrap authority scope: `entity:*`;
- affected authority ref: `auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`;
- defect class: `evidence_scope_widening`.

В isolated reproduction exact accepted core v0.6 позволил holder `ent:KOO` зарегистрировать другую Entity, хотя evidence authorizes только `entity:ent:KOO`.

Следствие:

`stageA_operational_acceptance: BLOCKED`

До исправления:

- не регистрировать дополнительные Entities;
- не создавать operational instance/credential KOO;
- не выдавать writer grants;
- не использовать broad first-Entity authority для новых project actions;
- не открывать public ingress;
- production запрещён.

## 7. Corrective KOD task

КООРДИНАТОР выдал КОДЕРУ corrective task:

`KOO__OSS-v06-bootstrap-authority-scope-defect__KOD.md`

Publication commit:

`73bd9e699def33b7d1d0f61b9fa22807223b104d`

Требуемый результат: corrected core/revision, regression/adversarial tests и deterministic repair contract без самовольной host mutation.

## 8. Current writer-state

`KOO authoritative current-writer for own self-state; coordination active; Stage A operational acceptance blocked`.

## 9. Open / deferred / unknown

Open:

- получить corrected KOD result;
- независимо проверить correction;
- только после PASS выдать отдельную SIS host-repair task;
- после repair повторно решить Stage A operational acceptance.

Deferred:

- additional Entities;
- KOO operational instance/credential onboarding;
- writer grant/election;
- public ingress/TLS/DNS;
- production;
- ChatGPT bridge;
- continuity/memory/experience implementation.

Unknown не повышается реконструкцией.

## 10. Следующий безопасный шаг

> Получить corrected KOD result и выполнить независимый KOO review. Не выдавать SIS host-repair task раньше этого PASS.

---
entity: KOO
artifact_role: recovery_snapshot
status: current_snapshot_candidate_for_ARH_publication
recovery_schema: v1.4
stageA_operational_acceptance: BLOCKED
production_allowed: no
project_time: generated_without_trusted_project_time
