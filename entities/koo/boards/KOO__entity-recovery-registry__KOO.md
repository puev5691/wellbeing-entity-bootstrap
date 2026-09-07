# Реестр recovery Сущностей — current checkpoint

## Смысл

Реестр фиксирует подтверждённое состояние на момент активации roles v2.2 и recovery-canon v1.4. Изменение базовых источников является source-change trigger: существующие recovery не объявляются повреждёнными, но их нормативная свежесть должна быть проверена АРХИВАРИУСОМ.

## Реестр

| Код | Current recovery / evidence | Предыдущее состояние | Source-change state | Следующий шаг |
|---|---|---|---|---|
| KOO | `entities/koo/recovery/current` | upgraded | updating_to_v1_4 | текущий cycle KOO |
| KAN | ранее подтверждённый recovery | upgraded | stale_check_required | ARH checkpoint по событию |
| ARH | `entities/arh/recovery/current` | upgraded | self_checkpoint_required | ARH сначала обновляет собственный self-state |
| RED | ранее подтверждённый recovery | upgraded | stale_check_required | ARH checkpoint по событию |
| SIS | ранее подтверждённый recovery | upgraded | stale_check_required | ARH checkpoint по событию |
| WEB | ранее подтверждённый recovery | upgraded | stale_check_required | ARH checkpoint; post-init audit остаётся deferred |
| SHT | `entities/sht/recovery/current` | upgraded | stale_check_required | ARH checkpoint по событию |
| KOD | `entities/kod/recovery/current`, accepted v0.6 baseline | upgraded | stale_check_required | не трогать code baseline; обновить self/recovery refs по новой норме |
| SHD | recovery не подтверждён | role_confirmed_recovery_not_confirmed | unchanged_unknown | отдельный recovery-cycle, не запускать автоматически без приоритета |
| KON | recovery не подтверждён | role_confirmed_recovery_not_confirmed | unchanged_unknown | не поднимать автоматически |
| VOL | recovery не требуется | utility_chat_no_recovery | unchanged | не создавать |

## Граница достоверности

`stale_check_required` не означает, что содержимое recovery неверно. Это означает только, что после изменения active role/recovery sources требуется проверить, отражает ли пакет новую обязательную норму и нужен ли self-snapshot текущего writer.

АРХИВАРИУС не реконструирует чужой self-state. Любое обновление содержательного snapshot делает authoritative current-writer соответствующей Сущности.

---
document_type: entity-recovery-registry
entity: KOO
status: current_registry
recovery_canon: v1.4 approved
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
