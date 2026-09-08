# КООРДИНАТОР → СИСАДМИН
## Persistent installation, bootstrap и activation Stage A ОСС v0.6

## Решение ОПЕРАТОРА

ОПЕРАТОР явно утвердил для Stage A ОСС:

- bootstrap principal: `operator_admin`;
- первая Сущность: `ent:KOO`.

Это разрешение относится только к Stage A sandbox и не является разрешением production/public deployment.

## Основание

Host-local staging verification на `uk.wbnetrus.ru` завершена со статусом `PASS`.

Проверенный deployable bundle:

`KOD_OSS-v06-stageA-deploy-bundle-v01_KOO.tar.gz`

Exact identity:

- size: `245271` bytes;
- SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- Git-compatible blob SHA-1: `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`.

Embedded accepted core:

- size: `109510` bytes;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Git blob: `93f1208d60b058867a4fde4df61689785d216e17`.

Target runtime уже подтверждён staging-проверкой:

`/usr/bin/python3` → `Python 3.12.3`.

## Цель

Выполнить первый persistent Stage A deployment ОСС на целевом host, создать локальный bootstrap `operator_admin`, зарегистрировать первую Сущность `ent:KOO`, активировать systemd service и подтвердить post-start smoke/readback.

Задача заканчивается completion/failure report КООРДИНАТОРУ. После отчёта остановиться.

## Зафиксированная Stage A схема

Host:

`uk.wbnetrus.ru` / `185.39.19.240`

SSH:

`2222/tcp`

Coordinator listen:

`127.0.0.1:18081`

Persistent paths:

- release: `/opt/wb-oss-sandbox/releases/<immutable-version>/`;
- current symlink: `/opt/wb-oss-sandbox/current`;
- state: `/var/lib/wb-oss-sandbox`;
- config: `/etc/wb-oss-sandbox`;
- credentials: `/etc/wb-oss-sandbox/credentials/`;
- backup root: `/var/backups/wb-oss-sandbox/`.

Runtime identity:

- dedicated system user/group: `wb-oss`;
- state owner: `wb-oss:wb-oss`;
- state mode: `0700`;
- credentials dir mode: `0700`;
- credential files mode: `0600`;
- config root-managed.

Stage A service must remain loopback-only. nginx/Xray/TERA2/UFW/DNS/public TLS/public ingress are outside this task.

## Разрешённая последовательность

### 1. Pre-write gate

Перед любым persistent write повторно подтвердить:

- SIS current initiation status: `initiation_verified`;
- exact bundle size/SHA-256/Git blob;
- bundle checksum map: `64 / 64 OK`;
- embedded core checksum map: `47 / 47 OK`;
- `/usr/bin/python3` is `3.12.x`;
- `127.0.0.1:18081` свободен;
- текущие nginx/Xray/TERA2 listeners и состояния не требуют изменения для loopback Stage A.

При любом mismatch остановиться до persistent write.

### 2. Immutable release installation

Создать новый immutable release directory под:

`/opt/wb-oss-sandbox/releases/<immutable-version>/`

где `<immutable-version>` однозначно связывается с exact bundle identity и не переиспользуется для иных bytes.

Распаковать exact verified bundle в этот release directory.

После распаковки повторно проверить root checksum map `64 / 64 OK`.

Не переписывать release bytes после acceptance. Если требуется исправление, использовать новый immutable release identity.

### 3. Runtime account and persistent roots

Создать dedicated system user/group `wb-oss`, если их ещё нет.

Создать:

- `/var/lib/wb-oss-sandbox`;
- `/etc/wb-oss-sandbox`;
- `/etc/wb-oss-sandbox/credentials`;
- `/var/backups/wb-oss-sandbox`.

Применить permissions согласно deployment contract. Secrets не выводить в report, shell history, repository или recovery package.

### 4. Bootstrap evidence boundary

ОПЕРАТОР утвердил только два semantic результата:

1. локальный bootstrap principal `operator_admin`;
2. первая Сущность `ent:KOO`.

Evidence должен соответствовать accepted core `authority-evidence/v1` и exact semantics core v0.6.

Не изобретать новые authority/action/scope semantics. Использовать только schema/fields/kinds, фактически поддержанные accepted core и deployment adapter.

Если из core contract нельзя однозначно построить evidence для указанного решения ОПЕРАТОРА без дополнительного выбора полномочий/действий/scope, остановиться **до bootstrap** и вернуть точный blocker КООРДИНАТОРУ.

Evidence и raw credentials должны находиться только в защищённом host-local config/credential boundary, не в repository/recovery.

### 5. Offline operator bootstrap

Coordinator service должен быть остановлен.

Выполнить поддержанный adapter command:

`/usr/bin/python3 /opt/wb-oss-sandbox/current/deployment/maintenance.py --root /var/lib/wb-oss-sandbox bootstrap-admin --evidence <protected-bootstrap-evidence-path> --credential-out /etc/wb-oss-sandbox/credentials/operator-admin.json`

Требования:

- raw token не stdout;
- credential file mode `0600`;
- bootstrap result independently read back/verified средствами приложения;
- не создавать writer grant автоматически.

### 6. First Entity bootstrap

