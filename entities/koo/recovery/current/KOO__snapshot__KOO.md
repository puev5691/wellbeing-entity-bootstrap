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

КООРДИНАТОР остаётся authoritative current-writer только собственного KOO self-state. АРХИВАРИУС должен принимать, проверять и публиковать KOO-authored state, но не реконструировать его.

## 4. Завершённый OSS v0.6 recovery repair

Canonical exact v0.6 executable recovery repaired:

- artifact: `KOD_entity-env-sandbox-v06_KOO.tar.gz`;
- size: `109510`;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Git blob: `93f1208d60b058867a4fde4df61689785d216e17`;
- canonical repair commit: `48a8aa581147cfe1c0560e46a2edee291ed371e8`.

SIS current recovery publication:

`950f01dc5cdb56c3ea63ba540c4e72eda24973bb`

SIS fresh external recovery verification:

`initiation_verified`

Recovery-blocker закрыт до перехода к deployment work.

## 5. Deployable Stage A bundle

КОДЕР подготовил deployable bundle поверх accepted v0.6 без изменения core semantics.

Accepted Stage A bundle:

`KOD_OSS-v06-stageA-deploy-bundle-v01_KOO.tar.gz`

Identity:

- size: `245271`;
- SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- Git-compatible blob: `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`;
- root checksum map: `64/64 OK`;
- embedded core checksum map: `47/47 OK`.

KOO independently accepted bundle for target-host staging.

## 6. Target host и staging

Target:

`uk.wbnetrus.ru` / `185.39.19.240`

Stage A listener:

`127.0.0.1:18081`

Host-local staging verification SIS:

`PASS`

Confirmed runtime:

Python `3.12.3`.

Smoke:

- exit `0`;
- `/health/live`: PASS;
- `/health/ready`: PASS;
- bootstrap smoke: PASS;
- restart persistence: PASS;
- anonymous protected endpoint denied;
- backup/restore: PASS;
- SQLite integrity: `ok`;
- public listener: false.

## 7. Bootstrap authority decision ОПЕРАТОРА

ОПЕРАТОР явно утвердил:

- bootstrap principal: `operator_admin`;
- first Entity: `ent:KOO`;
- no automatic writer grant.

После этого KOO выдал SIS отдельную persistent installation/bootstrap/activation task.

## 8. Persistent Stage A result

SIS выполнил persistent installation/bootstrap/systemd activation.

Подтверждённые mechanics:

- release: `/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- persistent state: `/var/lib/wb-oss-sandbox`;
- config/evidence: `/etc/wb-oss-sandbox`;
- backup root: `/var/backups/wb-oss-sandbox`;
- service: `wb-oss-sandbox.service`;
- listener: `127.0.0.1:18081`;
- service active/enabled;
- health live/ready PASS;
- `operator_admin` created;
- `ent:KOO` created;
- writer grants: `0`;
- no nginx/Xray/TERA2/UFW/DNS/public ingress changes.

Persistent install mechanics:

`PASS`

Но operational acceptance не выдан.

## 9. Critical authority-scope defect

При independent KOO readback обнаружено semantic widening:

Verified evidence для first Entity содержит scope:

`entity:ent:KOO`

Но stored bootstrap authority имеет scope:

`entity:*`

Affected authority:

`auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`

КООРДИНАТОР отдельно воспроизвёл на exact accepted v0.6 core, что эта broad authority позволяет зарегистрировать другую Entity при evidence, разрешающем только `ent:KOO`.

Defect:

`evidence_scope_widening`

Severity:

`critical`

## 10. Operational consequence

`stageA_operational_acceptance: BLOCKED`

До repair запрещено:

- регистрировать дополнительные Entities;
- создавать KOO operational instance/credential;
- выдавать writer grants;
- использовать defective broad authority для project actions;
- открывать public ingress;
- объявлять production.

Текущая БД не содержит additional Entities, KOO instances или writer grants по последней подтверждённой проверке.

## 11. Corrective task KOD

KOO выдал КОДЕРУ:

`KOO__OSS-v06-bootstrap-authority-scope-defect__KOD.md`

Publication commit:

`73bd9e699def33b7d1d0f61b9fa22807223b104d`

Требуется:

- corrected implementation;
- regression + adversarial tests;
- deterministic repair contract;
- никакой real-host mutation со стороны KOD.

## 12. Interface incident / durable state lesson

В ходе deployment один ответ SIS исчез из conversational UI после generation failure, хотя significant report и Git commit существовали.

Проверяемый вывод для KOO continuity:

- chat output не является durable project state;
- значимые результаты должны существовать file-first / commit-first;
- исчезновение сообщения не означает автоматически потерю artifact;
- recovery должен опираться на exact external artifacts, а не на наличие bubble в интерфейсе.

Это operational lesson, а не новая Project Source norm.

## 13. Writer-state

`KOO authoritative current-writer / coordination active / Stage A operational acceptance blocked on authority defect`.

## 14. Open

1. KOD corrected result по authority scope.
2. Independent KOO review corrected revision.
3. Separate SIS state-repair task only after KOO PASS.
4. Post-repair host readback.
5. Новое решение Stage A operational acceptance.

## 15. Deferred / parked

- additional Entities;
- KOO operational instance/credential;
- writer grant/election;
- public ingress/TLS/DNS;
- production;
- ChatGPT bridge;
- continuity/memory/experience implementation;
- unrelated recovery campaigns.

## 16. Следующий безопасный шаг

> Получить corrected KOD result и независимо проверить его. Не выдавать SIS host-repair task до отдельного KOO PASS.

---
entity: KOO
artifact_role: recovery_snapshot
status: current_writer_candidate_for_ARH_acceptance
recovery_schema: v1.4
stageA_operational_acceptance: BLOCKED
production_allowed: no
project_time: generated_without_trusted_project_time
