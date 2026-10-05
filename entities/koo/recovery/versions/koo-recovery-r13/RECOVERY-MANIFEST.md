# KOO recovery r1.3 manifest

status: EXTERNAL_RECOVERY_SUCCESSOR
project_time: omitted

Required composition: exactly 5 files.

1. KOO__emergency-preparation-self-snapshot-r13.md
2. KOO__global-pause-emergency-initiation-preparation-r13.md
3. KOO__human-interface-contract-r02.md
4. KOO__recovery-lineage-r13.md
5. RECOVERY-MANIFEST.md

Copied source identities:
- snapshot blob bf8144c5bd9365f9096c03ea92deee8ea37a8d8b
- global pause blob 10522b06a9f3a58298823a2a251df1b9859e8aad
- human-interface contract blob fdea31034c370220dfb961993059500716ccfe20

Recovery base:
puev5691/wellbeing-entity-bootstrap@122fcd2172781cc87e2cc15afc46f715193f63db:
entities/koo/recovery/versions/koo-recovery-r12

base package tree:
aee471b4388224842b1d052e6e9951eeb1090eac

Integrity requirements:
- composition 5/5;
- copied source identity 3/3;
- package tree recorded;
- immutable readback all files;
- mismatch means BLOCKED/FAIL, never silent repair.

GLOBAL_PROFILE_TASK_PAUSE_ACTIVE remains controlling.

No KOO freeze/retire.
No replacement Initiation Gate.
No Writer Gate.
No SECE/KOD/SHD/SIS resume.
No Project Source/canon mutation.
No cold-start activation.
