# ARH recovery registry — current

## Назначение

Минимальный реестр recovery-managed Сущностей по recovery v1.4. Publication, readback и practical recoverability учитываются раздельно. Статусы не повышаются без проверки.

## Current state

| Entity | Locator / immutable version | State | Recoverability |
|---|---|---|---|
| KOO | `puev5691/wellbeing-entity-bootstrap/entities/koo/recovery/current`; observed `c6914d2257382901c9b579dd301ef382e636d4cc` | `updating_to_v1_4`; не перепроверялся ARH в текущем цикле | не повышен |
| KAN | `puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current`; `a0dc0073cc6a91e1cfe7c41b6f9639a69916c52c` | `accepted_by_KOO`; publication/readback verified | `structurally_verified_pending_fresh_initiation_test` |
| VOL | `puev5691/wellbeing-entity-bootstrap/entities/vol/recovery/current`; `9b631b7f45bc362771df9255560125f7fb3ff9bd` | `recovery_managed_minimal`; publication/readback independently verified by ARH | `structurally_verified_pending_fresh_initiation_test` |
| ARH | `puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current` | `current`; registry maintenance under v1.4 | external package verified; fresh v1.4 cold-start not run |
| RED | `puev5691/wellbeing-entity-bootstrap/entities/red/recovery/current`; observed `c6914d2257382901c9b579dd301ef382e636d4cc` | `stale_check_required` | normative freshness unverified |
| SIS | `puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current`; `950f01dc5cdb56c3ea63ba540c4e72eda24973bb` | current package publication/readback verified by ARH | `structurally_verified_pending_fresh_initiation_test`; running instance remains `initiation_loaded_external_unverified` until recheck |
| WEB | `puev5691/wellbeing-entity-bootstrap/entities/web/recovery/current`; observed `c6914d2257382901c9b579dd301ef382e636d4cc` | `stale_check_required` | normative freshness unverified |
| SHT | `puev5691/wellbeing-entity-bootstrap/entities/sht/recovery/current`; observed `c6914d2257382901c9b579dd301ef382e636d4cc` | `stale_check_required` | normative freshness unverified |
| KOD | `puev5691/wellbeing-entity-bootstrap/entities/kod/recovery/current`; canonical repair `48a8aa581147cfe1c0560e46a2edee291ed371e8` | executable recovery repaired; exact v0.6 blob `93f1208d60b058867a4fde4df61689785d216e17`; corrupt checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` superseded and not executable | artifact integrity/readback verified; fresh KOD initiation not run |
| SHD | locator/version `unknown` | `unchanged_unknown` | `unknown` |
| KON | locator/version `unknown` | `unchanged_unknown` | `unknown` |

## VOL verification

KOO final review: `VOL_final_local_set: accepted_by_KOO`.

ARH опубликовал exact accepted set без изменения VOL self-state.

Immutable VOL publication commit:

`9b631b7f45bc362771df9255560125f7fb3ff9bd`

Readback подтвердил ровно шесть файлов и Git blob identities:

- decision `8e16f62d4a48401756d2625adbda8fa764eda048`
- initiation `388d8e10968809378caa9d49686917fb2949cb57`
- snapshot `95ea3ef99dc939b809d1480246a0e00fd1910858`
- manifest `b8a77eba760963a1c6aa5d890cb44f1abbbc0c31`
- VOL report `35a788e30d162b9fbca8bb98d7e7bbe9e08ba4b3`
- `sha256sums.txt` `368125b0e45855272afeb323f9532073597f7e01`

External checksum-list содержит неизменённые пять SHA-256 принятого final-set. Новый VOL instance не запускался; `full_recoverability_verified` не заявляется.

## Следующий безопасный шаг

Передать КООРДИНАТОРУ completion receipt по KOD repair и SIS publication. После решения КООРДИНАТОРА новый SIS должен повторить external recovery verification по immutable commit `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`; до этого его текущий initiation status не повышается. Real-host deploy остаётся blocked pending recovery completion receipt.

---
document_type: recovery-registry
owner_entity: ARH
status: current_registry
recovery_canon: v1.4-approved
KAN_state: accepted_by_KOO
VOL_recovery_status: recovery_managed_minimal
VOL_publication_state: readback_verified_by_ARH
VOL_immutable_version: 9b631b7f45bc362771df9255560125f7fb3ff9bd
project_time: generated_without_trusted_project_time
