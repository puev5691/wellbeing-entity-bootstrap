# SIS → KOO: Telegram Phase 1B bounded privileged runtime recovery r0.1

verdict: `BLOCKED_PHASE1B_RUNTIME_RECOVERY_AUTHORITY_GAP: ACCEPTED_RUNTIME_LAUNCHER_MISSING_FROM_HOST_AND_NOT_PRESENT_IN_THREADING_FIX_R02_PACKAGE`
execution_mode: `BOUNDED_PRIVILEGED_RUNTIME_RECOVERY_R01`
operator_authority: `AUTHORIZE_PHASE1B_BOUNDED_PRIVILEGED_RUNTIME_RECOVERY_R01`
provider/live_telegram_calls: 0
credential_reads_uses_creates: 0
privileged_mutation_performed: 0
project_time: omitted

## Человеческий смысл

Fresh host readback показал, что прежний privilege blocker действительно снят новым OPERATOR разрешением, но до privileged mutation обнаружен более ранний точный structural blocker.

Принятый sandbox namespace существует, service principal существует, systemd unit существует и остаётся disabled/inactive. Но exact runtime directory
`/opt/wellbeing/telegram-phase1b-runtime-r01`
сейчас пуст.

Существующий systemd unit запускает:
`/opt/wellbeing/telegram-phase1b-runtime-r01/runtime_app.py`.

Файл `runtime_app.py` отсутствует.

Принятый threading-fix r0.2 package
`entities/koder/outbox/telegram-media-phase1b-threading-fix-r02/`
commit `62f82c3322f28adc55b47b1a7064fccb23e4c351`
tree `2c8301c211315a695166188bd69ab4c91be95836`
не содержит `runtime_app.py` и не содержит systemd unit. Он содержит исправленные gateway/privacy/cleanup bytes поверх ранее принятого runtime lineage.

Текущее отдельное разрешение ОПЕРАТОРА разрешает установить exact threading-fix r0.2 bytes в существующий runtime path, но не даёт явного разрешения восстанавливать отсутствующий companion launcher `runtime_app.py` из более раннего runtime-r01 package.

Без launcher exact accepted service не может быть запущен честно. Подмена launcher/path или молчаливое добавление более раннего package вне явного scope была бы расширением authority.

Поэтому исполнение остановлено до mutation.

## Fresh GitHub preflight

Fresh HQ HEAD observed:
`0f190092fb1938e4298b3e6ee4e5d71e823cd8e8`.

Current accepted technical basis independently read:
- threading fix r0.2 package commit/tree exact;
- SIS independent threading PASS:
  `PASS_SIS_THREADING_FIX_R02_VERIFIED`;
- last host/runtime terminal:
  `BLOCKED_PRIVILEGE_REQUIRED`.

Historical
`/home/pev5691/sis-phase1b-tooling/phase1b-host-gate-once.sh`
was not executed or reused.

## Fresh host readback

Host:
`ruvds-xnqc6`.

Service principal:
`wellbeing-tg-p1b`
exists with expected system identity shape.

Existing accepted namespace:
- `/opt/wellbeing/telegram-phase1b-runtime-r01`: directory exists, currently no runtime files;
- `/etc/wellbeing/telegram-phase1b`: exists;
- `/var/lib/wellbeing/telegram-phase1b-sandbox`: exists;
- `/etc/systemd/system/wellbeing-telegram-phase1b-sandbox.service`: exists.

Current runtime state:
- `runtime.json`: absent;
- `gateway.sqlite3`: absent;
- unit: loaded, disabled, inactive/dead;
- listener 127.0.0.1:8782: absent;
- Apport: active.

Existing unit exact launcher:
`/usr/bin/python3 /opt/wellbeing/telegram-phase1b-runtime-r01/runtime_app.py --config /etc/wellbeing/telegram-phase1b/runtime.json --listen-host 127.0.0.1 --listen-port 8782 --transport fake`.

Unit SHA-256:
`41e6e1dbd571ffe1140e3d4613b2c7df525c41b187077591cd2ef8d943f9463e`.

Resume-aware historical v2 script still exists with expected SHA-256:
`1208ff4e123afcd407115c476c549b7c24730624dc2e01bd0c2751ad448e9d3d`,
but it was not executed because this task explicitly forbids historical provisioning replay.

## Why no privileged action was attempted

The new authority is sufficient to recreate:
- runtime.json;
- exact DB path;
- ownership/modes;
- install exact threading-fix package bytes.

It is not sufficient to invent or substitute the missing launcher.

The exact threading-fix package contains no `runtime_app.py`.

Therefore any privileged run would stop before a valid exact service start anyway, or would require importing bytes from the older runtime-r01 package under an authority not explicitly granted in this exact step.

Fail-closed result is required before mutation.

## Required next dependency

KOO should ask OPERATOR for one minimal scope clarification/extension:

authorize restoring the byte-identical accepted companion runtime files required by the existing unit from:
`entities/koder/outbox/telegram-media-phase1b-runtime-r01/`
commit `b939a238f757be0bcfaf1bb4164b0362eafc088f`
tree `23724102ecdc35c42d48eaaeeeae126dff978cb9`,
while overlaying the independently verified threading-fix r0.2 bytes for files superseded by that package.

No new namespace/service principal/unit design is needed.

After that exact extension SIS can perform one bounded privileged recovery/test/cleanup pass under the already stated Phase 1B boundaries.

## Boundary accounting

Historical provisioning replay: 0.
Privileged mutation: 0.
Live Telegram/API calls: 0.
Real credential read/use/create: 0.
Public webhook: 0.
Production: 0.
nginx/Xray/UFW/DNS mutation: 0.
Unrelated host work: 0.

## Terminal result

`BLOCKED_PHASE1B_RUNTIME_RECOVERY_AUTHORITY_GAP: ACCEPTED_RUNTIME_LAUNCHER_MISSING_FROM_HOST_AND_NOT_PRESENT_IN_THREADING_FIX_R02_PACKAGE`

---
КТО: replacement SIS / СИСАДМИН
ДЛЯ ЧЕГО: fresh bounded Phase 1B runtime-recovery preflight under new OPERATOR authority
СТАТУС: exact authority/scope blocker before mutation
