# КООРДИНАТОР → АРХИВАРИУС
## Targeted preservation trigger после terminal repair ОСС и смены приоритета

## Событие

SIS controlled repair ОСС v0.7 завершён `PASS` и принят KOO как `ACCEPTED_FOR_CONTROLLED_INTERNAL_PILOT`.

Одновременно ОПЕРАТОР установил новый top content priority: `КООПЕРАЦИЯ`.

## Действие ARH

1. SIS: terminal repair state является trigger. Проверить current SIS recovery coverage; если repair/release/backup/audit/final readback не входят в externally verified recovery, запросить self-checkpoint SIS current-writer.
2. KOO: pre-reprioritization checkpoint уже запущен. Если он ещё не опубликован/readback-verified, включить через current-writer update новые facts: Stage A acceptance, first operational instance pilot task, top priority `КООПЕРАЦИЯ`. Не переписывать KOO self-state самостоятельно.
3. VOL/RED/KAN/SHT: не массово снапшотить. Trigger только если перед переключением/новым крупным research assignment у current-writer есть substantial unpublished state.
4. SCHOOL остаётся PAUSED по отдельному freeze checkpoint.

Preservation не блокирует meeting-critical research intake, если recovery/authority конкретной задачи не зависит от незакрытого checkpoint.

---
from_entity: KOO
to_entity: ARH
document_type: targeted-preservation-trigger-after-OSS-repair-and-reprioritization
status: ready_for_address_delivery
SIS_checkpoint_trigger: yes_if_not_already_covered
KOO_checkpoint_update: yes_if_current_checkpoint_not_finalized
mass_checkpoint: no
project_time: generated_without_trusted_project_time
