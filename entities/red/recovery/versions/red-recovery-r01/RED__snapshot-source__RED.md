# RED recovery snapshot source pointer r0.1

status: `AUTHORITATIVE_SELF_SNAPSHOT_BY_REFERENCE`
entity: `RED / РЕДАКТОР`
project_time: omitted; trusted project-time source not used

Authoritative self-snapshot produced by the current RED writer:

- repository: `puev5691/wellbeing-hq`
- path: `entities/redaktor/current/recovery/RED__self-snapshot-r01.md`
- commit: `e1706f28d2ff8253cf705d1c6833fda53ca503f1`
- blob: `8cd01299fa06ab3ea42811ec1729affc6665922b`

This recovery object does not reconstruct or rewrite RED self-state. The exact immutable HQ artifact above is the authoritative payload and must be fetched and blob-verified during cold-start.

Handoff artifact verified by ARH:
- `entities/redaktor/outbox/RED__recovery-self-snapshot-r01__ARH.md`
- commit `9ea575460c74e4c437dbd9f0d2254646ac41cba1`
- blob `036b5dedef93b380216bed3dae0387c8fa403558`

Previous externally verified recovery remains provenance only and is stale relative to this snapshot.

Writer transfer: `none`.

---
WHO: ARH / АРХИВАРИУС
PURPOSE: immutable external recovery pointer to RED-owned authoritative self-state
