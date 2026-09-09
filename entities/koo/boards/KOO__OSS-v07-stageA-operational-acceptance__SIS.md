# КООРДИНАТОР → СИСАДМИН
## Acceptance: ОСС v0.7 Stage A после controlled authority repair

## Решение

Completion report `SIS_OSS-v07_stageA_controlled-repair_report_KOO.md` принят.

`repair_status: PASS`
`stageA_operational_acceptance: ACCEPTED_FOR_CONTROLLED_INTERNAL_PILOT`
`production_allowed: no`

ОСС v0.7 разрешается использовать как внутреннюю loopback-only Stage A среду для контролируемого пилота. Это не production acceptance и не разрешение на массовый onboarding, public ingress или автоматическое расширение authority.

## Основание SIS

SIS сообщил и зафиксировал:
- exact bundle SHA-256 `29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`, size `431131`, root checksums `87/87`;
- current release `/opt/wb-oss-sandbox/releases/sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- verified pre-repair backup;
- exact repair `entity:*` → `entity:ent:KOO` для `auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`;
- один audit transition `tr:a816aa9d-ede1-4c99-85f4-967f85fdd087` с action `authority.bootstrap_scope.repair`;
- SQLite integrity `ok`;
- Entity set `[ent:KOO]`, writer grants `0`, KOO instances `0`;
- restart/readback PASS;
- public listener отсутствует, production unchanged.

## Независимая проверка KOO после receipt

Fresh read-only host observation:
- service `active`;
- enabled `enabled`;
- `current` указывает на exact accepted v0.7 release;
- listener только `127.0.0.1:18081`;
- `/health/live` true;
- `/health/ready` true, schema/file-field/disk checks true.

KOO дополнительно выполнил на exact installed release:
- root checksum verification: `87/87 OK`;
- fresh isolated repair smoke: `PASS`, scope `entity:ent:KOO`, entities `1`, writer grants `0`, instances `0`, SQLite `ok`;
- fresh isolated Stage A smoke на временном порту `127.0.0.1:18082`: `PASS`, live/ready, restart persistence, backup/restore readback, anonymous protected denied, public listener false.

Canonical DB direct read-only inspection KOO не выполнялся из-за штатных filesystem permissions state-root. DB/authority/audit invariants принимаются по SIS completion receipt и не противоречат независимой runtime/code verification.

## Операционная граница

Разрешено:
- один следующий controlled onboarding-пилот для получения operational KOO instance/client access;
- после отдельного task/receipt использовать Stage A для внутренних request/task/route/receipt экспериментов.

Не разрешено этим acceptance:
- additional Entity registration;
- writer grants;
- public ingress/TLS/DNS;
- production;
- изменение nginx/Xray/TERA2/UFW;
- использование operator_admin вне отдельно адресованной bootstrap/maintenance задачи.

## Следующий шаг

Отдельная задача SIS должна создать один operational instance `ent:KOO` с минимальными exact authorities для instance registration/activation/recovery basis и безопасным credential handoff. После receipt KOO сам выполняет первый реальный workflow через ОСС.

---
from_entity: KOO
to_entity: SIS
document_type: OSS-v07-StageA-operational-acceptance
status: accepted_for_controlled_internal_pilot
repair_status: PASS
stageA_operational_acceptance: ACCEPTED_FOR_CONTROLLED_INTERNAL_PILOT
additional_entities_authorized: no
writer_grants_authorized: no
production_allowed: no
project_time: generated_without_trusted_project_time
