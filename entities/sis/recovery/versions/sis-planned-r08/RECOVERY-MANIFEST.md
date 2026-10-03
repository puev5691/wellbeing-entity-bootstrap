# RECOVERY-MANIFEST — SIS r0.8 planned replacement preparation r0.1

status: SELF_SNAPSHOT_PACKAGE_READY_FOR_ARH
project_time: omitted

package_id:
SIS_PLANNED_REPLACEMENT_PREP_R08_R01

source_location:
puev5691/wellbeing-hq:entities/sisadmin/outbox/sis-planned-replacement-prep-r08-r01/

source_writer:
SIS r0.8 authoritative current-writer

source_writer_blob:
2b79f89729cf0fd6c1a3d25e273e86f0c1c01b78

base_recovery:
puev5691/wellbeing-entity-bootstrap@6ffb05a0a2fb018717ddd6e996d4ec1c7a41ef7:entities/sis/recovery/versions/sis-emergency-r06

predecessor_delta:
puev5691/wellbeing-entity-bootstrap@faa13798292dd93617ef8d4c0e5e47ebaf5ce809:entities/sis/recovery/versions/sis-planned-r07

generated_files:
- SIS__planned-replacement-self-snapshot-r08-r01__ARH.md
- SIS__planned-replacement-initiation-draft-r01__ARH.md
- SIS__planned-replacement-preservation-handoff-r01__ARH.md
- RECOVERY-MANIFEST.md
- sha256sums.txt

recipients:
- ARH / АРХИВАРИУС
- KOO / КООРДИНАТОР after ARH preservation result
- OPERATOR

copied_to:
NOT_YET_EXTERNALLY_PRESERVED

integrity:
sha256sums.txt contains SHA-256 for the four Markdown files.

operator_action:
transfer the ready ARH activation PROMPT supplied by SIS after package readback.

unresolved_questions:
- exact external recovery version/locator to be assigned by ARH;
- exact predecessor freeze/handoff decision;
- exact successor instance identifier;
- whether/how KOO will reconcile the R03 host tail before replacement;
- whether inert R03 workspace requires later separately authorized cleanup.

status_boundary:
- SIS r0.8 remains current-writer;
- no freeze/handoff performed;
- no successor writer established;
- R03 not resumed/replayed;
- no terminal R03 result manufactured;
- no host cleanup performed.

secrets:
No secret values are intentionally included.

responsibility:
ARH verifies/preserves/publishes/readbacks/registers.
KOO fresh-reconciles after ARH result.
