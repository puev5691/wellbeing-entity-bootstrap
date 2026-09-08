# ARH recovery registry — current

## Назначение

Минимальный recovery-registry. Publication, readback, fresh initiation и practical recoverability учитываются раздельно. Registry не является authority на чужой self-state.

## Current state

| Entity | Locator / immutable version | State | Recoverability |
|---|---|---|---|
| KOO | `puev5691/wellbeing-entity-bootstrap/entities/koo/recovery/current`; exact current version в этом checkpoint не перепроверялась | no status promotion by ARH | not reverified |
| KAN | `puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current`; `a0dc0073cc6a91e1cfe7c41b6f9639a69916c52c` | `accepted_by_KOO`; publication/readback verified | `structurally_verified_pending_fresh_initiation_test` |
| VOL | `puev5691/wellbeing-entity-bootstrap/entities/vol/recovery/current`; `9b631b7f45bc362771df9255560125f7fb3ff9bd` | publication/readback verified by ARH | `structurally_verified_pending_fresh_initiation_test` |
| ARH | `puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current` | post-OSS-v0.6 checkpoint in publication cycle | fresh cold-start not required by this checkpoint |
| RED | `puev5691/wellbeing-entity-bootstrap/entities/red/recovery/current`; previously observed old shared checkpoint | `stale_check_required` | normative freshness unverified |
| SIS | `puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current`; `950f01dc5cdb56c3ea63ba540c4e72eda24973bb` | publication/readback verified by ARH; fresh SIS verification completed | `initiation_verified` |
| WEB | `puev5691/wellbeing-entity-bootstrap/entities/web/recovery/current`; previously observed old shared checkpoint | `stale_check_required` | normative freshness unverified |
| SHT | `puev5691/wellbeing-entity-bootstrap/entities/sht/recovery/current`; previously observed old shared checkpoint | `stale_check_required` | normative freshness unverified |
| KOD | `puev5691/wellbeing-entity-bootstrap/entities/kod/recovery/current`; repair `48a8aa581147cfe1c0560e46a2edee291ed371e8` | executable recovery repaired; exact blob `93f1208d60b058867a4fde4df61689785d216e17`; corrupt `feed2913424d852f2d05a8125d92a3c991e3418f` superseded | artifact integrity/readback verified; fresh KOD initiation not run |
| SHD | locator/version `unknown` | `unchanged_unknown` | `unknown` |
| KON | locator/version `unknown` | `unchanged_unknown` | `unknown` |

## SIS verification evidence

Authoritative SIS fresh report:
`SIS__fresh-recovery-verification__KOO-ARH.md`.

Verified:
- immutable recovery commit `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`;
- checksums `8/8 OK`;
- exact binary blob `93f1208d60b058867a4fde4df61689785d216e17`;
- SHA-256 `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- `initiation_verified`.

## Known failure state

KOD corrupt executable checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` is superseded and must not be used as executable recovery artifact.

## Следующий безопасный шаг

Завершить текущий ARH self-preservation publication/readback. После completion не запускать массовые checkpoints или deployment без нового trigger/решения.

---
document_type: recovery-registry
owner_entity: ARH
status: current_registry
recovery_canon: v1.4-approved
SIS_initiation_status: initiation_verified
KOD_repair_status: completed
project_time: generated_without_trusted_project_time
