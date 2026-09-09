# KOO urgent replacement recovery candidate manifest

## Composition

- `KOO__initiation-current__KOO.md`
- `KOO__snapshot__KOO.md`
- `KOO__preservation-handoff__ARH.md`
- `SOURCES.md`
- `MANIFEST.md`
- `sha256sums.txt`

## Recovery rule

This directory is a current-writer candidate only until ARH validates and publishes it to canonical `entities/koo/recovery/current` with an immutable commit and readback receipt.

The canonical recovery object is the Git directory tree + immutable commit + blobs + SHA-256 map. Any archive is optional transport convenience only.

## Secret boundary

No raw credential/token/secret material is intentionally included.

---
entity: KOO
artifact_role: recovery-manifest
status: candidate_for_ARH
project_time: generated_without_trusted_project_time
