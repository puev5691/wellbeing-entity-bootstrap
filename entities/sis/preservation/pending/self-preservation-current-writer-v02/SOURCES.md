# SIS recovery sources

status: `minimal_source_set`
rule: `load only what replacement SIS needs to verify role, recovery boundary and current causal state`
project_time: omitted; trusted project-time source not used

## A. Active project governing sources loaded for this self-preservation

1. `project-instructions-core-v2_1-approved(2).md`
   SHA-256 `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`
   Purpose: project execution/authority/delivery baseline.

2. `file-work-canon-universal-v2_3-approved(2).md`
   SHA-256 `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`
   Purpose: file-first, shell-first, routing and verification rules.

3. `source-loading-policy-v2-approved(1).md`
   SHA-256 `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`
   Purpose: minimal source loading and source-status discipline.

4. `entity-state-preservation-and-recovery-canon-v1_4-approved(1).md`
   SHA-256 `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda`
   Purpose: self-snapshot authorship, external recovery verification, initiation states and writer boundary.

5. `entity-roles-short-v2_3-approved(1).md`
   SHA-256 `e50df08b5d11765ac5e38197b298ad476333e5f14e717e13a631f9d802dfe10a`
   Purpose: SIS role boundary.

These files are project-provided sources for the current task. Their raw contents are not duplicated into this recovery candidate.

## B. Dynamic HQ sources that replacement SIS must fresh-read

Repository:
`puev5691/wellbeing-hq`.

Fresh preflight baseline for this package:
`85f6c673a7fec88e820fa6414f473e7697d1d1f5`.

Mandatory dynamic reads:
- `EXCHANGE-GATE.md`;
- `FILE-EXCHANGE-PROTOCOL.md`;
- `entities/sisadmin/current/EXCHANGE-GATE.md`;
- `entities/sisadmin/inbox/`;
- relevant newest `entities/sisadmin/outbox/`;
- relevant `routes/dispatch/` and `routes/receipts/`;
- recovery/preservation/current-writer evidence for SIS.

Do not freeze `main` as eternal truth. Replacement SIS must fresh-preflight.

## C. Exact current causal evidence

### Recovery conflict
- `entities/koordinator/outbox/KOO__SIS-replacement-initiation-v01-verification__ARH.md`
  commit `e22f33594518696f49c018fae78c4ea4b2dc5fac`
  blob `3bc397f81835fc50f5a0534f0b2e950014e3484b`.
- `entities/archivarius/outbox/ARH__SIS-base-recovery-composition-correction__KOO.md`
  current blob at preflight `1a8c2ced96fc876ade0a0698ed5a53f9a9d0290b`.
- correction locator:
  `puev5691/wellbeing-entity-bootstrap@23c83ad27c9a727efca6b6ed8d50e475aeb5fa06:entities/sis/preservation/pending/base-recovery-composition-correction-v01`.

### Telegram Phase 1B
- SIS tooling result:
  commit `488909ed0c42f709c3d23805c51967a2f82ac432`,
  blob `44031aac4c5c96eb9268de2fd67235da37dd5824`.
- KOO tooling receipt:
  commit `56ddc5aa52f1dc061f6d731ae73a4de5113c603b`,
  blob `87e676c60119803cd6703c5be2c5d4c5f517d6d6`.
- latest SIS Termux handoff:
  commit `39a45dcdf54b90cc6dab12694c764958612c5bb8`,
  blob `87d37946d108e43c8adbc29f4849aad1741047d3`.

Current-session OPERATOR execution evidence is preserved in `SIS__snapshot__SIS.md` and `SIS__host-state-nonsecrets__SIS.md`; it is newer than the older HQ recovery overlay and is intentionally identified as current-writer session evidence.

### VPN/Hiddify
- result commit `191ccc61ef2c426395c89f67b829d723dd237527`,
  blob `1876a027f90bff35827d5edee6b58eacec218bb0`.
- acceptance receipt commit `af3956b7ab763d25bde515e0c7bac7f6f71b2544`,
  blob `247ab1a5e90184e321828aa577adbd796241bb72`.

### Entity Runner
- readiness result commit `6a6efc082a1dfd80ae4294f7e1212a97cc43d656`,
  blob `5d4ade030ed9b413145ad822936ae9f1b85c4560`.
- KOO receipt commit `1e4e51b9ae89d9d68b30a6e45983c0980c185924`,
  blob `748e584ffe1d33929244d854b9915f3ce4a86620`.

## D. External profile experience

Repository:
`puev5691/wellbeing-experience`.

Current relevant objects already accepted before this preservation:
- `experience/sis/SIS_experience-cards.jsonl`,
  VPN merge commit `6ddabc84d614a838ceb285b7320510f43f543343`,
  blob after merge `2c1159218af3117f690def1651753aa26e98e964`;
- `experience/sis/android-vpn-client-diagnostics-runbook.md`,
  commit `b653d2e18d3b7087924aa3ba3453c080c6c54fef`,
  blob `2cafd9f0086141d733bf3c5f997d747a096d3a69`.

## Exclusions

Do not load entire archives “for context”.
Historical `artifacts/` under the old SIS base recovery are provenance only and are excluded from automatic recovery/task replay.
Secrets are not sources for this package.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: minimal source loading for replacement recovery
СТАТУС: minimal_source_set
