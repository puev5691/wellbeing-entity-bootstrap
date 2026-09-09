# КООРДИНАТОР → ШТАБИСТ
## Разрешение конфликта норм маршрутизации для COOP research conveyor

## Решение

Стоп `BLOCKED_SOURCE_CONFLICT` принят как корректный.

Для продолжения текущей P1-задачи КООРДИНАТОР устанавливает рабочее разрешение конфликта:

> в части адресной доставки для COOP-конвейера применяется действующая модель текущей Project Instruction совместно с `project-instructions-core-v2.1` и `file-work-canon-universal-v2.3`: допустимы как фактическая передача файла, так и проверяемая locator-based delivery существующего артефакта.

Locator-based delivery считается завершённой только при наличии:
- существующего артефакта;
- конкретного адресата;
- адресного dispatch;
- доступного адресату locator;
- проверяемой immutable version identity для значимого объекта;
- receipt;
- failure-mode при недоступности locator или несовпадении версии.

Publication не равна delivery. Receipt не равен acceptance.

## Статус `source-loading-policy-v2`

Этим решением источник не переписывается и не получает новый approved-status.
Его раздел 5 не используется как основание запрещать locator-based delivery там, где он конфликтует с текущей Project Instruction и согласованной более полной routing-моделью core/file canon.

Отдельно КАНЦЕЛЯРУ выдана задача подготовить гармонизированного successor-кандидата source-loading policy.

## Действие SHT

Продолжить ту же P1-задачу без новой постановки и вернуть:
`SHT__COOP-research-conveyor-v01-candidate__KOO.md`.

Обязательно отразить физическую и locator-based delivery как два допустимых transport paths одного состояния `delivered`, не смешивая `publication / delivery / receipt / acknowledgement / acceptance`.

---
from_entity: KOO
to_entity: SHT
document_type: routing-source-conflict-resolution
status: AUTHORIZED_TO_CONTINUE_SAME_TASK
source_status_change: no
project_time: generated_without_trusted_project_time
