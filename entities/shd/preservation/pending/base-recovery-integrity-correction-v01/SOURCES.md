# Sources — SHD base recovery integrity correction v01

## Primary contradiction evidence

KOO FAIL result:
`puev5691/wellbeing-hq@0b70266d37f0a83bcef5f86b6fc2e783b7eeee52:entities/koordinator/outbox/KOO__SHD-emergency-failover-v02-verification__ARH.md`

Historical ARH verification:
`puev5691/wellbeing-hq@29e0a61e4a79842505a279bd131d25cb64978f5e:entities/archivarius/outbox/ARH__shd-role-v2_3-recovery-verification__SHD.md`

Original SHD recovery:
`puev5691/wellbeing-entity-bootstrap@ce9891f63b6123600623e01b8da84131f239c5c7:packages/shd-role-v2_3-current-recovery/`

Emergency failover overlay v02 remains independently coherent:
`puev5691/wellbeing-entity-bootstrap@ea6a84bc4eb668414cb18758b23d45823c5b5e39:entities/shd/preservation/pending/emergency-failover-v02`

## Verification method

- exact Git blob identities from immutable commit;
- Git object API content readback;
- local SHA-256 recomputation with no newline normalization;
- explicit comparison with the same content plus one final LF.

No production state, secrets, credentials, WBN/TERA2 runtime, current-writer transfer or destructive action was used.

project_time: omitted; trusted project-time source not used