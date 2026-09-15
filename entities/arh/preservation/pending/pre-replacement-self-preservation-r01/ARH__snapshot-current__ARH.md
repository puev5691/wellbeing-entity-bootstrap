# ARH current snapshot — pre-replacement self-preservation r0.1

status: `CURRENT_WRITER_SELF_SNAPSHOT_CANDIDATE`
entity: `ARH / АРХИВАРИУС`
project_time: omitted; trusted project-time source not used

## Snapshot boundary

Fresh `puev5691/wellbeing-hq` pre-candidate HEAD:
`56db550005d6ed6956ba1bf753f3cb24ca295cc3`.

HQ layered ARH state at that boundary:
- `entities/archivarius/current/ARH__initiation-current.md` blob `67bcac3eaa0a5f2835dce8ae7af515d11975a6fe`;
- `entities/archivarius/current/ARH__snapshot.md` blob `8223ea771012d1cf0cc654047e51e87787879bbe`;
- `entities/archivarius/current/ARH__snapshot-delta-current.md` blob `318215735df0db2e516aad9c3c7f0345ab67779d`;
- `entities/archivarius/current/recovery-registry.jsonl` blob `c6cbca8e578a41cd083f68b7c219534601fee983`;
- Experience tree `978a3d574139b0ebe354bd93f9fd0d4a6086d039`.

Canonical ARH recovery remains:
`puev5691/wellbeing-entity-bootstrap@9ffe7190298689bd90f047c249151213e101450e:entities/arh/recovery/current`.
Practical replacement ARH initiation has not been performed by this task.

## Fresh events newer than stored ARH delta

### KOO replacement v05

KOO replacement initiation result:
`entities/koordinator/current/KOO__replacement-initiation-v05-result.md`
commit `68aed55a23778cfa7c68a0cdb28ef08a6e3cd308`.

Verified state recorded there:
- `initiation_verified`;
- replacement KOO current-writer established;
- canonical KOO recovery `47eea7599619c98a2d590f38b6a7a608d4af97c8`;
- historical queue replay: none.

This supersedes the earlier KOO emergency writer-gap/freeze as current KOO operational truth; historical freeze remains provenance.

### KOD replacement writer v0.2

Current evidence:
`entities/koder/current/KOD__replacement-current-writer-v02.md`
commit `56db550005d6ed6956ba1bf753f3cb24ca295cc3`.

Recorded state:
- `CURRENT_WRITER_ESTABLISHED`;
- previous KOD writer retired by explicit OPERATOR decision;
- profile work not started by writer-establishment artifact;
- no historical task replay authorized by that artifact.

## ARH current profile boundary

Exact active task for this preservation cycle:
`entities/koordinator/outbox/KOO__ARH-pre-replacement-self-preservation-r01__ARH.md`
commit `65eb351c2b428e4ec3ee38bbfd5e0a1644b421dc`.

Task scope is only self-preservation candidate preparation and verification. Replacement ARH initiation, writer change, canonical promotion and unrelated sanitation are outside this cycle.

## Existing parked/open tails

Existing sanitation/service tails remain evidence only and are not executed here. Their statuses must be rechecked from fresh HQ before any later work. This candidate does not close them, reopen them or change their routing semantics.

## Recovery / authority invariants

- candidate/draft does not become canon from publication alone;
- inbox/dispatch/activation presence does not prove processing;
- receipt does not imply broader acceptance;
- newer exact evidence may constrain stale recovery but must not be ad hoc merged into synthetic authoritative self-state;
- destructive cleanup/history rewrite is not authorized by preservation;
- current-writer transfer is a separate gate.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: self-owned current snapshot for bounded pre-replacement preservation
СТАТУС: `current_writer_self_snapshot_candidate`
