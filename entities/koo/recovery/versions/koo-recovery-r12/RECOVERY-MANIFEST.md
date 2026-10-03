# KOO emergency replacement r1.2 recovery manifest

status: EXTERNAL_EMERGENCY_RECOVERY_SUCCESSOR
project_time: omitted

## Purpose

Preserve enough verified state to cold-start a genuinely NEW KOO chat after technical exhaustion of authoritative KOO r1.1.

This package is recovery evidence only.
It does not establish a writer, execute Writer Gate, resume profile work, or mutate Project Sources/canons.

## Recovery lineage

BASE r09:
puev5691/wellbeing-entity-bootstrap@ab4c7ad12db9760fe825d2a93b6467499e1a09f4:
entities/koo/recovery/versions/koo-recovery-r09

DELTA r10:
puev5691/wellbeing-entity-bootstrap@e07047dfce0684638e2164d1712dee06ac313cfc:
entities/koo/recovery/versions/koo-recovery-r10

SUCCESSOR r11:
puev5691/wellbeing-entity-bootstrap@f478b936e4cba58c8a81490463541b6ecd76a4c1:
entities/koo/recovery/versions/koo-recovery-r11

EMERGENCY SUCCESSOR r12:
entities/koo/recovery/versions/koo-recovery-r12

## Exact composition

Required files: 5

1. KOO__predecessor-current-writer-r11.md
2. KOO__human-interface-contract-r02.md
3. KOO__emergency-recovery-delta-r12.md
4. KOO__emergency-replacement-initiation-draft-r12.md
5. RECOVERY-MANIFEST.md

## Exact preserved source identities

Predecessor current-writer source:
puev5691/wellbeing-hq:
entities/koordinator/current/KOO__replacement-current-writer-r11.md

expected blob:
d0e74b6a22ddd1880f725786a313d067aaace2c2

Mandatory human-interface contract expected blob:
fdea31034c370220dfb961993059500716ccfe20

Last durable KOO action:
puev5691/wellbeing-hq@5774baafa3a1b39f6064facec6d89a5acfae2361:
entities/koordinator/outbox/SIS_SECE_D1D2_publicfetch_exec_r03_prompt.md

blob:
6f2efa24959a90b3477019fdada1c2bab9deec73

## Missing-state boundary

fresh predecessor self-snapshot r1.2:
NOT_FOUND

chat-local state after last durable KOO action:
UNKNOWN

Disposition:
DO_NOT_RECONSTRUCT
DO_NOT_REPLAY

## Integrity requirements

- directory composition exactly 5/5;
- copied predecessor writer blob identity preserved;
- copied human-interface contract blob identity preserved;
- immutable package tree recorded;
- readback of all five files after publication;
- any mismatch => BLOCKED/FAIL, not silent repair.

## Authority boundary

No writer establishment.
No freeze/handoff invention.
No profile task authority.
No historical replay.
No Project Source/canon mutation.
No claim that the last durable SIS task was transferred, received, processed or completed.
