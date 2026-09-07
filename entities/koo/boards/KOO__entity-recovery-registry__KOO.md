# Реестр recovery Сущностей — current checkpoint

## Смысл

Реестр фиксирует только подтверждённое current-state, необходимое для безопасного продолжения текущего цикла. Неизвестные recovery не достраиваются по памяти.

## Реестр

| Код | Current recovery / evidence | Статус | Следующий шаг |
|---|---|---|---|
| KOO | `entities/koo/recovery/current` | `upgraded` | событийное обновление; сейчас real-host preflight ОСС |
| KAN | ранее подтверждённый recovery | `upgraded` | событийное обновление |
| ARH | `entities/arh/recovery/current` | `upgraded` | событийное обновление |
| RED | ранее подтверждённый recovery | `upgraded` | событийное обновление |
| SIS | ранее подтверждённый recovery | `upgraded` | событийное обновление |
| WEB | ранее подтверждённый recovery | `upgraded` | post-init audit `deferred_nonurgent` |
| SHT | `entities/sht/recovery/current` | `upgraded` | событийное обновление |
| KOD | `entities/kod/recovery/current`, commit `feed2913424d852f2d05a8125d92a3c991e3418f` | `upgraded` | ждать KOO real-host deployment task после preflight |
| SHD | recovery не подтверждён | `role_confirmed_recovery_not_confirmed` | отдельный recovery-cycle, не запускать автоматически в текущем шаге |
| KON | recovery не подтверждён | `role_confirmed_recovery_not_confirmed` | не поднимать автоматически |
| SHK | другой проект | `out_of_scope_other_project` | исключена |
| VOL | recovery не требуется | `utility_chat_no_recovery` | не создавать |

## KOO

Текущий экземпляр KOO ранее прошёл `initiation_verified` по внешнему recovery. Этот preservation-cycle не выполняет writer handoff/failover и фиксирует текущий рабочий экземпляр как действующий до отдельного подтверждённого изменения.

## KOD

Recovery v1.3 обновлён после принятия isolated sandbox v0.6 и опубликован внешне.

Immutable commit:

`feed2913424d852f2d05a8125d92a3c991e3418f`

Accepted executable artifact:

`entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`

SHA-256:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

## Граница достоверности

Статусы KAN/ARH/RED/SIS/WEB/SHT сохранены из ранее проверенного current registry; в этом checkpoint повторный полный cold-start этих Сущностей не выполнялся. Их статус не повышается и не меняется.

---
document_type: entity-recovery-registry
entity: KOO
status: current_registry
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
