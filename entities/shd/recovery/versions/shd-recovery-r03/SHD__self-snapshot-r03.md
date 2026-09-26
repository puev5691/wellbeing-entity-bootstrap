# SHD self-snapshot перед replacement-инициацией r0.3

status: CURRENT_WRITER_SELF_SNAPSHOT_PENDING_ARH_PRESERVATION
entity: SHD / ШАРДОВИК
author: current SHD replacement writer
project_time: omitted

## Повод

ОПЕРАТОР сообщил, что приложение уже не справляется, и прямо поручил подготовить replacement-инициацию SHD.

Текущий чат ещё способен фиксировать authoritative self-state, поэтому это плановая self-preservation, а не reconstruction после потери writer.

Все профильные работы SHD поставлены на паузу до завершения preservation/replacement procedure. Этот snapshot не является writer freeze, не устанавливает новый writer и не разрешает automatic replay старых задач.

## Current writer

Authoritative current-writer:
puev5691/wellbeing-hq@85260a61784e9aec33784c5d50cfbc3bfceab19b:
entities/shardovik/current/SHD__replacement-initiation-current-writer.md
blob 88473e85feab1ae5482ff33268ca488abc42f8a4
state replacement_current_writer_established.

Fresh HQ preflight before self-preservation:
c72b81e19b4cf117c8c1045c6bbed3bf054e7f09.

No newer competing SHD current-writer was found in entities/shardovik/current at this boundary.

## Last externally verified SHD recovery

Canonical externally verified checkpoint:
puev5691/wellbeing-entity-bootstrap@ce9891f63b6123600623e01b8da84131f239c5c7:
packages/shd-role-v2_3-current-recovery/

ARH result commit:
29e0a61e4a79842505a279bd131d25cb64978f5e

Bytewise verification: 4/4 PASS.

This recovery predates the current replacement writer and is not silently upgraded by this snapshot.

Current writer provenance also depends on:
- base recovery integrity correction:
  puev5691/wellbeing-entity-bootstrap@3283e92f5cf8a9311063cc4f3e4ccdf43670b832:
  entities/shd/preservation/pending/base-recovery-integrity-correction-v01
- emergency failover overlay:
  puev5691/wellbeing-entity-bootstrap@ea6a84bc4eb668414cb18758b23d45823c5b5e39:
  entities/shd/preservation/pending/emergency-failover-v02
- ARH current-writer lineage preservation:
  wellbeing-hq commit 46e8749a32e2608b5569e9cc7a9fc190c43a6a33.

These are provenance dependencies, not a replacement for fresh ARH preservation of r0.3.

## Current role and limits

Approved SHD role profile:
entities/shardovik/current/SHD__role-profile.md
blob 29df9468da37fb4e9cda0a5912e1f41dffe08a13.

Allowed under exact authority:
- bounded technical/read-only diagnostics and source research;
- own evidence/results;
- own redacted publication and dispatch;
- cross-layer code/infrastructure/runtime/evidence analysis.

Not implied:
- production mutation;
- destructive DATA/DB/blockchain actions;
- firewall/service mutation;
- credential/private-key/token handling;
- canon/Project Source changes;
- writer grants for another Entity;
- automatic replay of historical tasks.

## Recent completed work

1. Telegram A+B independent document review:
wellbeing-hq@c641965b9b9d1a3492c191042b5431a48bc2d702:
entities/shardovik/outbox/SHD__telegram-bridge-ab-identity-attestation-r01-independent-document-review__KOO.md
blob 17f3dba23a08968b186a23dcfa5d7db56e2924d1
terminal PASS_SHD_TELEGRAM_BRIDGE_AB_IDENTITY_ATTESTATION_R01_WITH_BOUNDARIES.
Completed; do not replay.

