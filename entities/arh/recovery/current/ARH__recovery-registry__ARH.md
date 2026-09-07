# Recovery registry АРХИВАРИУСА — current

## Назначение

Единый минимальный учёт recovery-managed Сущностей после активации roles v2.2 и recovery v1.4.

Источник предыдущих статусов: current KOO registry. Статусы не повышаются без независимой проверки. Наличие внешнего каталога фиксируется отдельно от integrity/readback и отдельно от recoverability.

Наблюдение GitHub для чужих recovery выполнено на immutable commit:

`c6914d2257382901c9b579dd301ef382e636d4cc`

## Registry

| Entity | Last accepted / observed recovery locator | Exact version identity | Publication / readback state | Source-change state | Known recoverability | Следующий шаг |
|---|---|---|---|---|---|---|
| KOO | `puev5691/wellbeing-entity-bootstrap/entities/koo/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs: snapshot `30c6718f...`, manifest `a0bba71e...`, checksums `63d27421...` | publication observed; directory readback performed; package integrity not reverified by ARH in this cycle | `updating_to_v1_4` | previous `upgraded` from KOO registry; current v1.4 recoverability not promoted | не дублировать checkpoint, дождаться/учесть KOO cycle |
| KAN | exact current external locator **not found in checked bootstrap** | `unknown` | `unknown` | `stale_check_required` | previous `upgraded` only as KOO-registry evidence; current recoverability unverified | **первый адресный checkpoint current-writer KAN** |
| ARH | `puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current` | SHA-256 set in adjacent `sha256sums.txt`; final external Git blob identities verified after publication | `publication_completed / readback_verified_by_git_blob_identity` | `current` | `external_package_verified`; fresh cold-start not run in this cycle | далее KAN checkpoint |
| RED | `puev5691/wellbeing-entity-bootstrap/entities/red/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `a933f77d...`, snapshot `a74b778c...`, manifest `80d8dd53...`, checksums `f1556e45...` | publication observed; directory readback performed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded` from KOO registry; normative freshness unverified | checkpoint current-writer RED |
| SIS | `puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `1f7d082a...`, snapshot `22cf1c21...`, manifest `b602d7e4...`, checksums `4013a613...` | publication observed; directory readback performed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; normative freshness unverified | checkpoint current-writer SIS |
| WEB | `puev5691/wellbeing-entity-bootstrap/entities/web/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `1f81c77b...`, snapshot `14fd417f...`, manifest `edb15bcb...`, checksums `73c8105f...` | publication observed; directory readback performed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; normative freshness unverified | checkpoint current-writer WEB |
| SHT | `puev5691/wellbeing-entity-bootstrap/entities/sht/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `eebe4aa8...`, snapshot `b3a0771e...`, manifest `0d58ca93...`, role-definition `2cb8a1bc...`, checksums `865873ea...` | publication observed; directory readback performed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; normative freshness unverified | checkpoint current-writer SHT |
| KOD | `puev5691/wellbeing-entity-bootstrap/entities/kod/recovery/current` | observed at commit `c6914d2257382901c9b579dd301ef382e636d4cc`; blobs initiation `75ee53b2...`, snapshot `b9f65671...`, manifest `e2996846...`, checksums `cf661d8d...` | publication observed; directory readback performed; integrity not reverified in this cycle | `stale_check_required` | previous `upgraded`; accepted v0.6 baseline remains evidence, not touched | checkpoint current-writer KOD only for self/recovery refs |
| SHD | current recovery not confirmed | `unknown` | `unknown` | `unchanged_unknown` | `unknown` | не запускать автоматически без приоритета |
| KON | current recovery not confirmed | `unknown` | `unknown` | `unchanged_unknown` | `unknown` | не запускать автоматически без приоритета |

## Правила чтения registry

`stale_check_required` не означает corruption.

`publication observed` не означает, что ARH в этом cycle повторно подтвердил целостность всего чужого пакета.

`previous upgraded` не повышается до нового v1.4 verified без checkpoint current-writer и preservation-check.

Для ARH итог `readback_verified_by_git_blob_identity` относится только к финальной версии собственного пакета, опубликованной в этом cycle.

## Один следующий безопасный шаг

`KAN source-change preservation checkpoint`

Причина приоритета: предыдущий `upgraded` известен, но exact current external locator/version не найден в проверенном bootstrap, поэтому риск потери проверяемой continuity выше, чем у Сущностей с наблюдаемым `entities/<code>/recovery/current`.

---

document_type: recovery-registry  
owner_entity: ARH  
status: current_registry  
recovery_canon: v1.4 approved  
source_registry: `entities/koo/boards/KOO__entity-recovery-registry__KOO.md`  
source_registry_observed_commit: `c6914d2257382901c9b579dd301ef382e636d4cc`  
project_time: generated_without_trusted_project_time  
