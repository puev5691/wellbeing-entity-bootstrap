# SHT recovery r0.2 manifest

status: IMMUTABLE_VERSIONED_RECOVERY_SUCCESSOR
project_time: omitted

version_path:
entities/sht/recovery/versions/sht-recovery-r02

previous_recovery:
puev5691/wellbeing-entity-bootstrap@b34dd2cda94c2f61acc59a5f066c38bd24fdae0c:entities/sht/recovery/current

previous_recovery_status:
STALE_RELATIVE_TO_CURRENT_SELF_SNAPSHOT

source_snapshot_blob:
d00ce349aebad0fa7e72719cb99d616185b65d93

source_writer_blob:
a019c21cffeb99bb7c387b8fa95a4629137dc6da

source_writer_generation:
SHT-CURRENT-INSTANCE-R01

composition:
9 files exactly

files:
- SHT__replacement-self-snapshot-preservation-r01__KOO-ARH.md
- SHT__current-instance-current-writer-r01.md
- ROLE-IDENTITY.md
- SOURCES.md
- TASK-STATE.md
- SHT__replacement-initiation-boundary-r02.md
- RECOVERY-LINEAGE.md
- RECOVERY-MANIFEST.md
- SHA256SUMS.txt

profile_continuation:
PAUSED_BY_OPERATOR

D1D2_attempt:
COMPLETED_PASS

narrow_rereview:
NOT_STARTED / NOT_AUTHORIZED

historical_replay:
FORBIDDEN

Initiation_Gate:
NOT_PERFORMED

Writer_Gate:
NOT_PERFORMED

current_writer_transfer:
NOT_PERFORMED

Checksum policy:
SHA256SUMS.txt covers all eight non-checksum files using SHA-256 of final UTF-8 bytes.