При остановленном coordinator выполнить поддержанный adapter command:

`/usr/bin/python3 /opt/wb-oss-sandbox/current/deployment/maintenance.py --root /var/lib/wb-oss-sandbox bootstrap-first-entity --admin-credential-file /etc/wb-oss-sandbox/credentials/operator-admin.json --entity-id ent:KOO --evidence <protected-first-entity-evidence-path>`

Требования:

- фактически создана/зарегистрирована именно `ent:KOO`;
- не создавать writer grant автоматически;
- не выдавать KOO полномочия SIS/ARH/KOD или иные undeclared authority;
- результат readback должен подтверждать exact `entity_id` и только те authority semantics, которые следуют из approved bootstrap evidence.

### 7. Non-secret runtime config

Подготовить systemd environment/config только с non-secret параметрами:

- `OSS_STATE_ROOT=/var/lib/wb-oss-sandbox`;
- `OSS_LISTEN_HOST=127.0.0.1`;
- `OSS_LISTEN_PORT=18081`.

Raw bearer/admin token не помещать в `EnvironmentFile`, argv, unit text или logs.

### 8. systemd installation

Установить systemd unit на основе bundle example/contract.

Обязательные ограничения service:

- `User=wb-oss` / соответствующий runtime group;
- `ExecStart=/usr/bin/python3 /opt/wb-oss-sandbox/current/deployment/daemon.py`;
- loopback-only listener;
- resource limits не слабее ранее принятого host preflight recommendation, если они применимы без изменения app semantics: `MemoryHigh=320M`, `MemoryMax=384M`, `CPUQuota=50%`;
- graceful SIGTERM behavior;
- restart policy не должна создавать второй authoritative coordinator process.

Перед activation проверить unit syntax/config.

### 9. Activation

Выполнить `systemctl daemon-reload`, затем enable/start Stage A service.

Не менять nginx/Xray/TERA2/UFW/DNS/public TLS.

### 10. Post-start verification

Потребовать одновременно:

- service active/running;
- ровно один coordinator process;
- listener только `127.0.0.1:18081`;
- отсутствует `0.0.0.0:18081` и публичный listener;
- `GET /health/live` → HTTP 200, `live:true`;
- `GET /health/ready` → HTTP 200, `ready:true`;
- anonymous protected endpoint → deterministic denial;
- persistent state содержит `operator_admin` bootstrap result и первую Сущность `ent:KOO` согласно поддержанному readback;
- после service restart health остаётся PASS и state сохраняется;
- SQLite integrity → `ok`.

### 11. Backup/readback gate

После успешной activation создать первый verified offline backup Stage A state по deployment contract:

1. stop service;
2. backup;
3. verify-backup;
4. restore-to-staging в отдельный staging root;
5. потребовать `ready:true` / поддержанный readback;
6. снова start service;
7. повторить live/ready.

Не выполнять in-place restore/replacement.

### 12. Completion report

Вернуть КООРДИНАТОРУ один самостоятельный отчёт, содержащий:

- immutable release identity/path;
- installed bundle SHA-256 и Git blob;
- service unit identity;
- system user/group;
- persistent paths/permissions summary;
- bootstrap result без secrets;
- `operator_admin`: created/verified yes/no;
- `ent:KOO`: created/verified yes/no;
- writer grant automatically created: должно быть `no`;
- listener state;
- live/ready;
- restart persistence;
- SQLite integrity;
- backup verify;
- restore-to-staging readback;
- final service status;
- nginx/Xray/TERA2/UFW/DNS unchanged yes/no;
- production_changed: `no`;
- любые отклонения/blockers.

После report остановиться. Не подключать новые Сущности и не расширять authority без новой задачи.

## Failure mode

При любом несовпадении exact bytes/checksums, невозможности однозначно построить supported authority evidence, health/readiness failure, state integrity failure, unexpected public listener или конфликте с существующими host services:

1. прекратить дальнейшее продвижение;
2. не маскировать failure автоматическим обходом;
3. сохранить диагностические данные без secrets;
4. если service уже активирован, безопасно остановить его;
5. не менять nginx/Xray/TERA2/UFW/DNS;
6. вернуть точный blocker КООРДИНАТОРУ.

## Граница решения

Эта задача разрешает persistent **Stage A sandbox installation/bootstrap/activation** только на указанном host.

Она не разрешает:

- production deployment;
- public ingress;
- TLS/DNS integration;
- изменение существующих production-like services;
- регистрацию дополнительных Сущностей;
- writer election/grant;
- изменение approved project norms;
- изменение recovery registry от имени SIS.

---
from_entity: KOO
to_entity: SIS
document_type: OSS-v06-stageA-persistent-install-bootstrap-activation-task
status: ready_for_address_delivery
operator_decision: bootstrap_operator_admin_and_first_entity_ent_KOO_approved
bundle_sha256: e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490
bundle_git_blob: c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6
target_host: uk.wbnetrus.ru
stageA_listener: 127.0.0.1:18081
bootstrap_principal: operator_admin
first_entity: ent:KOO
automatic_writer_grant_allowed: no
public_ingress_allowed: no
production_allowed: no
project_time: generated_without_trusted_project_time
