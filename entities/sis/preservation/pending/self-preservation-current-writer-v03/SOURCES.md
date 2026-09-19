# SIS recovery sources v03

status: `minimal_source_set`
rule: `load only governing sources plus exact active dependencies`
project_time: omitted; trusted project-time source not used

## A. Active governing sources

1. `project-instructions-core-v2_1-approved(2).md`
   SHA-256 `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`.

2. `file-work-canon-universal-v2_3-approved(2).md`
   SHA-256 `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`.

3. `source-loading-policy-v2-approved(1).md`
   SHA-256 `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`.

4. `entity-state-preservation-and-recovery-canon-v1_4-approved(1).md`
   SHA-256 `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda`.

5. `entity-roles-short-v2_3-approved(1).md`
   SHA-256 `e50df08b5d11765ac5e38197b298ad476333e5f14e717e13a631f9d802dfe10a`.

Purpose: base governance, file-first/delivery, source discipline, verified recovery and SIS role boundary.

## B. Dynamic HQ sources to fresh-read after replacement

Repository:
`puev5691/wellbeing-hq`.

Preservation preflight HEAD:
`627b4ffa136de996598c64bde4fb3d87c6cbce16`.

Mandatory fresh reads:
- current branch HEAD;
- `entities/sisadmin/current/`;
- `entities/sisadmin/inbox/`;
- latest relevant SIS outbox;
- latest KOO active queue;
- routes/dispatch, routes/receipts and sender registry for active SIS artifacts;
- newer recovery/current-writer evidence.

The preservation HEAD is evidence, not eternal current state.

## C. Current writer identity

Artifact:
`entities/sisadmin/current/SIS__replacement-current-writer-v01.md`
blob `6590555d95275d18f4eee4478dad0f80ec9b260f`.

This package does not replace or supersede that writer artifact.

## D. Active SIS causal chain

### OpenAI cost matrix task
KOO task:
commit `512cad6059a4911ee16fb6012a9e05366dc3b547`.

SIS blocker:
commit `8139700f5f31523073d7bbe3ee93e393308d0775`,
blob `b267752067b32f355345892992f4f163ccd6cc9e`.

KOD clean Astra candidate:
commit `627b4ffa136de996598c64bde4fb3d87c6cbce16`,
result status `PASS_KOD_OPENAI_ASTRA_CLEAN_R01_READY_FOR_REVERIFY`.

Do not infer acceptance/deployment. Resolve via fresh exact HQ task.

### Luna live D0
SIS terminal commit:
`28f92b1a72b96fefcb991d1ecccfd57752330301`.

### Resource gateway live-worker
SIS terminal commit:
`18af0b778d5b30f15c20da989a39006f503dcff3`.

### Telegram
Mapping PASS commit:
`977a482936a8c0b4ad809c1b718048b1903fec9e`.

Channel one-send PASS commit:
`a8d46d205a3233b04aa9cf95cb4b349a166df119`.

Discussion probe PASS commit:
`09b6fdfd04da84533185b11b0861b2220b72dfb3`.

### Preservation/shard
Mazhor SIS pilot:
`b7081ab521953206ac60b4bbaae9b83c27783a7b`.

ARH independent readback:
`758e7500c914472c35b7e5b521e51d374aa8d198`.

Burzh/erefia benchmark:
`52e9a70c2d507e299caaad58bacbf65b6f59aefd`.

## E. Previous recovery lineage

Previous SIS self-preservation candidate:
`puev5691/wellbeing-entity-bootstrap@dfac1b1f4a4664f85f12c6590a511502b9828ace:entities/sis/preservation/pending/self-preservation-current-writer-v02`.

Current replacement writer was subsequently established in HQ; therefore v03 captures the newer writer state and newer task results. v02 remains provenance and must not be overwritten.

## Exclusions

Do not load entire archives for context.
Do not load secret files.
Do not treat old task prompts as current without fresh HQ evidence.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: minimal verified source set for planned replacement
СТАТУС: `minimal_source_set_v03`
