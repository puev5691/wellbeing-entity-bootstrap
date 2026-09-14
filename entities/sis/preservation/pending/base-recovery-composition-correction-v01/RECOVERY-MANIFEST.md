# SIS base recovery composition correction v01 — manifest

status: CORRECTED_BASE_RECOVERY_COMPOSITION_CANDIDATE_PENDING_KOO_REVERIFICATION
entity: SIS / СИСАДМИН
current_writer_transfer: not_performed
practical_replacement_initiation: blocked_until_koo_reverification
production_mutation: no
project_time: omitted; trusted project-time source not used

## Purpose

This package supplies a non-history-rewriting composition boundary for the accepted historical SIS base recovery after KOO proved that the physical historical directory contains an undeclared `artifacts/` subtree.

## Correction package composition

This correction package contains exactly five files:

1. `COMPOSITION-CORRECTION.md`
2. `RECOVERY-MANIFEST.md`
3. `SOURCES.md`
4. `raw-source-sha256.txt`
5. `sha256sums.txt`

No other file is part of this correction package.

## Corrected authoritative SIS base recovery set

The corrected authoritative base is a reference set, not a rewritten SIS snapshot.

Source locator:
`puev5691/wellbeing-entity-bootstrap@861645789d206db19e5135a6771564660d99158f:entities/sis/recovery/current`

Exactly these five historical files are members of the authoritative base set:

1. `SIS__snapshot__SIS.md`
2. `SIS__initiation-current__SIS.md`
3. `SIS__preservation-handoff__ARH.md`
4. `SIS__recovery-manifest__SIS.md`
5. `sha256sums.txt`

The historical `artifacts/` subtree is excluded provenance. It remains immutable in history but is not recovery payload and must not be replayed or interpreted as current work.

## Verification contract

1. Verify this correction directory contains exactly the five files listed under Correction package composition.
2. Verify `sha256sums.txt` against the exact raw Git blob bytes of the first four correction files.
3. Verify the exact blob identities and exact raw-byte SHA-256 values of the five referenced historical base files against `COMPOSITION-CORRECTION.md` and `raw-source-sha256.txt`.
4. Do not enumerate the historical physical directory as the corrected recovery payload; use only the explicit five-member reference set above.
5. Treat the historical `artifacts/` subtree as excluded provenance.
6. Fresh-scan `puev5691/wellbeing-hq` for newer SIS/KOO/ARH state.
7. Require independent KOO re-verification before practical replacement SIS initiation or current-writer transfer.

## Authority boundary

This ARH candidate corrects recovery composition metadata only. It does not alter SIS-authored self-state bytes, does not promote candidate material to canon, and does not authorize production mutation, secrets use, old sudo replay, Telegram/public webhook traffic, provider-side execution, or infrastructure mutation.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: задать точный recovery payload поверх исторического каталога с лишним artifacts/
СТАТУС: corrected_base_recovery_composition_candidate_pending_koo_reverification
