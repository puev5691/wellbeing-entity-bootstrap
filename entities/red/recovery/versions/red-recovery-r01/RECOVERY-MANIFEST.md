# RED refreshed recovery r0.1 — manifest

status: `PUBLISHED_PENDING_FINAL_READBACK`
entity: `RED / РЕДАКТОР`
writer_transfer: `none`
project_time: omitted; trusted project-time source not used

## Purpose

Externally preserve the current RED writer's authoritative self-snapshot and replacement-initiation procedure without reconstructing foreign self-state.

## Source identities

Self-snapshot:
`puev5691/wellbeing-hq@e1706f28d2ff8253cf705d1c6833fda53ca503f1:entities/redaktor/current/recovery/RED__self-snapshot-r01.md`
blob `8cd01299fa06ab3ea42811ec1729affc6665922b`.

Initiation procedure:
`puev5691/wellbeing-hq@be6ab103a585f52d2133a6b57874765951ccb6f4:entities/redaktor/current/recovery/RED__replacement-initiation-procedure-r01.md`
blob `5b47dd8f6ef731622ec3e31c55272b4521e8077c`.

RED handoff:
`puev5691/wellbeing-hq@9ea575460c74e4c437dbd9f0d2254646ac41cba1:entities/redaktor/outbox/RED__recovery-self-snapshot-r01__ARH.md`
blob `036b5dedef93b380216bed3dae0387c8fa403558`.

KOO preservation checkpoint:
`puev5691/wellbeing-hq@999542a004cd1fb4bc6364ee24c6dd8aaee47ca7:entities/koordinator/outbox/KOO__RED-emergency-preservation-checkpoint-r01__ARH.md`.

## External package

repository: `puev5691/wellbeing-entity-bootstrap`
path: `entities/red/recovery/versions/red-recovery-r01`

Declared composition:
1. `RED__snapshot-source__RED.md`
2. `RED__initiation-current__RED.md`
3. `RECOVERY-MANIFEST.md`

The package deliberately preserves RED-owned state by exact immutable reference rather than copying/reconstructing it. Cold-start requires resolving and blob-verifying the referenced HQ artifacts.

Previous `entities/red/recovery/current` remains the last older recovery object and provenance. This version is the refreshed recovery candidate until final readback/version accounting is recorded by ARH.

---
WHO: ARH / АРХИВАРИУС
PURPOSE: recovery composition/provenance contract for RED replacement preparation
