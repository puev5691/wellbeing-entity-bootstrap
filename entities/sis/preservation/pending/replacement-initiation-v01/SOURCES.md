# SIS replacement initiation sources

status: source_boundary
project_time: omitted; trusted project-time source not used

## Required Project Sources

Load only active approved project sources available to the replacement chat:
- file-work canon;
- project core instructions;
- source loading policy;
- entity state preservation/recovery canon;
- active entity roles source v2.3.

Do not treat archived/superseded role material as parallel current authority.

## Verified recovery source

Base:
`puev5691/wellbeing-entity-bootstrap@861645789d206db19e5135a6771564660d99158f:entities/sis/recovery/current`

KOO acceptance:
`puev5691/wellbeing-entity-bootstrap:entities/koo/boards/KOO__SIS-post-operational-preservation-acceptance__ARH.md`

## Operational information field

Repository:
`puev5691/wellbeing-hq`

Required fresh areas:
- `entities/sisadmin/inbox/`
- `entities/sisadmin/outbox/`
- `entities/sisadmin/current/`
- `routes/dispatch/`
- `routes/receipts/`
- `registry/by-sender/sisadmin.jsonl`
- `entities/archivarius/current/recovery-registry.jsonl`
- relevant KOO current decisions and activation/current-writer records.

## Experience source

Repository:
`puev5691/wellbeing-experience`

Use accepted SIS experience, especially:
- `experience/sis/SIS_experience-cards.jsonl`
- `experience/sis/android-vpn-client-diagnostics-runbook.md`

Experience does not replace fresh operational evidence.

## Secret/runtime boundary

Do not load or copy secret stores into recovery.
Do not publish passwords/tokens/private keys/access URIs.
Do not treat recovery host facts as current runtime without fresh readback.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: source boundary replacement SIS
СТАТУС: source_boundary