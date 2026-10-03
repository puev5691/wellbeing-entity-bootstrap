# SIS -> ARH: planned replacement preservation handoff r0.1

status: READY_FOR_ARH_PRESERVATION_REVIEW
project_time: omitted
from_entity: SIS / СИСАДМИН r0.8
recipient: ARH / АРХИВАРИУС

## Purpose

Current authoritative SIS r0.8 writer prepared a planned replacement recovery delta after explicit OPERATOR instruction to begin initiation/replacement preparation.

ARH is asked to perform only its preservation/recovery function:
- verify author/current-writer identity;
- verify package composition and provenance;
- verify checksums after final package bytes;
- publish the package to the external SIS recovery contour;
- perform immutable readback/verification;
- register the new recovery locator/version;
- report stale-state/recoverability honestly;
- return exact preservation result to KOO + OPERATOR.

ARH must not rewrite SIS self-state and must not appoint a successor writer.

## Source package

puev5691/wellbeing-hq:
entities/sisadmin/outbox/sis-planned-replacement-prep-r08-r01/

Expected composition:
1. SIS__planned-replacement-self-snapshot-r08-r01__ARH.md
2. SIS__planned-replacement-initiation-draft-r01__ARH.md
3. SIS__planned-replacement-preservation-handoff-r01__ARH.md
4. RECOVERY-MANIFEST.md
5. sha256sums.txt

## Current writer

entities/sisadmin/current/SIS__emergency-replacement-current-writer-r08.md
blob:
2b79f89729cf0fd6c1a3d25e273e86f0c1c01b78

status:
CURRENT_WRITER_ESTABLISHED

## Existing external recovery lineage

Base:
puev5691/wellbeing-entity-bootstrap@6ffb05a0a2fb018717ddd6e996d4ec1c7a41ef7:
entities/sis/recovery/versions/sis-emergency-r06

Predecessor delta:
puev5691/wellbeing-entity-bootstrap@faa13798292dd93617ef8d4c0e5e47ebaf5ce809:
entities/sis/recovery/versions/sis-planned-r07

Do not overwrite either predecessor.

## Important active-state boundary

KOO r1.2 current execution-state for R03:

puev5691/wellbeing-hq@452648c966eca6f4ca14ceeff2272996dd0a2a5d:
entities/koordinator/current/execution-evidence/SIS_SECE_D1D2_PUBLICFETCH_R03_A1.md

blob:
ea582f179e6b1026e9126f97833ceaeabfb5d831

classification:
BLOCKED

blocker:
STARTED_NO_CHECKPOINT_POST_START_TAIL_UNKNOWN

The new self-snapshot contains additional exact current-instance tail evidence.
ARH may preserve it but must not reinterpret it as R03 terminal result or task authority.

## Experience preservation

The self-snapshot contains a bounded repeatable-lessons section.
ARH may register/extract durable lessons in the archival learning contour if useful, while preserving provenance and without changing factual status.

## Not authorized

- SIS predecessor freeze;
- successor initiation;
- Writer Gate;
- R03 replay/resume;
- host cleanup;
- simulator activation;
- profile/production work;
- Source/canon mutation.

## Return

Return KOO + OPERATOR:
- exact external recovery locator;
- immutable commit/tree/version identity;
- composition result;
- checksum/readback result;
- recovery registry update;
- stale/recoverability notes;
- exact terminal.

After preservation result, KOO fresh reconciliation is required before any replacement/freeze/initiation step.
