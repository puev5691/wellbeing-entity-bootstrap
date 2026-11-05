# KOO recovery r1.4 — immutable lineage / external recovery r15

status:
RECOVERY_SUCCESSOR_LINEAGE

## Last verified predecessor external recovery

puev5691/wellbeing-entity-bootstrap@896b33f99551092bf50f7bef2657e3276d850fc3:entities/koo/recovery/versions/koo-recovery-r13

predecessor_tree:
1aecd76c7cabe55d047eea6ea79700fed643d98d

classification:
EXTERNALLY_PRESERVED_READBACK_PASS

current_disposition:
LAST_EXTERNALLY_VERIFIED_KOO_RECOVERY_BUT_STALE_RELATIVE_TO_LATER_KOO_R13_WORK

Do not rewrite or delete r13.

## Failed intermediate recovery r14

Publication:
puev5691/wellbeing-entity-bootstrap@f89bc6a414038fb741b968b620189c35cbd39006:entities/koo/recovery/versions/koo-recovery-r14

package_tree:
408111bf55bde1fe036bdf7519b969a34b83af71

ARH registry:
puev5691/wellbeing-hq@1172fff6b8290f26d128a2d85580f1ac7cfde957:entities/archivarius/current/recovery-registry/ARH__KOO-recovery-r14.md

registry_blob:
60837400e0dda55566cfc730a8a1f30f8bce8571

terminal:
FAIL_ARH_KOO_R14_EXTERNAL_RECOVERY_SHA256_MISMATCH

The copied HIC Git blob was correct, but r14 SHA256SUMS expected:
34e365fb9675dccc6deaa5f48095cd65975f723f1ac798ea6bd5271f193df2ce

Independent SHA-256 of exact HIC bytes:
b8f9cfa56636127ed013bda7a67c2b0bb77f75099ac081c13f5b06f8a2aa0175

r14 remains immutable and failed. It is not a verified recovery basis.

## Exact KOO r1.3 current-writer

puev5691/wellbeing-hq@210cdf8c3268d5bbb31b0fa7b344a4a14edd22dd:entities/koordinator/current/KOO__replacement-current-writer-r13.md

blob:
5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1

status:
WRITER_ESTABLISHED

## Exact KOO r1.3 self-snapshot

puev5691/wellbeing-hq@5795ac734b4f6af1b948911c6da7f907d9a0427b:entities/koordinator/outbox/koo-planned-handoff-r14/KOO__planned-chat-replacement-self-snapshot-r14.md

blob:
8a39b17be502cfa4f356e69fb6f6374fdc2b5029

terminal:
PASS_KOO_R13_SELF_SNAPSHOT_R14_READY_FOR_ARH_PRESERVATION

This exact KOO-authored self-snapshot is copied byte-for-byte. ARH does not rewrite its substantive self-state.

## Human Interface Contract lineage

Exact contract copied from last verified KOO recovery r13:
puev5691/wellbeing-entity-bootstrap@896b33f99551092bf50f7bef2657e3276d850fc3:entities/koo/recovery/versions/koo-recovery-r13/KOO__human-interface-contract-r02.md

Git blob:
fdea31034c370220dfb961993059500716ccfe20

Exact-byte SHA-256 independently recomputed:
b8f9cfa56636127ed013bda7a67c2b0bb77f75099ac081c13f5b06f8a2aa0175

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

## ARH r15 recovery attempt

ARH current-writer:
puev5691/wellbeing-hq@5ba2c74ae00cf8414925341084f8a3bb352f5628:entities/archivarius/current/ARH__replacement-current-writer-r04.md

ARH_writer_blob:
57fed46548bda0eb78d87387e209cf91c5233aaf

task authority:
puev5691/wellbeing-hq@60c4f26bcffa6b20f90f8e2439477131e91c950d:entities/archivarius/outbox/ARH__KOO-r15-external-recovery-authority__OPERATOR.md

authority_blob:
0f6a051098bb5af85571277892cbf3f8924766bb

PROCESSING_STARTED:
puev5691/wellbeing-hq@d148ee3084307f2a6145429c6792557cd96583ad:entities/archivarius/outbox/execution-evidence/ARH_KOO_R15_EXTERNAL_RECOVERY_R01_A1__PROCESSING_STARTED_E1.md

PROCESSING_STARTED_blob:
fba94df192fbde9897bb468a4d0c850a1a20660b

## New immutable recovery successor

Target:
puev5691/wellbeing-entity-bootstrap:entities/koo/recovery/versions/koo-recovery-r15

r15 preserves the exact same KOO-authored self-snapshot and current-writer as the original planned replacement state. Only ARH-owned recovery metadata and the corrected, independently recomputed integrity inventory differ from the failed r14 package.

The publication commit/tree and final registry/result identities are recorded outside this package to avoid self-referential Git commit metadata.
