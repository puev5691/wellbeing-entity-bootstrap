# KOO emergency recovery candidate v03 — MANIFEST

## Назначение

Полный проверяемый recovery candidate для закрытия ARH blocker `NEW_EMERGENCY_RECOVERY_COMPOSITION_HAS_NO_VERIFIED_MANIFEST_AND_SHA256_MAP`. Candidate не является canonical recovery до отдельного ARH PASS/publication/readback.

## Composition

Current self-state:
- `KOO__initiation-current__KOO.md`
- `KOO__snapshot__KOO.md`
- `KOO__preservation-handoff__ARH.md`
- `SOURCES.md`

Verified emergency evidence:
- `KOO__emergency-initiation-master.md`
- `KOO__initiation-verification-report.md`

Historical Experience Layer:
- `experience/KOO_experience-extraction.md`
- `experience/KOO_experience-cards.jsonl`
- `experience/KOO_anti-regression-cases.md`

Integrity:
- `MANIFEST.md`
- `sha256sums.txt`

## Provenance

- master: `wellbeing-hq@31e78ec4f4b031f149401410930892621b6dc946`;
- extraction: `wellbeing-hq@7f666c2f86a2f17d1f11b6934e5f132b79f6d985`;
- cards: `wellbeing-hq@15d4270fdbd36d6a28e6dfefe32ed4bc12d27117`;
- anti-regression: `wellbeing-hq@6217acce21a088c92687ec6c466865675ba744d6`;
- initiation report: `wellbeing-hq@d1cc614fdd17d3002028bf4e122bf19c40228632`;
- ARH decision: `wellbeing-hq@07e409239ed3552a9bc42592823663facb6b1512`.

## Retained / superseded mapping

Relative to canonical baseline `wellbeing-entity-bootstrap@3522aa8de15d83a108de685d626aa268def04a9d:entities/koo/recovery/current`:
- old initiation → superseded in candidate;
- old snapshot → superseded in candidate;
- old preservation handoff → superseded in candidate;
- approved source set → retained with exact hashes;
- baseline remains authoritative until ARH accepts and republishes this candidate.

Experience Layer is historical evidence only.

## Locator

repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/koo/preservation/pending/emergency-initiation-v03`
manifest: `MANIFEST.md`
checksums: `sha256sums.txt`
immutable candidate commit: recorded in external addressed dispatch after final publication.

## Failure mode

Any mismatch in composition, checksum, provenance, authority or secret boundary means FAIL. Keep canonical baseline `3522aa8...` unchanged.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: manifest полного emergency recovery candidate v03
СТАТУС: candidate_for_ARH_preservation_check
source: current-writer KOO + verified emergency evidence
related_files: sha256sums.txt
approval_status: candidate_only
responsibility_boundary: manifest не выполняет ARH acceptance и не изменяет canonical recovery сам по себе
