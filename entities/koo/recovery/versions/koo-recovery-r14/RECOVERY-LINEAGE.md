# KOO recovery r1.4 — immutable lineage

status:
RECOVERY_SUCCESSOR_LINEAGE

## Predecessor external recovery

puev5691/wellbeing-entity-bootstrap@896b33f99551092bf50f7bef2657e3276d850fc3:entities/koo/recovery/versions/koo-recovery-r13

predecessor_tree:
1aecd76c7cabe55d047eea6ea79700fed643d98d

predecessor_classification:
EXTERNALLY_PRESERVED_READBACK_PASS

current_disposition:
LAST_EXTERNALLY_VERIFIED_KOO_RECOVERY_BUT_STALE_RELATIVE_TO_LATER_KOO_R13_WORK

Do not rewrite or delete r13.

## Exact KOO r1.3 current-writer

puev5691/wellbeing-hq@210cdf8c3268d5bbb31b0fa7b344a4a14edd22dd:entities/koordinator/current/KOO__replacement-current-writer-r13.md

blob:
5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1

status:
WRITER_ESTABLISHED

## Exact KOO r1.3 self-snapshot for successor r14

puev5691/wellbeing-hq@5795ac734b4f6af1b948911c6da7f907d9a0427b:entities/koordinator/outbox/koo-planned-handoff-r14/KOO__planned-chat-replacement-self-snapshot-r14.md

blob:
8a39b17be502cfa4f356e69fb6f6374fdc2b5029

terminal:
PASS_KOO_R13_SELF_SNAPSHOT_R14_READY_FOR_ARH_PRESERVATION

This exact KOO-authored self-snapshot is copied byte-for-byte. ARH does not rewrite its substantive self-state.

## Human Interface Contract lineage

Exact contract copied from predecessor r13:
puev5691/wellbeing-entity-bootstrap@896b33f99551092bf50f7bef2657e3276d850fc3:entities/koo/recovery/versions/koo-recovery-r13/KOO__human-interface-contract-r02.md

blob:
fdea31034c370220dfb961993059500716ccfe20

The contract remains a mandatory input for the replacement Initiation Gate.

## Current control-state provenance

Global pause release:
puev5691/wellbeing-hq@36af73b6dcb4823e3809216a8e5f77437dd03262:entities/koordinator/current/KOO__global-profile-task-pause-release-r13.md

blob:
de2edddd2dea3ceb956f890326b3dcb2795984d9

status:
GLOBAL_PROFILE_TASK_PAUSE_RELEASED

SECE priority:
puev5691/wellbeing-hq:entities/koordinator/current/KOO__semantic-entity-control-engine-r01-priority-decision__OPERATOR.md

blob:
d0521905627b306a4888261a9d414148ac64f265

status:
ACTIVE_COORDINATION_DECISION

Current KOD recovery:
puev5691/wellbeing-entity-bootstrap@b3e720a8acfe16e2e15b70cde4c5989e552f756b:entities/kod/recovery/versions/kod-recovery-v09

tree:
7ae634672118887630c7df730525ebac3b659dba

Current SHD writer:
puev5691/wellbeing-hq@5d83ac00eeebc76fb78cc0b0e376028d5c1a8a4e:entities/shardovik/current/SHD__replacement-r04-current-writer.md

blob:
34b1b11d3cf2c607a8399e91ce066423ca3277e9

Current SHD recovery:
puev5691/wellbeing-entity-bootstrap@78cff4d8fc2a7681b9bf10e4cd5f5f014ec2a7e9:entities/shd/recovery/versions/shd-recovery-r05

tree:
760d44a757a2842b3643306a1fb82272b2032472

disposition:
STALE_RELATIVE_TO_LATER_SHD_R01_IMPLEMENTATION_REVIEW

## ARH preservation attempt

attempt:
ARH_KOO_R14_EXTERNAL_RECOVERY_R01_A1

task_blob:
1b303f63fb4dc08306eb507b84977da14d6845a1

authority_blob:
3a92721b8a12ebe3d20632d610130ecccca5cb14

frontier_blob:
3bab160572ffef647c902eff1dddfabf1858fbbd

PROCESSING_STARTED:
puev5691/wellbeing-hq@3dac10bfde28298874a91bf027efbd12fb5b85ce:entities/archivarius/outbox/execution-evidence/ARH_KOO_R14_EXTERNAL_RECOVERY_R01_A1__PROCESSING_STARTED_E1.md

PROCESSING_STARTED_blob:
874cefeca16ae64cf6ce5073381f720c9b7ef025

## New successor boundary

Target:
puev5691/wellbeing-entity-bootstrap:entities/koo/recovery/versions/koo-recovery-r14

The publication commit and package tree are recorded by the external ARH recovery registry and terminal result, not self-referenced from inside this package.
