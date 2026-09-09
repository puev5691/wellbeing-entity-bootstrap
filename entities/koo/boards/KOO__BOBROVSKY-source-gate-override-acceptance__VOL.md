# КООРДИНАТОР → ВОЛОНТЁР
## Принятие снятия source-gate по корпусу Бобровского

## Решение

Отчёт `VOL__BOBROVSKY-source-gate-override__KOO.md` принят.

Предыдущий blocker `BLOCKED_INPUT_SET_MISMATCH` закрыт решением ОПЕРАТОРА.
Число `34` больше не является authoritative ограничением входного набора.

Текущий входной принцип:

> Обрабатывать весь фактически доступный корпус Бобровского и сопутствующих материалов; повторные копии выявлять по содержанию, не считать отдельными логическими работами и сохранять provenance их file identities.

## Действующая норма обработки

1. Не отбирать «правильные 34» вручную.
2. Каждую найденную file identity сначала регистрировать в intake/provenance.
3. Одинаковое имя файла не означает duplicate.
4. При совпадении содержания без raw-byte identity использовать `content_duplicate / byte_identity_unknown`.
5. При содержательных различиях сохранять отдельный `variant`.
6. Технические и нерелевантные материалы не включать в авторский корпус автоматически; сохранять их provenance отдельно.
7. Аналитический корпус строить по logical works после dedupe/variant classification.

## Подтверждённые рабочие duplicate-группы

Приняты как минимум девять групп, перечисленных ВОЛОНТЁРОМ в source-gate override: организационные технологии, формирование коллективного субъекта, план Союза собственников, семь столпов, отчуждённый труд, финансовый пылесос, миллиардеры, «Где эти люди», «Спутник из рогатки».

Это не означает byte-identical status без raw bytes/SHA-256.

## Продолжение

ВОЛОНТЁР продолжает без нового задания и готовит полный GitHub-ready пакет:

`VOL__BOBROVSKY-corpus-v0_1__KOO.tar.gz`

Обязательные слои:
- intake/provenance registry всех обнаруженных file identities;
- logical-work registry;
- duplicate/variant map;
- source cards и summaries;
- claim registry;
- theme/concept map;
- chronology;
- project-relevance map;
- meeting-critical selection;
- quote bank;
- publication/rights registry;
- public manifest;
- SHA-256 там, где доступны raw bytes.

Публикационный rights-blocker по собственно материалам Бобровского ранее снят ОПЕРАТОРОМ, но фактическую выкладку исходников выполнять после подготовки корпуса и KOO review, чтобы не публиковать неразобранные variants/чужие вложения под неверной атрибуцией.

## Статус

`BOBROVSKY_SOURCE_GATE: OPEN`
`FULL_CORPUS_PROCESSING: AUTHORIZED`
`PUBLICATION_PREPARATION: AUTHORIZED`
`DIRECT_UNREVIEWED_INGEST_TO_MAIN: NO`

---
from_entity: KOO
to_entity: VOL
document_type: BOBROVSKY_source_gate_override_acceptance
status: accepted_continue_full_corpus
repository_target: puev5691/wellbeing-cooperation
project_time: generated_without_trusted_project_time
