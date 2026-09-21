# Sources required for KOO replacement v0.7

Load only current approved sources plus this verified recovery package and task-specific evidence required by fresh reconciliation.

## Active approved baseline

1. `project-instructions-core-v2_5-approved.md`
   SHA-256 `f2ad19e243e55c552b10372c4bd7ddda7f18018579527f94d69e14858303b49c`

2. `entity-roles-short-v2_4-approved.md`
   SHA-256 `d7feae524f6d1a34b0fd2a63475435e41ebe48097a191d87ca0ceeb797421530`

3. `file-work-canon-universal-v2_4-approved.md`
   SHA-256 `c7e09bb358afd9ff131158044ce3722375ab30580e240909e85afdf38ca1e08b`

4. `source-loading-policy-v2_2-approved.md`
   SHA-256 `2a410e929c8cf4daa21f9229ad300e92abbaf4ab40b4fbf3a03950cc663e719e`

5. `entity-state-preservation-and-recovery-canon-v1_6-approved.md`
   SHA-256 `82e3117570a9ecd73be2dae1279ebb3e0a2d6125556de98d5c1ede14a9236ae5`

6. `task-conveyor-canon-v1_2-approved.md`
   SHA-256 `913e88c1e4d17a07122ad9cdf680abae28fc2def0ea0740df9ce925fec22d0e7`

Active source-set evidence:
`entities/koordinator/outbox/KOO__source-set-r07-activation-result__OPERATOR.md`
commit `cf23df50cc59ddd0971d3583184f10e7e49aed2b`.

## Candidate, not active

Task-conveyor v1.3 decision gate:
commit `984711364e2902e61500ed43a4db183cbf92fffe`.

Do not treat candidate presence as approval.

## Recovery rule

Replacement must verify the canonical external recovery package after ARH preservation/readback.
Presence of this pending directory alone is not enough for `initiation_verified`.
