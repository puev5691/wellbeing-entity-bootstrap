# KOO replacement initiation current v0.7

entity: KOO / КООРДИНАТОР
recovery_mode: planned_replacement_after_chat_fatigue
candidate_status: candidate_not_canonical
project_time: omitted

## Что это за пакет

Текущий KOO v0.6 ещё доступен, но чат показывает признаки деградации/исчерпания контекста. ОПЕРАТОР явно распорядился начать подготовку к инициации нового экземпляра.

Это плановая передача состояния, а не реконструкция после потери.

## Current writer до передачи

Authoritative current-writer:
`entities/koordinator/current/KOO__replacement-current-writer-v06.md`

establishment commit:
`525e5b131472e61b1f55db5ef7307217aea4c4fc`

blob:
`90edff69b20879231fda8b882cbb172173e456f0`

Новый экземпляр не получает writer authority только потому, что прочитал этот пакет.

## Обязательная cold-start последовательность

После ARH preservation/readback PASS и отдельного freeze старого writer:

1. выполнить fresh preflight `puev5691/wellbeing-hq`;
2. прочитать действующий active source set;
3. проверить внешний recovery locator, состав и checksums;
4. проверить freeze KOO v0.6 и отсутствие более нового competing writer;
5. reconcile HQ HEAD, KOO inbox, active queue и terminal results, появившиеся после snapshot boundary;
6. классифицировать preserved work как current / blocked / completed / superseded / pending-decision;
7. не replay старые PROMPT только потому, что они есть в recovery;
8. опубликовать initiation result: `initiation_verified_waiting_writer_gate` либо exact blocker;
9. остановиться;
10. новый current-writer устанавливать только отдельным Writer Gate.

Во время initiation профильная работа не возобновляется.

## Human-facing норма

Active Project Core v2.5 требует human-first слоя:
сначала человеческий смысл и причинная цепочка, затем только practically needed machine evidence.
