# RECOVERY-MANIFEST — KOD planned replacement recovery v0.5 candidate

status: `SELF_SNAPSHOT_PACKAGE_PREPARED / PENDING_ARH_PRESERVATION_AND_READBACK`
entity: KOD / КОДЕР
project_time: omitted

## Назначение

Этот пакет подготовлен действующим authoritative current-writer KOD v0.4 после прямого требования ОПЕРАТОРА срочно запустить подготовку инициации replacement instance.

Пакет ещё не является externally verified recovery.

Он не:
- замораживает текущий writer;
- назначает replacement writer;
- создаёт current task authority;
- разрешает historical PROMPT replay.

## Current writer source

Current writer:
`entities/koder/current/KOD__replacement-current-writer-v04.md`

establishment commit:
`62dabf1a8ee0c25a35697ac5675a3cfe47ca225b`

writer blob:
`ba08fe21d0b01cf1f7f5f3e181cd4af4cdfc5391`.

Self-snapshot author:
current KOD writer v0.4.

## Candidate locator

Store:
`github`

Repository:
`puev5691/wellbeing-hq`

Path:
`entities/koder/outbox/kod-recovery-v05-candidate/`

This is a source candidate for ARH preservation, not the final external recovery locator.

## Composition

1. `KOD__replacement-initiation-v05.md`
   - Git blob: `d21e383f1914a63de5ce3c08964ac8e21f4032d2`
   - bytes: `5693`
   - SHA-256: `8c04e01880e8743594e4ae48265e2b9f9f0a582c05d83a1e020b21beac1f223a`

2. `KOD__self-snapshot-v05.md`
   - Git blob: `b8f6b6914991f7408740a44b120da4af31f5a3c5`
   - bytes: `5065`
   - SHA-256: `f3a22506d5deff6034aab4868148b45c4df0e5694d85baca1e3f92abd5150494`

3. `KOD__evidence-tail-v05.md`
   - Git blob: `f7c7c9749dee760d2784d552da92393feb637560`
   - bytes: `1504`
   - SHA-256: `07230e6bb0b2223b295e9e88ea537019b86dd2feff0761ea7ebffbc89e91085d`

4. `SHA256SUMS.txt`
   - Git blob: `09eda63ea36922824aae97b962ed9b675dfe5846`
   - bytes: `285`
   - covers the three substantive recovery files above.

5. `RECOVERY-MANIFEST.md`
   - this file;
   - final Git blob/immutable candidate boundary to be read back after publication.

## Significant active dependency

Latest completed KOD terminal:

`PASS_KOD_BOOSTER_V2_SHAPE_DIAG_SUCCESSOR_WIRING_R01_READY_FOR_SIS_VERIFY`

artifact:
`entities/koder/outbox/KOD__booster-v2-shape-diag-successor-wiring-r01-result__KOO-SIS.md`

commit:
`799a53e7f5041d808ad3d23f7092948aaaea3767`

blob:
`64d2da446dde2eb133e61975e13d624951f89a80`

package:
`entities/koder/outbox/openai-booster-shape-diag-successor-wiring-r01/`

boundary commit:
`f09ae9cd5be37269582deac05435f5ed5a06ca10`

tree:
`6f536f10d99d08dcf5e1e671c5217650261a1548`

normative status:
`candidate / KOD PASS / awaiting independent SIS verification`.

Purpose:
replacement KOD must know this is completed KOD work awaiting external verification, not a prompt to rerun.

## Routing state captured

Last terminal routes at snapshot preparation:
- KOO inbox `6061cd21ba92a24dffa18a5268a730fad654f4fc`;
- KOO dispatch `af41976e025de9281eb1c48f859bc484b4349136`;
- SIS inbox `d570d915f20fe2482e458d09245584bf78f8ffa9`;
- SIS dispatch `6ef8f98d5abc5ada9c8df1ea4f1beeb079eee624`.

Last verified state:
`dispatched_pending_receipt`.

Fresh replacement must re-check.

## Current approved recovery provenance

Last recovery actually used for KOD v0.4 initiation:

`puev5691/wellbeing-entity-bootstrap@216ffc9636f366031f36bd79eb902e17b6a94e6f:entities/kod/preservation/pending/emergency-recovery-v04`

This is historical verified provenance but stale relative to v0.5 current-state.

## Required ARH preservation action

АРХИВАРИУС должен:

1. verify current-writer source and self-snapshot provenance;
2. read back candidate composition;
3. independently verify SHA-256 / Git identities;
4. verify absence of inappropriate secrets/private data;
5. preserve the accepted v0.5 package in the external KOD recovery contour;
6. publish immutable external locator;
7. perform publication readback/verification;
8. update recovery registry;
9. return exact preservation result to KOD/KOO with:
   - repository;
   - immutable ref/commit;
   - exact path;
   - manifest;
   - checksums/integrity mechanism;
   - package composition/readback status;
   - stale/recoverability limitations.

Until this returns PASS, replacement cold start must not claim:
`initiation_verified`
from this v0.5 candidate.

## Self-check result

Current-writer self-check:

- authoritative current-state and pending route state separated: PASS;
- confirmed vs pending vs historical evidence separated: PASS;
- initiation file updated for current role/state: PASS;
- significant active dependencies have immutable refs: PASS;
- one safe next step stated: PASS;
- no lost state reconstructed by plausibility: PASS.

Result:
`PASS_KOD_RECOVERY_V05_SELF_CHECK_READY_FOR_ARH_PRESERVATION`
