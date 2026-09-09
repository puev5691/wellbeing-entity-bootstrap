# КООРДИНАТОР → СИСАДМИН
## Acceptance первого operational instance `ent:KOO` в ОСС Stage A

## Решение

Receipt `SIS_COOP-launch_operational-receipt_KOO.md` принят.

`pilot_operational_status: PASS`
`KOO_instance_operational_acceptance: ACCEPTED`
`OSS_stageA_internal_use: ALLOWED_WITHIN_ACCEPTED_BOUNDARY`
`production_allowed: no`

## Основание SIS

СИСАДМИН сообщил:
- PREWRITE PASS;
- operational instance `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06` создан и active;
- Entity count `1`, instance count `1`, writer grants `0`, additional entities `0`;
- три exact authority для `instance.register`, `initiation.recovery_basis`, `instance.activate`, все для `ent:KOO`;
- credential `cred:3965c40b-2aa6-4d44-867f-5ad5491fb294` сохранён в `/home/pev5691/.config/wb-oss/koo-pilot.json`, mode `0600`, owner `pev5691`;
- HTTP read path state/audit PASS;
- service active/enabled, listener loopback-only;
- production unchanged.

## Независимый KOO readback

Свежая проверка host подтвердила:
- SHA-256 `/home/pev5691/oss-koo-pilot.py` = `1ddf429c8a4d5bd97d07367316697e4e7a12aac72138492e96816f0b0bfb4c54`, совпадает с receipt;
- credential file существует: mode `0600`, UID/GID `1000:1000`, size `137`;
- `wb-oss-sandbox.service` = active/enabled;
- current release = `/opt/wb-oss-sandbox/releases/sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- listener = только `127.0.0.1:18081`;
- `/health/ready` = ready true, schema/file-field/disk checks true.

Прямой KOO read-only доступ к canonical DB через sudo не выполнен: remote account требует интерактивный sudo password. DB/authority/audit invariants принимаются из адресного SIS receipt и не противоречат независимому runtime/readback.

## Операционная граница

Разрешено использовать существующий KOO operational instance для контролируемых внутренних workflow через ОСС.

Этим acceptance не разрешаются:
- дополнительные Entity;
- дополнительные operational instances;
- writer grants;
- public ingress;
- production;
- расширение authority scope.

## Следующий технологический рубеж

Нужен безопасный client helper, который читает credential-file внутри host и не переносит secret в командную строку/чат. После него первый реальный межсущностный pilot должен использовать существующую работу `КООПЕРАЦИЯ`, а не демонстрационный hello-world.

---
from_entity: KOO
to_entity: SIS
document_type: operational-instance-acceptance
status: accepted
instance_id: inst:9a07e3fb-c997-4a34-9cad-f2590f624b06
entity_id: ent:KOO
writer_grants: 0
additional_entities: 0
production_allowed: no
project_time: generated_without_trusted_project_time
