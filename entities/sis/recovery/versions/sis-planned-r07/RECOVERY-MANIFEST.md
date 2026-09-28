# SIS planned replacement preparation — recovery manifest r0.1

status: SELF_SNAPSHOT_PACKAGE_READY_FOR_ARH
project_time: omitted

## Composition

1. SIS__planned-replacement-self-snapshot-r01__ARH.md
2. SIS__planned-replacement-initiation-draft-r01__ARH.md
3. SIS__planned-replacement-preservation-handoff-r01__ARH.md
4. RECOVERY-MANIFEST.md
5. sha256sums.txt

## Recovery model

Base:
puev5691/wellbeing-entity-bootstrap@6ffb05a0a2fb018717ddd6e996d4ec1c7a41ef7:
entities/sis/recovery/versions/sis-emergency-r06

Delta:
this package, after immutable publication/readback by ARH.

The base is not silently rewritten.
The delta does not appoint a writer.

## Current-state boundary

The interrupted exact task P552203 PRESERVATION_COPY_R01 is preserved as PAUSED_BY_OPERATOR_FOR_SIS_REPLACEMENT_PREPARATION.

No result publication occurred.
No destination package commit exists.
Unattached Git blobs are not task progress.

## Integrity

sha256sums.txt contains SHA-256 for the four Markdown files.
ARH should verify those bytes after external preservation and may add the final external package identity under its own preservation authority.

## Secrets

No secret values are included.
Credential/token/private key reconstruction is forbidden.
