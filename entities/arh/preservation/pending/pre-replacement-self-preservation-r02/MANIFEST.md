# MANIFEST — ARH pre-replacement self-preservation r0.2

status: `candidate_for_independent_verification`
entity: `ARH / АРХИВАРИУС`
source: `current ARH writer self-preservation`
canonical_predecessor: `puev5691/wellbeing-entity-bootstrap@9ffe7190298689bd90f047c249151213e101450e:entities/arh/recovery/current`
previous_candidate: `puev5691/wellbeing-entity-bootstrap@f70b9ed04a98976a9f5e37f69171717fb6d49797:entities/arh/preservation/pending/pre-replacement-self-preservation-r01`
hq_snapshot_boundary: `puev5691/wellbeing-hq@c83bf0e5cb5a38b4ce2d460d3d8d57ab4ff6b727`
project_time: omitted; trusted project-time source not used

## Exact composition

1. `ARH__initiation-current__ARH.md`
2. `ARH__snapshot-current__ARH.md`
3. `ARH__task-state__ARH.md`
4. `ARH__experience-resume__ARH.md`
5. `SOURCES.md`
6. `MANIFEST.md`
7. `sha256sums.txt`

`sha256sums.txt` covers the six content files above except itself.

## Verification contract

- hashes are over final published bytes;
- actual external composition must be exactly seven files;
- independent readback must verify exact immutable commit, blob identities and checksums;
- candidate is not canonical recovery by publication alone;
- candidate does not initiate/retire/freeze ARH;
- candidate does not alter current-writer;
- actual cold-start requires fresh HQ reconciliation from the snapshot boundary and exact KOO verification;
- actual writer handoff requires a separate explicit OPERATOR decision plus freeze/retirement/competing-writer checks.

## External pending locator

repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/arh/preservation/pending/pre-replacement-self-preservation-r02`

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: exact composition/integrity contract for fresh pre-initiation recovery candidate
СТАТУС: `candidate_for_independent_verification`
