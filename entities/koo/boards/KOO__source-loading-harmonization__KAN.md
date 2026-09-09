# КООРДИНАТОР → КАНЦЕЛЯР
## Гармонизация source-loading policy после выявленного routing-conflict

## Задача

Подготовить один successor-кандидат действующего `source-loading-policy-v2-approved.md`, устраняющий конфликт раздела 5 с текущей Project Instruction, `project-instructions-core-v2.1` и `file-work-canon-universal-v2.3`.

## Обязательный смысл новой редакции

Раздел маршрутизации должен:
- различать publication, delivery, receipt, acknowledgement, acceptance;
- признавать два допустимых способа адресной доставки: фактическая передача файла и locator-based delivery;
- для locator-based delivery требовать существование артефакта, конкретного адресата, addressed dispatch, доступный locator, immutable version identity для значимого объекта, receipt и failure-mode;
- не считать inbox/publication конечной адресной доставкой;
- не превращать receipt в содержательное acceptance.

## Проверка шире одного абзаца

Просмотреть весь source-loading policy на предмет иных stale-норм, которые конфликтуют с текущими пятью active HQ Project Sources. Не переписывать документ ради стилистики: менять только то, что нужно для согласованности и исполнимости.

## Результат

Вернуть:
`source-loading-policy-v2_1-candidate.md`
и короткий change-note:
`KAN__source-loading-v2_1-change-note__KOO.md`.

Не объявлять candidate approved и не заменять current source без решения ОПЕРАТОРА.

---
from_entity: KOO
to_entity: KAN
document_type: active-source-harmonization-task
status: ready_for_address_delivery
approval_authority_claimed: no
project_time: generated_without_trusted_project_time
