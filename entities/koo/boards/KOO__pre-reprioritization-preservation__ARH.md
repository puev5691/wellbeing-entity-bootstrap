# КООРДИНАТОР → АРХИВАРИУС
## Targeted preservation перед сменой общепроектных приоритетов

## Trigger

ОПЕРАТОР:
- поставил governance/rebuild cycle ШКОЛЫ на паузу;
- готовит новый набор первоочередных задач;
- ожидает параллельное завершение первого этапа ОСС.

Нужен не массовый ritual snapshot, а targeted preservation по фактическим change-state.

## Обязательный checkpoint: KOO

KOO current-writer передаёт отдельный self-state candidate текущего transition cycle.

Причина: externally current KOO recovery `ae0ad1ad9eab2d9bba6f72ade462ff28f50ed162` предшествует:
- acceptance deploy bundle v0.3;
- controlled SIS repair task;
- фактическому переключению host на v0.7 release;
- post-OSS intensive/media plan;
- school source-barrier/rebuild cycle;
- решению ОПЕРАТОРА о паузе ШКОЛЫ и смене приоритетов.

ARH должен проверить composition/provenance/checksums и довести KOO checkpoint до external publication + immutable readback.

## Targeted checks других Сущностей

### KOD
Проверить, существует ли externally verified current recovery, содержащий corrected core v0.7 + repair contract + deploy bundle v0.3 cycle.

Если нет — выдать checkpoint KOD current-writer. ARH не пишет KOD self-state.

### SIS
Не инициировать preservation посреди repair transaction без trigger failure/interrupt.

После terminal SIS receipt `PASS|BLOCKED|FAIL` и KOO решения инициировать SIS self-checkpoint, если repair state ещё не покрыт externally verified recovery.

### RED
Проверить, покрывает ли current recovery новую media-distribution concept и значимое editorial state. Если нет — targeted RED self-checkpoint до назначения нового крупного приоритета.

### ШКОЛА
HQ ARH не принимает ownership школьного self-state. ZAV/LIB получают отдельную pause-preservation task. ARH может дать methodology/storage review только по отдельному запросу.

### Остальные
Не запускать checkpoint без подтверждённого change trigger. `stale_check_required`/`unknown` сначала проверять, не превращать в автоматическую массовую перезапись.

## Required result

Вернуть KOO:
- какие Entity checkpoints реально требуются;
- exact basis каждого;
- какие не требуются и почему;
- для запущенных checkpoints: addressed task/receipt state;
- KOO publication/readback receipt;
- отдельный deferred trigger для SIS после repair terminal state.

---
from_entity: KOO
to_entity: ARH
document_type: pre-reprioritization-targeted-preservation-task
status: ready_for_address_delivery
mass_checkpoint: prohibited_without_trigger
KOO_checkpoint: required
SIS_checkpoint: deferred_until_repair_terminal_state
project_time: generated_without_trusted_project_time
