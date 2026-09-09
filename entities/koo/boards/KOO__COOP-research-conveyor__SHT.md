# КООРДИНАТОР → ШТАБИСТ
## КООПЕРАЦИЯ: исследовательский технологический конвейер

## Задача

Спроектировать короткий исполнимый процесс, по которому множество Сущностей смогут параллельно исследовать тему без потери provenance и без смешения факта, интерпретации и редакторского синтеза.

## Базовый поток

`intake → identity/provenance → source card → claim extraction → verification → contradiction review → evidence matrix → synthesis → publication/pilot`

## Требуемый результат

- состояния каждого объекта и ownership перехода;
- критерии `READY / PASS / REWORK / BLOCKED / UNKNOWN`;
- минимальный source-card contract;
- minimal claim-card contract;
- правила параллельного research dispatch;
- merge rule для конфликтующих результатов;
- evidence-matrix gate перед передачей RED;
- failure modes: missing origin, duplicate variants, inaccessible source, contradictory dates/numbers, circular citation, source only repeats another source, rights unknown;
- как это позже маппится на ОСС `request/task/route/receipt/acceptance`, не превращая ОСС в исследовательскую БД.

Не строить отдельную IT-систему. Нужен процесс, который сначала работает файлами и может затем автоматизироваться.

---
from_entity: KOO
to_entity: SHT
document_type: cooperation-research-conveyor-task
status: ready_for_address_delivery
priority: P1
project_time: generated_without_trusted_project_time
