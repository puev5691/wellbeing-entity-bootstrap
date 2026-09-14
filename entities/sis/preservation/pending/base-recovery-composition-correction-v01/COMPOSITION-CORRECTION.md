# SIS base recovery composition correction v01

status: CORRECTED_BASE_RECOVERY_COMPOSITION_CANDIDATE_PENDING_KOO_REVERIFICATION
entity: SIS / СИСАДМИН
practical_replacement_initiation: blocked_until_koo_reverification
current_writer_transfer: not_performed
production_mutation: no
project_time: omitted; trusted project-time source not used

## Contradiction being corrected

Historical accepted SIS base locator:
`puev5691/wellbeing-entity-bootstrap@861645789d206db19e5135a6771564660d99158f:entities/sis/recovery/current`.

The SIS-authored manifest declares a five-file recovery package:
1. `SIS__snapshot__SIS.md`
2. `SIS__initiation-current__SIS.md`
3. `SIS__preservation-handoff__ARH.md`
4. `SIS__recovery-manifest__SIS.md`
5. `sha256sums.txt`

The immutable directory also contains `artifacts/`, which is outside that declared package composition. KOO independent verification therefore returned `FAIL_BASE_RECOVERY_COMPOSITION_MISMATCH`.

## Non-history-rewriting correction boundary

The historical locator, files, blobs, checksum table and KOO acceptance remain unchanged provenance.

For replacement recovery, the authoritative SIS base payload is now defined only as the following exact immutable references at commit `861645789d206db19e5135a6771564660d99158f`:

- `SIS__snapshot__SIS.md` — blob `48f6b4a5e2d6b8f06fae76742b66669fe4c418dc`
- `SIS__initiation-current__SIS.md` — blob `52524bb8047bcc599de9920a7568198a0c0e0966`
- `SIS__preservation-handoff__ARH.md` — blob `a96703fa203d5cb76a29e3c597a318ca4c6c18f9`
- `SIS__recovery-manifest__SIS.md` — blob `dcedf329ff3ca14dd625c387b00faf118702be21`
- `sha256sums.txt` — blob `b6a1c2a28562239772dff0f598bb508ac8d4d650`

No other path under the historical directory is part of the corrected authoritative recovery payload.

## Explicit treatment of historical artifacts/

The following historical files remain immutable evidence/provenance and are explicitly excluded from replacement recovery execution, task replay, authority reconstruction and current-state loading:

- `artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz` — blob `93f1208d60b058867a4fde4df61689785d216e17`
- `artifacts/KOO__OSS-v06-exact-binary-transport__SIS.md` — blob `0f87a21a05e3e9785cc039e4a37d4d7c4b790a0b`
- `artifacts/SIS__OSS-real-host-preflight-report-verified__KOO.md` — blob `0ded9d9197ff372c16b9d73446ec3b71dcd2c0a3`
- `artifacts/SIS__OSS-v06-recovery-artifact-integrity-blocker__KOO.md` — blob `9ce1c9e1d321631c1dd2834ab036435fc49d5858`

In particular, the old exact-binary transport task is historical evidence only and MUST NOT be replayed.

## Integrity rule

`raw-source-sha256.txt` records SHA-256 over the exact immutable source bytes for the five referenced base files. The four SIS-authored Markdown hashes were independently verified by KOO against raw Git blob bytes. The checksum-table file hash is over its exact published bytes.

`sha256sums.txt` in this correction package covers the four substantive correction files. Post-publication verification must use exact Git blob bytes with no LF insertion/removal, CRLF conversion or text normalization.

## Authority boundary

This correction does not edit or reconstruct SIS self-state. It does not create a new SIS current-writer, does not perform practical replacement initiation, does not authorize replay of the historical sudo action, Telegram traffic, public webhook, provider-side execution, credentials, nginx/Xray/TERA2/UFW/DNS mutation, production mutation or destructive cleanup.

Only KOO independent re-verification may clear the composition blocker for the next recovery boundary.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: исправить состав accepted SIS base recovery без переписывания SIS self-state или истории
СТАТУС: corrected_base_recovery_composition_candidate_pending_koo_reverification
