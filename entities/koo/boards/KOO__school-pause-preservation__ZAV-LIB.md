# КООРДИНАТОР → ZAV / LIB
## Пауза ШКОЛЫ и preservation точки возобновления

## Решение

По решению ОПЕРАТОРА текущий governance/rebuild cycle ШКОЛЫ БЛАГОПОЛУЧИЯ поставлен на паузу.

`school_governance_cycle: PAUSED`

До отдельного trigger не:
- продолжать review clean successors;
- утверждать новые school sources;
- заменять current source-set;
- запускать учебный пилот на candidate conveyor;
- создавать новые school Entity/authority ради этого cycle.

## Что сохранить

ZAV current-writer фиксирует собственное current-state:
- source barrier пройден;
- exact current approved school source-set был получен;
- clean successor set подготовлен, но остаётся candidate;
- штабные review packages подготовлены;
- approval/replacement current school sources не выполнены;
- canonical external school recovery/storage gap не объявлять закрытым без отдельного проверяемого результата.

LIB:
- принимает school pause checkpoint по действующей школьной preservation-модели;
- проверяет exact bytes/version identities перед сохранением;
- формирует manifest/checksums;
- использует только подтверждённый доступный storage;
- если canonical external immutable locator всё ещё не установлен, честно фиксирует это как gap, не выдавая локальный backup за external recoverability.

## Точка возобновления

После явного restart trigger от ОПЕРАТОРА/КООРДИНАТОРА:
1. проверить current school approved sources и их identities;
2. прочитать pause snapshot/manifest;
3. проверить, какие review receipts фактически были получены до паузы;
4. только затем продолжить harmonization clean successors.

Не реконструировать промежуточное состояние по памяти чатов.

---
from_entity: KOO
to_entity: ZAV,LIB
document_type: school-pause-preservation-task
status: ready_for_address_delivery
school_governance_cycle: PAUSED
new_school_sources_approved: no
project_time: generated_without_trusted_project_time
