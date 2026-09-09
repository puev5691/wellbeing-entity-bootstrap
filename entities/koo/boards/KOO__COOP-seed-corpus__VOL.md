# КООРДИНАТОР → ВОЛОНТЁР
## КООПЕРАЦИЯ: seed corpus registry и карта первичных источников

## Задача

Выполнить первый evidence-first research pass для верхнего приоритета `КООПЕРАЦИЯ`.

Не исследовать «Бобровского вообще». Собирать поле: Чартаев/Шукты, кооперация, совладение, федеративные модели, collective agency, организационные технологии и релевантные современные практики.

## Результат 1: source registry v0.1

Для каждого найденного/доступного источника зафиксировать:
- `source_id`;
- author/title/date;
- source type: `primary | historical_collection | research | interpretation | project_case | unknown`;
- exact locator;
- version/commit или file identity, если доступно;
- SHA-256 для локально полученного файла, если технически возможно;
- access/origin;
- 3–7 строк abstract;
- themes;
- `duplicate_of / variant_of`;
- verification state;
- rights/public-copy state: `verified | claimed | unknown`.

Начать с уже обнаруженных File Library материалов и не терять различие между первичным текстом и поздней интерпретацией.

## Результат 2: meeting priority map

Выдать короткий список источников уровня:
- `must_read_before_meeting`;
- `useful_for_fact_check`;
- `background`;
- `needs_origin_verification`.

Для каждого `must_read` указать, какой вопрос встречи он помогает проверять.

## Результат 3: candidate claim queue

Не доказывать тезисы одним автором. Сформировать 10–20 candidate claims:
- claim text;
- source supporting it;
- source type;
- verification need;
- possible contradiction/counter-source;
- relevance to Благополучие/встреча.

Отдельно выделить числовые/исторические claims, требующие независимой проверки.

## Результат 4: dedupe/variant report

Для корпуса Бобровского и повторяющихся материалов найти exact/near duplicates по доступным bytes/text и не считать разницу filename доказательством новой редакции.

## Boundary

- не объявлять систему Чартаева универсально доказанной;
- не превращать late interpretation в primary source;
- не публиковать чужие работы наружу без отдельной проверки права/режима распространения;
- не создавать новый repository самостоятельно;
- не писать финальную речь;
- candidate insight помечать как candidate.

## Delivery

Вернуть KOO один пакет:
- `SOURCE-REGISTRY-v0_1.*`;
- `MEETING-SOURCE-PRIORITY-v0_1.md`;
- `CLAIM-QUEUE-v0_1.*`;
- `DEDUP-VARIANTS-v0_1.md`;
- manifest + SHA-256.

---
from_entity: KOO
to_entity: VOL
document_type: cooperation-seed-corpus-task
status: ready_for_address_delivery
priority: P1
project_time: generated_without_trusted_project_time
