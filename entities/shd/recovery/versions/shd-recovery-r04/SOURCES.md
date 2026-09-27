# SHD graceful self-preservation r0.4 source map

status: RECOVERY_CANDIDATE_SOURCE_MAP
project_time: omitted

At future initiation, every entry below must be revalidated for current status/effectivity.

## Active approved Project Sources at preparation boundary

- entity-state-preservation-and-recovery-canon v1.6
  blob 233117e1c9509d730e1f5ec532b1cabe3f786609

- entity-roles-short v2.4
  blob 1772339cb74dae8550bfbd2e33401c34a929e911

- source-loading-policy v2.2
  blob 69eb657f260a019f76e8e707c880ea88c1dfa0bf

- file-work-canon-universal v2.4
  blob e9c29d62057f34e4f771d6057a36d9b7f72e74c2

- task-conveyor-canon v1.2
  blob df7896d867eeeffff506319538fedad938856686

- project-instructions-core v2.5
  blob a42f7dca6a7469a54fa2da24aae0da4e549c9d33

## SHD identity / role dependencies

Current SHD writer:
puev5691/wellbeing-hq@85260a61784e9aec33784c5d50cfbc3bfceab19b:
entities/shardovik/current/SHD__replacement-initiation-current-writer.md
blob 88473e85feab1ae5482ff33268ca488abc42f8a4

Approved SHD role profile:
entities/shardovik/current/SHD__role-profile.md
blob 29df9468da37fb4e9cda0a5912e1f41dffe08a13

## Current KOO / replacement routing dependencies

Current KOO writer:
entities/koordinator/current/KOO__replacement-current-writer-r09.md
blob 8659c738f7d0a2f595a6da3e0f88633268bd2b75
terminal PASS_KOO_REPLACEMENT_CURRENT_WRITER_R09

Active SHD graceful-replacement hold:
puev5691/wellbeing-hq@0006e26551ef737bfe0d9e5c8a11c7e34478d31d:
entities/koordinator/current/KOO__SHD-replacement-hold-pending-live-self-preservation-r01.md
blob e96b95eb17275f27f626c9bba739d2c4d61953ea
terminal PASS_KOO_SHD_REPLACEMENT_HOLD_PENDING_LIVE_SELF_PRESERVATION_R01

Historical emergency authority:
puev5691/wellbeing-hq@4a32909c9a1c8fc0039161416269727c0da0a12d:
entities/koordinator/outbox/KOO__authorize-SHD-emergency-replacement-r04__OPERATOR.md
blob dbd483fa6041f2f3f956ba8dc0a5ce793e86bb4d

Historical emergency task:
puev5691/wellbeing-hq@19c06233b127ac522717a33902b075c448e46283:
entities/koordinator/outbox/KOO__SHD-emergency-replacement-initiation-r04__SHD.md
blob fe7d7fe307aef7ed4aa314188a0e16f5781998b6

Blocked emergency result:
puev5691/wellbeing-hq@72f4941ce1a95b5bc8c59f6141f1e0eb5208b494:
entities/shardovik/outbox/SHD__emergency-replacement-initiation-r04-result__KOO.md
blob dd458b2807b3aa7b3315ac31cac98f94c14b3bd8
terminal BLOCKED_SHD_R04_INITIATION_SUPERSEDED_BY_KOO_HOLD_R01

## Previous externally verified recovery

Canonical SHD recovery r0.3:
puev5691/wellbeing-entity-bootstrap@eb9bfffe382aa17495a3d3297ed6b1acbd2593a9:
entities/shd/recovery/versions/shd-recovery-r03

ARH result:
puev5691/wellbeing-hq@3b24d36a6b823ed4fd70b448c456b89e9a4188ef:
entities/archivarius/outbox/ARH__SHD-self-preservation-r03-result__SHD-OPERATOR.md
blob c5665b775188f5c9e7a5d71a49ca30d5f76ab3f5
terminal PASS_ARH_SHD_SELF_PRESERVATION_R03_EXTERNALLY_PRESERVED

This remains the latest externally verified recovery until ARH preserves this r0.4 successor.

## Current pending task dependencies

### File/Artifact Service r0.2

Task:
puev5691/wellbeing-hq@dd4365315c1432f2d488b6d0c0798bb19a224e3e:
entities/koordinator/outbox/KOO__file-artifact-service-r02-independent-reverify__SHD.md
blob 54480cc89ed9c25fe90941e558f3c95d2eee9c57

Authority:
puev5691/wellbeing-hq@e39339c69231ccd50a7587770ac454a6a0f3862a:
entities/koordinator/outbox/KOO__authorize-SHD-file-artifact-service-r02-reverify__OPERATOR.md
blob 39090b4fd2774d50b055a0efbfe3aca9affafbfc

KOD result:
puev5691/wellbeing-hq@c81530951847c98e95bdae9e5e3621812b32a2f9:
entities/koder/outbox/KOD__file-artifact-service-correction-r02-result__KOO.md
blob e65ccf6e350474933d0957d29aae69eb2bf0a709

Package:
puev5691/wellbeing-hq@b5218dc8c074108b80d7e97f537fe5faf0d9a8e2:
entities/koder/outbox/file-artifact-service-correction-r02
tree b7214594e63303533ade103bf9e627d0cce69504

### Telegram A r0.1 + r0.2 addendum

Task:
puev5691/wellbeing-hq@1483d4923e28910f8baa210c5e183a9b0d73f739:
entities/koordinator/outbox/KOO__telegram-A-r01-plus-r02-addendum-independent-review__SHD.md
blob be86ce69f46fd2b71c4dd37eaecddabff9f33882

Predecessor candidate:
puev5691/wellbeing-hq@bde5e6caf988b255e52aaa191de41e1f6b354572:
entities/kancelar/outbox/KAN__telegram-bridge-A-closed-schema-jcs-vectors-r01-candidate__KOO.md
blob a0fa6d972dc26aa009c55318f03347515bbb7982

Addendum:
puev5691/wellbeing-hq@17c143fdd0bb8dba22b4d6d4cbe86f3916eb4bbc:
entities/kancelar/outbox/KAN__telegram-A-schema-boundary-correction-r02-addendum__KOO.md
blob d061185d6d60aac857044ec06b747f33cfac6f87

### TERA research

Source-map result:
puev5691/wellbeing-hq@d0c8a62e2fd3698fe8ca05febb1d8c5511780e66:
entities/shardovik/outbox/SHD__github-repository-inventory-and-tera-source-map-r01__OPERATOR.md
blob ab1e94e9a37cc0737aeeeb11247d23c0df82d6a4

Legacy source:
puev5691/teraOrigin@7fa8aa3fbaec04ce42b68a3bcc19299b5749357b

Project deployment evidence:
puev5691/wbchain-lab@df7ceef6b6e631b2fbbb34a4eca284383f3c090c

Official TERA2 locator discovered from installer:
terafoundation/tera2@6cc2061c12986bbaea182786c42d89fd979eeb33

The official upstream bytes must be independently fetched/verified before normative source analysis.

## Source-loading rule for future replacement

Load baseline controlling sources first.
Load task-specific material only after initiation and Writer Gate.
Do not preload historical task archive as execution authority.
Do not infer current task from newest filename/time.
