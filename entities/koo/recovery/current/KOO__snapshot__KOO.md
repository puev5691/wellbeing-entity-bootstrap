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

КООРДИНАТОР остаётся authoritative current-writer только собственного KOO self-state. АРХИВАРИУС должен принимать, проверять и публиковать recovery, но не переписывать KOO self-state за current-writer.

## 4. KOD / SIS recovery repair-cycle ОСС v0.6

Canonical exact accepted core v0.6:

- artifact: `KOD_entity-env-sandbox-v06_KOO.tar.gz`;
- size: `109510` bytes;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Git blob: `93f1208d60b058867a4fde4df61689785d216e17`.

Canonical recovery repair completed:

- KOD repair commit: `48a8aa581147cfe1c0560e46a2edee291ed371e8`;
- corrupt checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` superseded and must not be used as executable recovery.

SIS current recovery was published/readback-verified at immutable commit:

`950f01dc5cdb56c3ea63ba540c4e72eda24973bb`

Fresh SIS verification later established:

`initiation_status: initiation_verified`.

## 5. Deployable Stage A bundle

KOD produced deployable adapter/bundle over unchanged accepted core v0.6:

`KOD_OSS-v06-stageA-deploy-bundle-v01_KOO.tar.gz`

Identity:

- size: `245271` bytes;
- SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- Git-compatible blob SHA-1: `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`.

Independent KOO review confirmed bundle safety/integrity, exact embedded core, regression baseline and Stage A smoke behavior.

Host-local staging on `uk.wbnetrus.ru` completed by SIS:

`host_staging_status: PASS`

Confirmed target runtime: Python `3.12.3`, root checksums `64/64`, core checksums `47/47`, loopback listener only, smoke exit `0`.

## 6. ОПЕРАТОР-approved Stage A bootstrap decision

ОПЕРАТОР explicitly approved for Stage A:

- bootstrap principal: `operator_admin`;
- first Entity: `ent:KOO`.

Additional Entities, automatic writer grant, public ingress and production were not approved.

## 7. Persistent Stage A installation/bootstrap/activation

SIS completion report declared:

`stageA_persistent_status: PASS`

Installed immutable release:

`/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`

Key verified results from SIS report:

- `operator_admin`: created/verified;
- `ent:KOO`: created/verified active;
- first-Entity authority ref: `auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`;
- first-Entity evidence ref: `evidence:sha256:f45da959fc2b94d52da7a399b737fea1cb3503af5396902fbbc9109c5de3367f`;
- automatic writer grant: `no`;
- writer grant count: `0`;
- service: `wb-oss-sandbox.service` active/enabled;
- listener: `127.0.0.1:18081`;
- backup/verify and restore-to-staging: PASS;
- SQLite integrity: `ok`;
- production/public integration unchanged.

## 8. Независимый current host readback KOO

После SIS completion КООРДИНАТОР независимо проверил target host через authorized Remote Desktop Commander.

Повторный readback непосредственно перед этим self-snapshot подтвердил:

- `wb-oss-sandbox.service`: `active`;
- unit: `enabled`;
- listener: `127.0.0.1:18081`;
- `/health/live`: `{"live": true}`;
- `/health/ready`: `ready:true`, schema version `2`, schema/file-field/disk checks true;
- current release symlink resolves to exact release `sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`.

Это подтверждает работоспособность installation/runtime mechanics, но не снимает authority blocker ниже.

## 9. Критический authority-defect после запуска

Независимая post-deployment проверка exact accepted core выявила defect класса:

`evidence_scope_widening`

Affected path:

`bootstrap_first_entity(...)`

Verified evidence semantics для первой Entity:

- holder: `ent:KOO`;
- action: `entity.register`;
- object scope: `entity:ent:KOO`.

После evidence verification affected core сохраняет resulting authority с более широким scope:

`entity:*`

В том же core `:*` является prefix wildcard.

Независимый fresh-state reproducer на exact embedded core подтвердил, что returned first-Entity authority позволяет выполнить регистрацию посторонней Entity `ent:EVIL`, хотя evidence разрешала только `entity:ent:KOO`.

Это не считается SIS execution error: дефект находится в exact accepted core path, использованном Stage A bootstrap.

Прямая независимая DB-readback строки authority на real host КООРДИНАТОРОМ в этом checkpoint не выполнялась. Host state был создан affected bootstrap path; application defect и widening independently reproduced на exact core.

## 10. Текущее решение по ОСС

Текущий статус:

- Stage A installation mechanics: `PASS`;
- Stage A runtime mechanics: `PASS`;
- Stage A operational acceptance: `BLOCKED`;
- production: `no`.

До исправления запрещено:

- регистрировать дополнительные Entities;
- создавать/активировать KOO instances;
- выдавать KOO operational credentials;
- создавать writer grants;
- использовать broad first-Entity authority для новых project actions;
- открывать public ingress/production integration.

## 11. KOD corrective task

КООРДИНАТОР создал и опубликовал задачу:

`KOO__OSS-v06-bootstrap-authority-scope-defect__KOD.md`

External publication:

- commit: `73bd9e699def33b7d1d0f61b9fa22807223b104d`;
- blob: `3769fbcd6d081c869f82a9447f6bbe62775116c4`.

KOD должен вернуть новый immutable corrected core/bundle, adversarial regression, audit bootstrap paths и deterministic repair/upgrade procedure для уже созданного Stage A state.

Real-host repair этой задачей KOD не разрешён. После KOD result требуется независимая KOO acceptance, затем отдельная SIS host-repair task.

## 12. Operational lessons

Подтверждены два практических урока, пока не являющихся новой project norm сами по себе:

1. Acceptance suite должна отдельно проверять каждый privilege/authority creation path, включая bootstrap-specific paths. Проверка ordinary import path не доказывает корректность bootstrap path.
2. Внешний conversational safety-layer может не доставить user-visible ответ даже при сохранённом значимом artifact/commit. File-first подход в таком событии сохранил проверяемый результат, когда conversational delivery оказался ненадёжен.

Из второго урока следует рабочая рекомендация для security tasks: явно фиксировать ownership, authorization, defensive purpose, minimum scope и prohibited outcomes, не пытаясь обходить safety mechanisms.

## 13. Другие development-lines

Сформирован рабочий кандидат направления `continuity / memory / experience / development`: связать человеческую память, continuity ИИ-Сущности и institutional memory; предусмотреть verified experience layer для ОСС и recovery-пакет знания для ШКОЛЫ БЛАГОПОЛУЧИЯ.

Это направление не является текущим blocker и не должно отвлекать KOD/SIS от authority repair.

## 14. Current writer-state

`KOO authoritative current-writer for own self-state; OSS Stage A authority correctness blocked pending KOD corrected core/bundle and repair contract`.

КООРДИНАТОР не заменяет KOD в исправлении core и не разрешает SIS импровизированную DB mutation.

## 15. Open / parked / unknown

Open:

- получить KOD corrected immutable core/bundle + tests + repair contract;
- выполнить независимую KOO acceptance;
- после PASS выдать отдельную SIS host-repair/upgrade task;
- после repair выполнить host readback и решить вопрос Stage A operational acceptance.

Parked/deferred:

- public ingress/TLS/DNS integration;
- production;
- ChatGPT bridge до stable Stage A;
- массовое подключение Entities;
- writer grant/election;
- continuity/memory/experience development line до снятия текущего OSS blocker.

Unknown / not yet proven:

- corrected core identity и regression result до возврата KOD;
- exact repair semantics для deployed broad authority до KOD result and KOO acceptance;
- operational acceptance Stage A после repair;
- direct host DB readback exact stored first-Entity scope by KOO in this checkpoint.

## 16. Один безопасный следующий шаг

> Получить от KOD результат по `KOO__OSS-v06-bootstrap-authority-scope-defect__KOD.md` и независимо проверить corrected core/bundle + deterministic state-repair contract. До этого не расширять authority и не продолжать Stage A onboarding.

---
entity: KOO
artifact_role: entity-self-snapshot
status: current_writer_candidate_for_ARH_acceptance
recovery_canon: v1.4-approved
checkpoint_trigger: significant_operational_state_change_and_authority_defect
stageA_install_mechanics: PASS
stageA_operational_acceptance: BLOCKED
writer_state: authoritative_current_writer_for_KOO_self_state
production_allowed: no
project_time: generated_without_trusted_project_time
