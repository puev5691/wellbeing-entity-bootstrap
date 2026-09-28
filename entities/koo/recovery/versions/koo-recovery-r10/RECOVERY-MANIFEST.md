# KOO planned replacement r1.0 recovery manifest

status: SELF_SNAPSHOT_PACKAGE_READY_FOR_ARH
project_time: omitted

Package root:
entities/koordinator/outbox/koo-planned-replacement-r10/

Required files:
1. KOO__human-interface-contract-r02.md
2. KOO__planned-replacement-self-snapshot-r10.md
3. KOO__planned-replacement-initiation-draft-r10.md
4. RECOVERY-MANIFEST.md

Recovery model:
- base recovery remains the currently verified KOO recovery;
- this package is a planned replacement delta after ARH external preservation/readback;
- this package does not appoint a writer or freeze the current writer.

Mandatory recovery property:
the human-interface contract is part of the recovery package, not an optional conversational preference.

ARH should:
- verify exact composition;
- verify current-writer provenance;
- verify no authority/task state is silently minted;
- verify the human-interface contract does not conflict with approved Project Sources;
- preserve package externally;
- perform immutable readback/integrity verification;
- return exact recovery locator/version.

No secrets should be present.
