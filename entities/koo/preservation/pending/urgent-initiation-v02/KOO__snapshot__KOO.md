# КООРДИНАТОР — urgent current snapshot

## Смысл

Текущий экземпляр KOO уходит на срочную replacement-chat и фиксирует только подтверждённый current-state, materially изменившийся после предыдущего canonical recovery.

## Current operational anchors

### Continuity v2 / Experience Layer

Отдельный public repo существует и bootstrap проверен:

- repository: `puev5691/wellbeing-experience`;
- immutable bootstrap commit: `5238856d51174e863798f85ea3b162ce07bf941c`;
- Git tree: `73a24d60ab86c39599a4f1f10b911ab844e508c1`;
- fresh external clone/readback: PASS;
- `SHA256SUMS.txt`: `12/12 OK`;
- `MANIFEST.md` SHA-256: `0e7b2da2d7479244d8c999401b9181815203f829b0c8c0084587aa22250e5534`;
- `SHA256SUMS.txt` SHA-256: `c389245a2fb6b5b5a1af61f3d129df157854f97071b84b503ee65647861afcaf`.

Model: `PENSIONERS + HOSPITAL + LIVE EXPERIENCE DELTAS` → extraction → cards → dedupe/contradictions → lessons/runbooks → anti-regression → role-specific experience-current → behavioral cold-start test.

Technology status: working candidate, not active Project Source.

KOD experience extraction task is issued:
- `entities/koo/boards/KOO__KOD-experience-extraction__KOD.md`;
- task publication commit: `c864817c5cf8fe6f85be7a291d81e94afa5d55d0`.

SIS extraction pilot exists and is the first control sample: 13 episodes, 15 traps, 11 reusable procedures, 5 unknown.

### КООПЕРАЦИЯ

- remains top substantive research direction;
- public repo: `puev5691/wellbeing-cooperation`;
- Bobrovsky source gate: `OPEN`;
- full actually available Bobrovsky-related intake processing: authorized;
- external thinkers/practitioners research: active;
- direct unreviewed ingest to main: no.

### OSS

- Stage A v0.7: accepted for controlled internal use;
- Entity: `ent:KOO`;
- operational instance: `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06`;
- writer grants: `0`;
- additional entities: `0`;
- public ingress: no;
- production: no.

Safe client helper v0.1 remains blocked by KOO review because arbitrary `--url` plus raw HTTP error-body output can reflect token to stderr. Corrected v0.2 is required before use with operational credential.

### SIS preservation

SIS post-operational preservation accepted.
Canonical SIS recovery immutable commit:
`861645789d206db19e5135a6771564660d99158f`.

### ШКОЛА

`school_governance_cycle: PAUSED`.
No restart trigger has been issued in this state.

## Current priorities

1. Complete urgent replacement-chat KOO initiation safely.
2. Receive and verify KOD experience extraction; use it with SIS extraction to stabilize universal Continuity v2 extraction protocol.
3. Begin first small historical intake wave from PENSIONERS/HOSPITAL only after provenance/privacy/secret boundary check.
4. Continue COOP evidence/corpus work in parallel.
5. Safe OSS helper v0.2 remains a technical blocker before first real OSS workflow.

## Important lessons carried as working continuity constraints

- snapshot/recovery-state is not experience;
- raw chat archive is historical evidence, not current truth;
- experience transfer is proven by changed behavior, not by ability to paraphrase a lesson;
- canonical text recovery should use immutable Git tree/files/blobs/checksums; tar.gz is optional transport, not canonical recovery identity;
- publication, delivery, receipt, acceptance and initiation verification remain different states;
- new instance must perform its own external verification before `initiation_verified`.

## Safe next action

New KOO must first verify this candidate after ARH canonical publication, then check for:
1. KOD experience extraction result;
2. new VOL result;
3. corrected KOD safe client helper v0.2.

Do not repeat already completed OSS v0.7 repair/bootstrap/SIS preservation actions.

---
entity: KOO
artifact_role: urgent-replacement-snapshot
status: current_writer_candidate_for_ARH
production_allowed: no
project_time: generated_without_trusted_project_time
