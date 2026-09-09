# СИСАДМИН — self-snapshot после первого operational-instance pilot ОСС

## Назначение

Это authoritative self-snapshot текущего SIS state после terminal PASS controlled repair ОСС v0.7 и первого operational instance `ent:KOO`. Автор snapshot: текущий authoritative current-writer SIS.

## Текущее подтверждённое состояние

- SIS initiation: `initiation_verified` до текущего checkpoint; initiation update включён в этот пакет, потому что прежний initiation materially stale относительно operational pilot.
- Controlled repair ОСС v0.7: terminal `PASS`.
- Current release: `/opt/wb-oss-sandbox/releases/sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`.
- `wb-oss-sandbox.service`: `active`, `enabled`.
- Listener: только `127.0.0.1:18081`.
- Daemon count: `1`.
- `/health/ready`: `live=true`, `ready=true`, `schema_version=2`, `schema_ok=true`, `file_field_ok=true`, `disk_ok=true`.
- Production/public ingress в рамках этих работ не включались.

## Operational instance KOO

- Entity: `ent:KOO`.
- Instance: `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06`.
- Lifecycle: `active`.
- Entity count после pilot: `1`.
- Instance count после pilot: `1`.
- Writer grants: `0`.
- Additional entities: `0`.

Exact authority refs pilot:

- `instance.register`: `auth:b58c2050-edf8-4362-b82d-5de105410e4e`.
- `initiation.recovery_basis`: `auth:d3121cba-348a-4d5a-9ecf-742ae9aaae3a`.
- `instance.activate`: `auth:60f39a1b-a9a1-4635-9867-bac9f96e6460`.

Repaired bootstrap authority, сохранённая из terminal repair state:

- `auth:22fbf632-7101-4b33-8af9-ec2f9afcbfc0`.
- scope после repair: `entity:ent:KOO`.
- audit transition repair: `tr:a816aa9d-ede1-4c99-85f4-967f85fdd087`.

## Credential boundary

- Credential ID: `cred:3965c40b-2aa6-4d44-867f-5ad5491fb294`.
- Locator: `/home/pev5691/.config/wb-oss/koo-pilot.json`.
- Owner: `pev5691` (UID/GID `1000:1000`, подтверждено host readback).
- Mode: `0600`.
- Current file size: `137` bytes.
- Raw token, secret material и содержимое credential file в recovery package не включены.
- Recovery boundary: наличие locator не заменяет secret recovery; при утрате credential требуется отдельная разрешённая процедура, а не реконструкция token из snapshot.

## Readback / audit evidence

После pilot SIS независимо подтвердил operational HTTP read-path с credential без вывода token:

- `GET /api/v1/state?entity_id=ent:KOO` → HTTP `200`;
- state содержит `ent:KOO` и active instance `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06`;
- writer grants → `[]`;
- `GET /api/v1/audit?limit=20` → HTTP `200`;
- audit содержит события `instance.register` и `instance.activate`.

КООРДИНАТОР затем принял SIS receipt и независимо подтвердил runtime/release/listener/credential-file boundary. `KOO_instance_operational_acceptance: ACCEPTED`; внутреннее использование Stage A разрешено только в принятой границе.

## Backup / recoverability

До controlled repair v0.7 был создан и проверен safety backup:
`/var/backups/wb-oss-sandbox/pre-repair-29d07687ad65-29882b76-6f67-4770-8c41-70378e81ae47`.
Его manifest сообщал DB SHA-256 `c9792cf8a16b8b8bacc11b329917db10a8f89104bfbdfa47270793a00670d744`, schema version 2, SQLite integrity `ok`.

Этот backup предшествует operational-instance pilot и **не является текущим terminal operational snapshot**. Новый backup runtime/state ради preservation checkpoint не создавался, поскольку checkpoint не даёт authority менять runtime только ради сохранения.

## Open / parked / unknown

- Open: безопасный client helper, читающий credential-file внутри host без переноса secret в argv/чат.
- Parked: первый реальный межсущностный workflow на существующей работе `КООПЕРАЦИЯ` до завершения helper/checkpoint boundary.
- Unknown: внешний immutable locator именно этого нового post-operational recovery package до публикации АРХИВАРИУСОМ.
- Unknown: completion receipt внешней publication/readback этого пакета до действий АРХИВАРИУСА.

## Writer-state и безопасный следующий шаг

`current_writer_state: SIS authoritative current-writer active`.

Один безопасный следующий шаг: передать этот self-preservation package АРХИВАРИУСУ для composition/provenance/integrity check, external publication и immutable readback. Новую runtime-задачу до этого checkpoint не запускать.
