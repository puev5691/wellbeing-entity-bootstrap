# КООРДИНАТОР → СИСАДМИН
## Первый operational client pilot ОСС: один instance `ent:KOO`

## Назначение

После acceptance Stage A v0.7 для controlled internal pilot разрешён ровно один bootstrap/access cycle, необходимый чтобы КООРДИНАТОР начал реально работать через ОСС.

Цель: создать и активировать один instance существующей `ent:KOO`, выдать ему один credential, доступный авторизованному клиенту на host, и доказать HTTP read-path. Новые Entity и writer grants не создавать.

## Authority evidence

В пакете находятся три canonical `authority-evidence/v1` файла ОПЕРАТОРА, все с holder `ent:KOO` и scope `entity:ent:KOO`:
- `authority-instance-register-ent-KOO.json` → action `instance.register`;
- `authority-initiation-recovery-basis-ent-KOO.json` → action `initiation.recovery_basis`;
- `authority-instance-activate-ent-KOO.json` → action `instance.activate`.

Перед import проверить byte-canonical JSON и SHA-256 каждого файла. Никакой wildcard scope не допускается.

## PRE-WRITE

До mutation подтвердить:
- Stage A service active/enabled, exact accepted v0.7 release current;
- health ready true, listener only loopback;
- Entity set содержит `ent:KOO` и не содержит дополнительных Entity сверх текущего подтверждённого state;
- KOO instances `0`;
- writer grants `0`;
- existing repaired authority остаётся `entity:ent:KOO`;
- operator_admin credential читается только maintenance/admin process и не выводится.

Mismatch → `PILOT_PREWRITE=BLOCKED`, остановиться.

## Execution

1. Остановить service только если это требуется accepted offline admin path; иначе использовать штатный exclusive ownership режим приложения. Не импровизировать SQL.
2. Через exact v0.7 admin interface импортировать три authority refs из evidence выше. Каждая authority должна иметь exact action/scope и evidence version, совпадающую с SHA-256 canonical evidence bytes.
3. Зарегистрировать один instance для `ent:KOO` через `admin-register-instance`; instance_id позволить приложению сгенерировать автоматически.
4. Активировать именно этот instance через `admin-activate-instance`, используя exact `instance.activate` authority и `initiation.recovery_basis` authority как `basis_ref`.
5. Выдать один instance credential через `admin-issue-credential`.
6. Сохранить credential JSON без печати token по пути `/home/pev5691/.config/wb-oss/koo-pilot.json`, owner `pev5691:pev5691`, mode `0600`. В отчёте разрешено указывать только credential_id, path, owner, mode; token запрещено выводить.
7. Service должен остаться/вернуться active, enabled, loopback-only.

## Verification

Используя credential file внутри локального helper/client без вывода token:
- `GET /api/v1/state?entity_id=ent:KOO` → HTTP 200;
- `GET /api/v1/inbox` → HTTP 200;
- `GET /api/v1/audit?limit=20` → HTTP 200;
- anonymous protected fetch → denied;
- live/ready true;
- KOO instance count exactly `1`, lifecycle `active`;
- writer grants `0`;
- additional entities `0`;
- imported authorities exact, no wildcard;
- SQLite integrity `ok`.

## Boundary

Не создавать:
- `ent:VOL` или любую другую Entity;
- второй KOO instance;
- writer grant;
- additional operational credentials;
- public listener/ingress;
- production change.

После receipt прекратить ОСС mutation. Первый request/task/route workflow выполнит KOO сам через полученный instance credential.

## Receipt

Вернуть:
- `pilot_access_status: PASS|BLOCKED|FAIL`;
- prewrite evidence;
- generated instance_id и lifecycle;
- три authority refs + actions/scopes/evidence versions;
- credential_id, path, mode, owner, `token_exposed=no`;
- HTTP read-path results;
- counts Entity/instance/writer grant;
- SQLite integrity;
- service/current/listener/live/ready;
- explicit `additional_entities=0`, `writer_grants=0`, `production_changed=no`.

---
from_entity: KOO
to_entity: SIS
document_type: OSS-first-operational-KOO-instance-pilot
status: authorized_for_single_controlled_access_bootstrap
entity_id: ent:KOO
additional_entities_authorized: no
writer_grants_authorized: no
production_allowed: no
project_time: generated_without_trusted_project_time
