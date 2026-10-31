# KOO recovery r1.4 — verified task and control state

status:
ARH_OWNED_RECOVERY_METADATA

## KOO current writer and preserved self-state

KOO_current_writer:
KOO r1.3

status:
WRITER_ESTABLISHED

writer_commit:
210cdf8c3268d5bbb31b0fa7b344a4a14edd22dd

writer_blob:
5208fd71173b8258dfc0ef0ccd8dd21f07b6bdb1

source_snapshot_commit:
5795ac734b4f6af1b948911c6da7f907d9a0427b

source_snapshot_blob:
8a39b17be502cfa4f356e69fb6f6374fdc2b5029

source_snapshot_terminal:
PASS_KOO_R13_SELF_SNAPSHOT_R14_READY_FOR_ARH_PRESERVATION

## Current control state

Old emergency global pause:
HISTORICAL / RELEASED

Old pause source blob:
10522b06a9f3a58298823a2a251df1b9859e8aad

Current pause-release artifact:
puev5691/wellbeing-hq@36af73b6dcb4823e3809216a8e5f77437dd03262:entities/koordinator/current/KOO__global-profile-task-pause-release-r13.md

pause_release_blob:
de2edddd2dea3ceb956f890326b3dcb2795984d9

current_global_profile_task_pause:
GLOBAL_PROFILE_TASK_PAUSE_RELEASED

SECE priority decision:
entities/koordinator/current/KOO__semantic-entity-control-engine-r01-priority-decision__OPERATOR.md

SECE_priority_blob:
d0521905627b306a4888261a9d414148ac64f265

SECE_primary_priority:
ACTIVE_COORDINATION_DECISION

PAUSE_NEW_NON_CRITICAL_PROFILE_TASK_ISSUANCE:
YES

The old global emergency pause must not be resurrected. The SECE non-critical issuance pause remains a separate active decision.

## Current KOD state

KOD recovery:
puev5691/wellbeing-entity-bootstrap@b3e720a8acfe16e2e15b70cde4c5989e552f756b:entities/kod/recovery/versions/kod-recovery-v09

KOD_recovery_tree:
7ae634672118887630c7df730525ebac3b659dba

KOD_recovery_classification:
CURRENT_EXTERNAL_RECOVERY_BASIS_FOR_KOD_V07_POST_SANDBOX_IMPLEMENTATION_CORRECTION_R02

KOD R02 result:
puev5691/wellbeing-hq@36e2d03c17063722c7c0a72ab6ef56f26b1a1d9b:entities/koder/outbox/KOD__SECE-r01-sandbox-adapter-platform-implementation-correction-r02__KOO.md

KOD_R02_result_blob:
bcf282a0e69a2e1272ca885be379798423a76e57

KOD_R02_candidate_tree:
65c8e7c9061bd81f6a0d2e9722d2fa60281c0ade

KOD_R02_candidate:
NOT_ACTIVATED

real_sandbox_effect:
NOT_EXECUTED

sandbox_target:
UNKNOWN / NOT_SELECTED

R02_combined_runtime_PASS:
NOT_INFERRED

## Current SHD state and prepared tail

SHD current writer:
puev5691/wellbeing-hq@5d83ac00eeebc76fb78cc0b0e376028d5c1a8a4e:entities/shardovik/current/SHD__replacement-r04-current-writer.md

SHD_writer_blob:
34b1b11d3cf2c607a8399e91ce066423ca3277e9

SHD_writer_status:
AUTHORITATIVE_CURRENT_WRITER

Previous SHD recovery:
puev5691/wellbeing-entity-bootstrap@78cff4d8fc2a7681b9bf10e4cd5f5f014ec2a7e9:entities/shd/recovery/versions/shd-recovery-r05

SHD_recovery_tree:
760d44a757a2842b3643306a1fb82272b2032472

SHD_recovery_disposition:
STALE_RELATIVE_TO_LATER_SHD_R01_IMPLEMENTATION_REVIEW

Exact SHD R01 review:
puev5691/wellbeing-hq@ab128ba972282ea10ed3ebef51e64bab067036b4:entities/shardovik/outbox/SHD__SECE-r01-sandbox-adapter-platform-implementation-r01-review-r01__KOO.md

SHD_R01_review_blob:
dcd3cd6432256c4ae26ccecd359b95b2964631ee

SHD_R01_review_terminal:
NEEDS_REWORK_SHD_SECE_R01_SANDBOX_ADAPTER_PLATFORM_IMPLEMENTATION_R01_REVIEW_R01

Prepared SHD preservation attempt:
SHD_R04_POST_R01_REVIEW_PRE_R02_REREVIEW_SELF_SNAPSHOT_R01_A1

task_status:
TASK_PREPARED_FOR_MANUAL_ACTIVATION

task:
puev5691/wellbeing-hq@e75cfe8d40732e736a0c213089f1feee281eb5ad:entities/koordinator/outbox/KOO__SHD-r04-post-R01-review-pre-R02-rereview-self-snapshot__SHD.md

task_blob:
e10657752889c84a9c01ed1621aa9ec8b075adda

authority_blob:
5eedf84e785368640dde7497e9e3cbeeb27f582b

registry_blob:
cf671dcb723e225cc4a0b18faf6c76c4145e271f

frontier_commit:
98012d8062e4c5b3bb174b142f05f702d0eedb7f

frontier_blob_in_current_HQ_path_and_KOO_snapshot:
81082bc94bf8db76196139626291409bef853f7c

accepted_state:
INITIAL_NOT_STARTED_V1

start_proven:
NO

PROCESSING_STARTED_for_SHD_attempt:
NOT_FOUND

SHD_self_snapshot_result_for_attempt:
NOT_FOUND

SHD_recovery_r06:
NOT_FOUND

SHD_R02_rereview:
NOT_AUTHORIZED / NOT_PERFORMED

G4_authority:
NOT_CREATED

G5_authority:
NOT_CREATED

G6_authority:
NOT_CREATED

### Known SHD frontier locator discrepancy

The immutable SHD task blob e10657752889c84a9c01ed1621aa9ec8b075adda internally cites frontier blob b16894c2119bbac96f8a49e607ad25b28d950fc0. That blob is not retrievable from the repository.

The KOO self-snapshot, KOO reconciliation and current HQ frontier path identify blob 81082bc94bf8db76196139626291409bef853f7c for the same frontier path/commit.

This discrepancy is preserved, not repaired or inferred away. The prepared SHD tail remains:
PREPARED_NOT_ACTIVATED / HISTORICAL_FRONTIER_EVIDENCE_PENDING_FRESH_RECONCILIATION

Do not replay or activate the prepared SHD task from this recovery.

## Replacement and replay boundaries

KOO r1.4 Initiation Gate:
NOT_EXECUTED

KOO r1.4 Writer Gate:
NOT_EXECUTED

KOO r1.4 current-writer:
NOT_ESTABLISHED

Profile work:
NOT_STARTED_BY_THIS_RECOVERY

Historical PROMPT/task/queue replay:
FORBIDDEN

Hidden/unwritten KOO state:
UNKNOWN / MUST_NOT_BE_RECONSTRUCTED

No task is selected or activated by this recovery package.
