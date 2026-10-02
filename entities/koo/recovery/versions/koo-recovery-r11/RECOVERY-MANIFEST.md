# KOO planned replacement r1.1 recovery manifest

status: EXTERNAL_RECOVERY_SUCCESSOR_PACKAGE
project_time: omitted

## Package purpose

This package preserves the exact KOO r1.1 planned-replacement state for a genuinely NEW KOO application chat.

It is an external recovery successor only.
It does not freeze KOO r1.0, establish a new writer, initiate the replacement chat, replay tasks, or mutate Project Sources/canons.

## Recovery lineage

BASE:
puev5691/wellbeing-entity-bootstrap@ab4c7ad12db9760fe825d2a93b6467499e1a09f4:
entities/koo/recovery/versions/koo-recovery-r09

DELTA:
puev5691/wellbeing-entity-bootstrap@e07047dfce0684638e2164d1712dee06ac313cfc:
entities/koo/recovery/versions/koo-recovery-r10

SUCCESSOR:
entities/koo/recovery/versions/koo-recovery-r11

## Exact source provenance

Current writer:
entities/koordinator/current/KOO__replacement-current-writer-r10.md
blob 8416e945418a4a86764edafbbd06682f6c84682b
status WRITER_ESTABLISHED

Exact r1.1 self-snapshot source:
puev5691/wellbeing-hq@75d49d73cb70af7bea86f597d649bbdc90b441c0:
entities/koordinator/outbox/koo-planned-replacement-r11/KOO__planned-replacement-self-snapshot-r11.md
blob 0ed912ad6b3be78e3aecf01e2946c8b06d46fdb9

Browser-transition correction source:
puev5691/wellbeing-hq@afc053c56a5ad811fd7a20d25937ac4a441b6df1:
entities/koordinator/outbox/KOO__browser-transition-r11-initiation-correction.md
blob 22a58ed7b940b8a3ffd46492e6dcc11326d4292a

Mandatory human-interface contract source:
puev5691/wellbeing-entity-bootstrap@e07047dfce0684638e2164d1712dee06ac313cfc:
entities/koo/recovery/versions/koo-recovery-r10/KOO__human-interface-contract-r02.md
blob fdea31034c370220dfb961993059500716ccfe20

## Exact composition

Required files: 5

1. KOO__human-interface-contract-r02.md
2. KOO__planned-replacement-self-snapshot-r11.md
3. KOO__browser-transition-r11-initiation-correction.md
4. KOO__planned-replacement-initiation-draft-r11.md
5. RECOVERY-MANIFEST.md

## Integrity rules

- source-copied files must retain exact Git blob identity of their pinned source;
- package directory must contain exactly the five required files;
- external readback must verify every file/blob after publication;
- immutable package/tree identity must be returned by ARH;
- any composition or identity mismatch is FAIL/BLOCKED, not repair-by-guessing.

## Human-interface invariant

KOO__human-interface-contract-r02.md is mandatory recovery state, not an optional style preference.

Replacement initiation must explicitly verify H1-H8 before returning initiation_verified_waiting_writer_gate.

## Browser-transition disposition

The historical browser-transition initiation artifact is not valid initiation evidence for the NEW replacement KOO chat.

The preserved correction has:
- writer effect: NONE;
- task authority effect: NONE;
- profile work effect: NONE.

## No-replay / no-mutation boundary

Historical tasks/prompts are not current task authority.
No current-writer mutation is performed by preservation.
No replacement initiation is performed by preservation.
No Project Source/canon mutation is performed by preservation.
