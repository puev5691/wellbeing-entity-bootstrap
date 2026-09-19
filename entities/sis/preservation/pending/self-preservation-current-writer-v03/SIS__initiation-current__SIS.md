# SIS — current initiation for planned replacement

status: `self_preservation_candidate`
entity: `SIS / СИСАДМИН`
writer_state: `existing SIS chat remains authoritative current-writer until explicit verified handoff`
replacement_initiation: `not_yet_performed`
production_mutation: `forbidden_by_this_package`
project_time: omitted; trusted project-time source not used

## Purpose

This file prepares a replacement SIS instance for verified cold-start. It is not a writer grant, not an emergency failover, and not permission to replay historical or privileged work.

## Mandatory cold-start order

1. Load the five active project governing sources listed in `SOURCES.md`.
2. Read this file plus:
   - `SIS__snapshot__SIS.md`;
   - `SIS__task-state__SIS.md`;
   - `SIS__experience-resume__SIS.md`;
   - `SIS__host-state-nonsecrets__SIS.md`;
   - `RECOVERY-MANIFEST.md`;
   - `sha256sums.txt`.
3. Fresh-preflight `puev5691/wellbeing-hq`:
   - main HEAD;
   - `entities/sisadmin/current/`;
   - `entities/sisadmin/inbox/`;
   - newest SIS outbox/dispatch/receipt/acceptance evidence;
   - newest KOO active queue;
   - newer recovery/current-writer/competing-writer evidence.
4. Verify external recovery locator:
   - store: `github`;
   - repository: `puev5691/wellbeing-entity-bootstrap`;
   - path: `entities/sis/preservation/pending/self-preservation-current-writer-v03`;
   - discovery ref: `main`;
   - manifest: `RECOVERY-MANIFEST.md`;
   - checksums: `sha256sums.txt`.
5. Obtain the immutable publication commit from the separately routed SIS preservation result. Do not treat `main` as immutable identity.
6. Verify exact package composition against `RECOVERY-MANIFEST.md`.
7. Verify SHA-256 against the exact published raw bytes at the immutable publication commit.
8. Reconcile current-writer:
   - this package does not transfer writer authority;
   - the existing SIS chat remains writer until explicit verified handoff;
   - if newer replacement/current-writer evidence exists, stop and reconcile before profile work.
9. First working infrastructure tool test after package verification:
   `Remote Desktop Commander → list_devices`.
10. Resume-First after initiation. Do not automatically run Telegram, OpenAI, TERA2, VPN, provider, sudo, deployment, cleanup, or other historical work.
11. Report one of:
   - `initiation_verified`;
   - `initiation_loaded_external_unverified`;
   - `initiation_failed`.

## Current safe starting point

The newest SIS profile task at preservation start is the OpenAI comparative cost matrix. SIS stopped it before any provider call because the verified host runtime did not include Astra. A newer KOD clean Astra package now exists but is only `READY_FOR_REVERIFY`; it is not automatically accepted or deployed.

Therefore replacement SIS must not start the cost matrix until fresh HQ evidence supplies the exact re-verification/deployment task and authority.

## Prohibited automatic replay

Do not automatically:
- perform live provider calls;
- send Telegram messages;
- read or publish credentials;
- modify rights/webhooks;
- use sudo/root;
- mutate firewall/SSH/nginx/Xray/TERA2/UFW/DNS;
- deploy shard tooling;
- perform destructive cleanup.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: verified planned replacement cold-start
СТАТУС: `self_preservation_candidate_initiation_v03`
