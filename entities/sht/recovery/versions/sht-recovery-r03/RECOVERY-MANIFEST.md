# SHT recovery r0.3 manifest

status: EXTERNALLY_PRESERVED_READBACK_PASS_CANDIDATE
project_time: omitted

version_path:
entities/sht/recovery/versions/sht-recovery-r03

predecessor_recovery:
puev5691/wellbeing-entity-bootstrap@c23b2304ca0ea4f4b62e9e451e39c69cfb1817c5:entities/sht/recovery/versions/sht-recovery-r02

predecessor_tree:
f561246223a48ac885d7baae383898cc8e89af16

source_snapshot_blob:
6d48804adfb190d211ffea7c20f80fbde0135e64

source_writer_blob:
591a5c474523f46ad84b5c49c62939832b87b15c

source_writer_generation:
SHT-REPLACEMENT-R02

writer_gate_result_blob:
4ed81c3587ae4d8efeee306b271e7a3ffcac1911

composition:
9 files exactly

files:
- SHT__replacement-r02-post-writer-self-snapshot__KOO-ARH.md
- SHT__replacement-current-writer-r02.md
- ROLE-IDENTITY.md
- SOURCES.md
- TASK-STATE.md
- SHT__recovery-initiation-boundary-r03.md
- RECOVERY-LINEAGE.md
- RECOVERY-MANIFEST.md
- SHA256SUMS.txt

profile_continuation:
PAUSED_BY_OPERATOR

D1D2:
COMPLETED_PASS

narrow_rereview:
NOT_STARTED / NOT_AUTHORIZED

profile_task_authority:
NOT_CREATED

historical_replay:
FORBIDDEN

SECE_continuation:
NOT_AUTHORIZED

Checksum policy:
SHA256SUMS.txt covers all eight non-checksum files using SHA-256 over final UTF-8 bytes.
