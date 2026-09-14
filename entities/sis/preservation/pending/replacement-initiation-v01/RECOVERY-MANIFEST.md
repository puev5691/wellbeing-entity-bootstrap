# SIS replacement initiation recovery manifest v01

status: candidate_pending_independent_verification
entity: SIS / СИСАДМИН
canonical_recovery_replaced: no
current_writer_transfer: no
practical_reinitiation: not_performed
production_mutation: no
secrets_credentials_included: no
project_time: omitted; trusted project-time source not used

## Package role

This package is an ARH external replacement-initiation overlay. It does not replace SIS-authored accepted base recovery and is not a foreign self-snapshot.

Base recovery:
`puev5691/wellbeing-entity-bootstrap@861645789d206db19e5135a6771564660d99158f:entities/sis/recovery/current`

## Composition

- `SIS__emergency-initiation-master.md`
- `SIS__current-delta.md`
- `SIS__experience-resume.md`
- `SOURCES.md`
- `RECOVERY-MANIFEST.md`
- `sha256sums.txt`

## Integrity contract

`sha256sums.txt` binds exact UTF-8 bytes of the first five files.
No newline normalization is permitted during verification.
Verify after immutable publication/readback.

## Authority boundary

This package may support replacement SIS cold-start only after independent KOO verification and explicit OPERATOR replacement decision.

It does not authorize:
- production mutation;
- live Telegram send/public webhook;
- credential creation/publication;
- provider-side execution;
- firewall/nginx/Xray/TERA2/UFW/DNS mutation;
- destructive cleanup;
- writer transfer by package presence.

## Known open state at creation

- Telegram Phase1B: `WAITING_OPERATOR_EXACT_HUMAN_ACTION_RECEIVED`.
- Historical exact sudo step exists but execution is not evidenced in this package.
- Entity Runner: host/runtime readiness accepted, provider prerequisites external.
- VPN/Hiddify experience merge/runbook: accepted.
- ARH sender-registry reconciliation route to SIS: no exact SIS receipt found.
- Last SIS-authored HQ commit found: `55b97e90fa0ab7d6b978b31f95c6115d3947cd41`.

## Required independent verification

KOO should verify:
1. base recovery locator and historical acceptance;
2. package composition;
3. exact checksums and immutable readback;
4. provenance of each delta identity;
5. absence of newer competing/current-writer SIS evidence;
6. whether practical replacement initiation is permitted.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: manifest replacement SIS initiation candidate
СТАТУС: candidate_pending_independent_verification