2. Telegram A closed-schema/JCS independent review:
wellbeing-hq@e4a4cef25ec7605e6beddaa554e01d7c558aeb99:
entities/shardovik/outbox/SHD__telegram-A-schema-jcs-r01-independent-technical-review__KOO.md
blob 6aa923f833a1cbbfc1bf322d144d6556b653ae0e
terminal PASS_SHD_TELEGRAM_A_SCHEMA_JCS_R01_WITH_BOUNDARIES.
Completed; A/B not issued; token_to_bot_binding remains UNKNOWN.

3. GitHub inventory and TERA/WBN source map:
wellbeing-hq@d0c8a62e2fd3698fe8ca05febb1d8c5511780e66:
entities/shardovik/outbox/SHD__github-repository-inventory-and-tera-source-map-r01__OPERATOR.md
blob ab1e94e9a37cc0737aeeeb11247d23c0df82d6a4
terminal PASS_WITH_BOUNDARIES.

The inventory established:
- legacy Terahash source track:
  puev5691/teraOrigin@7fa8aa3fbaec04ce42b68a3bcc19299b5749357b
- historical WBN/JINN forks:
  puev5691/wellbeing@6cc4955442700c2605378f76a0dd4304ad88aa23
  puev5691/wbn2026@1d701c1c4a7d6ccca0053bdf50f413ad31ffe99f
- project lab/deployment history:
  puev5691/wbchain-lab@df7ceef6b6e631b2fbbb34a4eca284383f3c090c
- deployment installer:
  deploy/wbn-node/install/install-third-node.sh
  blob 467021abefefdee39cdde9be7c622cff45cecaf0
- installer pins official upstream TERA2 commit:
  terafoundation/tera2@6cc2061c12986bbaea182786c42d89fd979eeb33
- WBN identity overlay:
  deploy/wbn-node/configs/shard.js
  blob 5625684aa71b370465e5d855bf2d9ccac1e27dd9.

The exact official upstream TERA2 source bytes at that commit had not yet been independently fetched in the completed inventory pass.

Private puev5691/HAS content remained unavailable from current GitHub connector due GitHub private-service access restriction. No content was inferred.

## Paused TERA research direction

Immediately before this replacement request, OPERATOR authorized bounded read-only TERA source research.

Research question:
entry point → configuration → genesis/chain identity → peer discovery → consensus → block production → persistent state

Track 1, legacy Terahash:
puev5691/teraOrigin@7fa8aa3fbaec04ce42b68a3bcc19299b5749357b

Track 2, TERA2/JINN used by WBN deployment:
primary source candidate:
terafoundation/tera2@6cc2061c12986bbaea182786c42d89fd979eeb33

project overlay:
puev5691/wbchain-lab@df7ceef6b6e631b2fbbb34a4eca284383f3c090c

Historical WBN experiments must not be used as proof of pristine upstream TERA2 behavior.

Research limits:
- source read/static analysis allowed;
- no source mutation;
- no genesis mutation;
- no production launch;
- no mutation of existing DATA/DB;
- no deployment;
- no credential operations.

## Conveyor state

Current profile work:
PAUSED_FOR_REPLACEMENT_PRESERVATION.

The TERA research direction is preserved as a current tail, not as automatic replay authority.

A replacement SHD must:
1. complete verified initiation from externally preserved recovery;
2. separately pass Writer Gate / handoff authority;
3. fresh-reconcile HQ/current task state;
4. resume TERA research only if the direction remains current after that reconciliation.

Historical inbox/PROMPT/task files do not self-activate.

## UNKNOWN / blockers

- practical recoverability of r0.3: UNKNOWN until ARH preservation/readback;
- writer handoff/freeze for replacement: NOT_YET_ESTABLISHED;
- replacement SHD writer authority: NOT_GRANTED;
- official TERA2 commit content at 6cc2061...: NOT_YET_INDEPENDENTLY_READ in completed inventory;
- historical WBN runtime claims: historical evidence only, not fresh verification.

## Next safe step

Send this package to ARH for independent preservation, external immutable publication/readback, integrity verification and recoverability accounting.

Do not freeze current SHD writer until preservation succeeds or OPERATOR separately authorizes emergency replacement.
