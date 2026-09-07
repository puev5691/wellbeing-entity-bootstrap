# Recovery registry АРХИВАРИУСА — current

## Назначение

Единый минимальный учёт recovery-managed Сущностей после активации roles v2.2 и recovery v1.4.

Источник исходных статусов: current KOO registry. Статусы не повышаются без независимой проверки. Наличие внешнего каталога фиксируется отдельно от integrity/readback и отдельно от practical recoverability.

## Registry

| Entity | Last accepted / observed recovery locator | Exact version identity | Publication / readback state | Source-change state | Known recoverability | Следующий шаг |
|---|---|---|---|---|---|---|
| KOO | `puev5691/wellbeing-entity-bootstrap/entities/koo/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc` | publication observed; package integrity not independently reverified by ARH in this cycle | `updating_to_v1_4` | previous `upgraded` from KOO registry; current v1.4 recoverability not promoted | не дублировать KOO cycle |
| KAN | `puev5691/wellbeing-archivist/docs/entities/kancelyariya/recovery-current` | immutable commit `a0dc0073cc6a91e1cfe7c41b6f9639a69916c52c`; blobs initiation `5c4326d1...`, manifest `9bf0b649...`, snapshot `97fc1f03...`, checksums `aff201a7...` | `publication_verified / readback_independently_verified_by_ARH`; SHA-256 and Git blob identities all matched | `current_preservation_accepted` | `structurally_verified_pending_fresh_initiation_test`; full recoverability not claimed | report acceptance to KOO; no new entity checkpoint started automatically |
| ARH | `puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current` | prior self-preservation commit `5b2b16f860eecf8aeb19a9ad049fd1ae3e1dbd8e`; current registry revision follows KAN acceptance | prior self-preservation `publication_completed / readback_verified_by_git_blob_identity`; registry revision pending publication/readback | `current` | `external_package_verified`; fresh cold-start not run in first v1.4 cycle | publish/readback registry revision, then report KOO |
| RED | `puev5691/wellbeing-entity-bootstrap/entities/red/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `a933f77d...`, snapshot `a74b778c...`, manifest `80d8dd53...`, checksums `f1556e45...` | publication observed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; normative freshness unverified | future checkpoint current-writer RED when selected |
| SIS | `puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `1f7d082a...`, snapshot `22cf1c21...`, manifest `b602d7e4...`, checksums `4013a613...` | publication observed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; normative freshness unverified | future checkpoint current-writer SIS when selected |
| WEB | `puev5691/wellbeing-entity-bootstrap/entities/web/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `1f81c77b...`, snapshot `14fd417f...`, manifest `edb15bcb...`, checksums `73c8105f...` | publication observed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; normative freshness unverified | future checkpoint current-writer WEB when selected |
| SHT | `puev5691/wellbeing-entity-bootstrap/entities/sht/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `eebe4aa8...`, snapshot `b3a0771e...`, manifest `0d58ca93...`, role-definition `2cb8a1bc...`, checksums `865873ea...` | publication observed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; normative freshness unverified | future checkpoint current-writer SHT when selected |
| KOD | `puev5691/wellbeing-entity-bootstrap/entities/kod/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `75ee53b2...`, snapshot `b9f65671...`, manifest `e2996846...`, checksums `cf661d8d...` | publication observed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; accepted v0.6 baseline remains evidence, not touched | future checkpoint current-writer KOD only for self/recovery refs |
| SHD | current recovery not confirmed | `unknown` | `unknown` | `unchanged_unknown` | `unknown` | не запускать автоматически без приоритета |
| KON | current recovery not confirmed | `unknown` | `unknown` | `unchanged_unknown` | `unknown` | не запускать автоматически без приоритета |

## KAN preservation acceptance

KAN source-change checkpoint independently verified by ARH:

- external repository: `puev5691/wellbeing-archivist`;
- path: `docs/entities/kancelyariya/recovery-current`;
- immutable commit: `a0dc0073cc6a91e1cfe7c41b6f9639a69916c52c`;
- package composition: initiation + manifest + snapshot + checksums;
- all three content SHA-256 values match external `sha256sums.txt`;
- checksum-file SHA-256 matches the value reported by KAN;
- all four Git blob identities match the immutable external objects;
- provenance checkpoint identity matches `ARH__source-change-preservation-checkpoint__KAN.md` SHA-256 `88e76ad0319e064c7404e55ba275c9a7312d5e6124fb36248e4e5588d062ecb4`.

Acceptance state:

`KAN_preservation_package: accepted_by_ARH`

Recoverability boundary:

`structurally_verified_pending_fresh_initiation_test`

A practical new-instance initiation was not performed and therefore `full_recoverability_verified` is not asserted.

## Правила чтения registry

`stale_check_required` не означает corruption.

`publication observed` не означает integrity verified.

`accepted_by_ARH` для KAN означает принятие preservation-пакета и независимую проверку внешнего сохранения; это не означает, что пробная инициация нового KAN instance уже выполнена.

## Один следующий безопасный шаг

Вернуть КООРДИНАТОРУ короткий результат KAN preservation-check и **не инициировать следующий массовый checkpoint без отдельного выбора/приоритета**.

---

document_type: recovery-registry
owner_entity: ARH
status: current_registry
recovery_canon: v1.4 approved
source_registry: `entities/koo/boards/KOO__entity-recovery-registry__KOO.md`
KAN_preservation_acceptance: accepted_by_ARH
KAN_immutable_version: `a0dc0073cc6a91e1cfe7c41b6f9639a69916c52c`
project_time: generated_without_trusted_project_time
