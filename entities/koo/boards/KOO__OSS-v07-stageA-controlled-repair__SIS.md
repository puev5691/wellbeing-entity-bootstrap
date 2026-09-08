# КООРДИНАТОР → СИСАДМИН
## Controlled repair task: ОСС v0.7 Stage A bootstrap authority scope

## Назначение и решение

Разрешён один адресный controlled Stage A repair существующего loopback-only sandbox ОСС на host `ruvds-xnqc6` с использованием independently accepted bundle v0.3.

Цель: заменить исполняемый release на corrected v0.7 и детерминированно сузить ровно одну ошибочно расширенную bootstrap-authority с `entity:*` до `entity:ent:KOO`, не создавая новых полномочий или объектов.

Это не production deployment и не разрешение на дальнейший onboarding.

## Accepted artifact

`KOD_OSS-v07-stageA-deploy-bundle-v03_KOO.tar.gz`

- size: `431131` bytes;
- SHA-256: `29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- root checksums: `87/87 OK`;
- embedded core SHA-256: `242bfa3705de5eb6f4476551b679289721e0ebfcf89c6534d0bff55813f0a46d`;
- KOO acceptance commit: `085db5038d24f03b38a9f783d13164265512d4b0`.

Expected new immutable release path:
`/opt/wb-oss-sandbox/releases/sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`

## Preserved pre-repair state

KOO preservation checkpoint externally published/readback-verified at:
`ae0ad1ad9eab2d9bba6f72ade462ff28f50ed162`.

Last read-only host observation before this task:
- service: `active`;
- enabled: `enabled`;
- current release: `/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- listener: only `127.0.0.1:18081`;
- `/health/live`: true;
- `/health/ready`: ready true.

Do not trust these as a substitute for the SIS pre-write gate. Recheck them fresh.

## Exact affected authority

- authority ref: `auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`;
- expected holder: `ent:KOO`;
- issuer kind: `operator`;
- action: `entity.register`;
- defective stored scope: `entity:*`;
- required evidence scope: `entity:ent:KOO`;
- Entity set before repair: exactly `[ent:KOO]`;
- writer grants: `0`;
- KOO instances: `0`.

## PRE-WRITE GATE

До первой persistent mutation вернуть `PREWRITE=PASS` только если одновременно выполнено:

1. Received bundle exact SHA-256 and size match values above.
2. Tar extraction has no unsafe paths or symlink/hardlink surprise; root `SHA256SUMS.txt` verifies `87/87`.
3. Embedded core archive equals SHA-256 `242bfa...a46d`.
4. Host identity is `ruvds-xnqc6`; `/usr/bin/python3` is compatible Python 3.12.x.
5. Existing service/current release/listener/health are recorded fresh.
6. Existing state root, config, credential file and backup root match Stage A contract; admin token is never printed or copied into argv/logs.
7. No planned change touches nginx, Xray, TERA2, UFW, DNS, TLS/public ingress or unrelated services.

Any mismatch: `PREWRITE=BLOCKED`, stop and report. Do not improvise.

## Controlled execution

### 1. Stage accepted release without touching current

Extract the accepted bundle to a temporary root, verify all identities, then install the bundle content as a new immutable release at the exact path above. Do not overwrite the existing v0.6 release.

The release must contain the accepted `deployment/`, `core/`, `REPAIR-CONTRACT.md`, `DEPLOYMENT-CONTRACT.md`, provenance and checksum material. Record installed-tree verification evidence before switching `current`.

### 2. Stop service and create verified pre-repair backup

Record current symlink target and health first, then:

- stop `wb-oss-sandbox.service`;
- using the old/current v0.6 maintenance command, create a new backup under `/var/backups/wb-oss-sandbox/`;
- run `verify-backup` and require PASS;
- preserve backup identity/path in receipt.

If backup verification fails, do not switch release and do not mutate DB.

### 3. Switch only to accepted v0.7 release

Point `/opt/wb-oss-sandbox/current` atomically to:
`/opt/wb-oss-sandbox/releases/sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`.

Do not start service yet.

### 4. Run the application-defined offline repair

Execute exactly the accepted repair operation:

```text
/usr/bin/python3 /opt/wb-oss-sandbox/current/deployment/maintenance.py \
  --root /var/lib/wb-oss-sandbox \
  repair-bootstrap-authority-scope \
  --admin-credential-file /etc/wb-oss-sandbox/credentials/operator-admin.json \
  --authority-ref auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0 \
  --entity-id ent:KOO
```

Do not expose the credential. Do not use ad-hoc SQL.

The command must itself verify exact authority/evidence/version/entity/writer/instance preconditions and return successful JSON showing:
- same authority ref;
- old scope `entity:*`;
- new scope `entity:ent:KOO`;
- active state;
- verified evidence identity.

If preconditions fail, transaction must not narrow any other object. Stop according to failure policy below.

### 5. Post-repair verification before acceptance

Start `wb-oss-sandbox.service` and require all of the following:

- service `active` and remains `enabled`;
- listener only `127.0.0.1:18081`;
- `/health/live` PASS;
- `/health/ready` PASS;
- SQLite `integrity_check=ok`;
- authoritative Entity set exactly `[ent:KOO]`;
- writer grants exactly `0`;
- KOO instances exactly `0`;
- affected authority active with scope exactly `entity:ent:KOO`;
- exactly one relevant audit transition `authority.bootstrap_scope.repair` for that authority;
- anonymous protected file fetch remains denied;
- no public listener.

Restart the service once and repeat service/listener/live/ready plus state invariants above.

Verify the pre-repair backup remains readable. A restore-to-staging check is permitted if it does not mutate canonical state; do not restore canonical DB in this task.

## Failure / rollback boundary

- Before repair transaction commit: on failure, do not mutate DB; if `current` was switched, restore the previous release symlink and restart only after verifying the old release can safely reopen unchanged state.
- If repair committed but post-start verification fails: **do not re-expand authority scope**, do not improvise SQL and do not restore canonical DB automatically. Preserve verified pre-repair backup, exact failure evidence and service state; stop and report to KOO.
- Restoring canonical DB from backup is a separate recovery action requiring separate authorization.

## Explicit prohibitions

This task does **not** authorize:
- registering any additional Entity;
- creating/activating a KOO instance;
- issuing operational KOO credentials;
- creating writer grants;
- importing new authority;
- public ingress, TLS/DNS/nginx/UFW changes;
- production status;
- changes to Xray or TERA2;
- any action after repair other than verification and receipt.

## Required completion receipt

Return one standalone report to KOO containing:

- `repair_status: PASS|BLOCKED|FAIL`;
- exact received bundle SHA/size and installed release path;
- pre-write gate evidence;
- previous and new `current` targets;
- verified backup locator/identity;
- repair JSON with secrets redacted/nonexistent;
- exact authority old/new scope;
- Entity/writer/instance counts;
- audit transition count/identity;
- SQLite integrity;
- service/listener/live/ready before and after restart;
- proof unrelated services/config were not changed;
- explicit `additional_entities=0`, `writer_grants=0`, `production_changed=no`;
- exact failure-mode if not PASS.

After returning the receipt, perform no further ОСС project action until KOO accepts it.

---
from_entity: KOO
to_entity: SIS
document_type: OSS-v07-StageA-controlled-authority-repair-task
status: authorized_for_single_controlled_repair
accepted_bundle_sha256: 29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a
pre_repair_KOO_recovery_commit: ae0ad1ad9eab2d9bba6f72ade462ff28f50ed162
affected_authority_ref: auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0
production_allowed: no
project_time: generated_without_trusted_project_time
