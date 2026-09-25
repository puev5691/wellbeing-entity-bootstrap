# KOO pre-replacement preservation package r0.9 — pending

status: PENDING_ARH_PRESERVATION_NOT_ACTIVE_RECOVERY
entity: KOO / КООРДИНАТОР
author: current KOO v0.8 writer
project_time: omitted

This is a self-authored candidate package for independent ARH preservation/readback. Do not promote it to `recovery/current` or treat publication as recovery acceptance. The old independently preserved v0.8 remains the confirmed recovery until ARH verifies a successor and records exact immutable identity.

Publication target: `puev5691/wellbeing-hq:entities/koordinator/preservation/pending/koo-handoff-r09/` (final exact commit and Git blobs to be read back after publication). ARH decides external immutable recovery placement under its authority.

Exactly five files:
1. `KOO__self-snapshot-r09.md` — author's own current-state, pause and exact evidence references.
2. `KOO__replacement-initiation-r09.md` — future initiation candidate, not active.
3. `SOURCES.md` — source identities for loading check.
4. `RECOVERY-MANIFEST.md` — this composition, status and boundaries.
5. `SHA256SUMS.txt` — SHA-256 for first four files, excluding itself.

Known author-side SHA-256 content checks before publication:
- `KOO__self-snapshot-r09.md`: `b967422b282ddfc6889f83c524b2aa1821a69c040ca6d3bcc70cc8b07d2793cb`;
- `KOO__replacement-initiation-r09.md`: `5ec6561e13a15c95c606a1b76c37bd4bb135c4e5377b8af1b5464cff3ef3f429`;
- `SOURCES.md`: `d895ad4aa9cf7e11c659653621d20fd70520bf056c73c3e214b116fcb580c595`.

Recovery predecessor:
`puev5691/wellbeing-entity-bootstrap@ef8e2c887fe95b69a99b0a0252027d9ee267ea2b:entities/koo/recovery/versions/koo-recovery-v08`; 8/8 preservation PASS in ARH result commit `d46c77a7f5a685943b0aec732d75cf42c95eed9b`.

Writer basis:
`puev5691/wellbeing-hq@9781aeff09d868ade3f3e1a28f28014d23512386:entities/koordinator/current/KOO__replacement-current-writer-v08.md`; blob `ca7ed0ed4e539dcdbe783e122cea409a77ab10cd`. This writer has not been frozen or handed off in this package. New instance continuity, initiation and Writer Gate are separate later gates.

Operator trigger: prepare KOO initiation on app instability; all other KOO tasks paused. No historical PROMPT replay, no memory-layering attempt 3, no host/credential/provider/Telegram authority.

ARH must independently verify composition, exact Git blobs, SHA256SUMS, readback, provenance, freshness and recovery status. Do not infer practical cold-start from checked bytes. Before any replacement, separately verify handoff/freeze and absence of competing writer.
