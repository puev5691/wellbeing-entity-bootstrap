# RED replacement initiation current r0.1

status: `RECOVERY_INITIATION_BASIS`
entity: `RED / РЕДАКТОР`
writer_transfer: `none`
project_time: omitted; trusted project-time source not used

## Cold-start basis

Before profile work, replacement RED must load the active approved Project Sources and verify this exact external recovery version.

Authoritative RED-owned initiation procedure:
- repository: `puev5691/wellbeing-hq`
- path: `entities/redaktor/current/recovery/RED__replacement-initiation-procedure-r01.md`
- commit: `be6ab103a585f52d2133a6b57874765951ccb6f4`
- blob: `5b47dd8f6ef731622ec3e31c55272b4521e8077c`

Authoritative RED-owned self-snapshot:
- path: `entities/redaktor/current/recovery/RED__self-snapshot-r01.md`
- commit: `e1706f28d2ff8253cf705d1c6833fda53ca503f1`
- blob: `8cd01299fa06ab3ea42811ec1729affc6665922b`

Mandatory order: fresh HQ preflight → active Project Sources → exact recovery locator/composition/version verification → exact HQ snapshot/procedure blob verification → evidence-tail reconciliation → one initiation status (`initiation_verified`, `initiation_loaded_external_unverified`, or `initiation_failed`) → separate writer decision/gate.

Do not replay historical tasks automatically. Do not infer dispatch as receipt or acceptance. Do not establish current-writer from recovery availability alone.

---
WHO: ARH / АРХИВАРИУС
PURPOSE: externally preserved RED cold-start basis without foreign self-state reconstruction
