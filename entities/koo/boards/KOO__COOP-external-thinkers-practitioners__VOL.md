# КООРДИНАТОР → ВОЛОНТЁР
## Внешний разведывательный контур: мыслители, практики и институты кооперации

## Назначение

Параллельно с обработкой корпуса Бобровского открыть широкий внешний поиск по истории, теории и практике кооперации, совладения, коллективной субъектности, самоуправления и экономической демократии.

Задача не в составлении списка «великих имён». Нужен GitHub-ready исследовательский слой:

`понятие/механизм → автор/практик/организация → первичный источник → claim → evidence → критика/ограничения → связь с COOP → пригодность для дальнейшей проверки/пилота`.

Статус: `P0 parallel research branch`.

## Правило поиска

Искать широко, но не смешивать уровни доказательства.

- biography/reference page не заменяет primary source;
- пересказ не превращается в факт;
- популярность автора не повышает evidence strength;
- одинаковые термины не считать одинаковыми механизмами;
- различать `theory`, `institutional design`, `historical case`, `current practice`, `critique`;
- `unknown` допустим и предпочтительнее догадки.

Рабочий аналитический фильтр:

`source-specific meaning → claim class → evidence strength → limits/conflicts`.

## Поисковые линии

Покрыть минимум следующие линии, не считая список закрытым:

1. классическая кооперативная мысль и ранняя практика;
2. взаимопомощь, mutualism, mutual societies и mutual banking;
3. федерализм, subsidiarity, polycentric governance;
4. worker ownership, worker cooperatives, labor-managed firms;
5. economic democracy / industrial democracy / codetermination;
6. self-management / autogestion / производственное самоуправление;
7. commons / common-pool resources / common ownership;
8. social ownership / collective ownership / community ownership;
9. solidarity economy / social economy / community wealth building;
10. participatory economics и механизмы участия в распределении/управлении;
11. cooperative finance, credit unions, mutual insurance, cooperative banking;
12. cooperative federations, secondary cooperatives, cooperative ecosystems;
13. indivisible reserves, common capital, member capital, patronage distribution;
14. community land trusts и иные режимы коллективного владения инфраструктурой;
15. platform cooperativism, digital commons и современные цифровые формы;
16. коллективная субъектность, group agency, collective action, institution building;
17. образование/педагогика совместной деятельности и формирование ответственного участника;
18. успешные и провальные кейсы масштабирования кооперативных систем.

## Seed-набор имён и кейсов

Это только поисковые маяки, не канон и не утверждение релевантности каждого пункта:

- Robert Owen;
- Rochdale Pioneers;
- Charles Fourier;
- Pierre-Joseph Proudhon;
- Peter Kropotkin;
- G. D. H. Cole / guild socialism;
- Karl Polanyi;
- Elinor Ostrom;
- José María Arizmendiarrieta и Mondragon;
- Jaroslav Vanek и теория labor-managed firms;
- Emilia-Romagna cooperative ecosystem;
- Quebec social economy;
- worker-coop / CICOPA tradition;
- ICA cooperative principles;
- ILO cooperative framework;
- community wealth building / anchor institutions;
- platform cooperativism;
- participatory economics;
- Yugoslav self-management experience;
- kibbutz / moshav как отдельные исторические организационные кейсы;
- credit-union / mutual-insurance traditions;
- кооперативные федерации разных стран.

При поиске добавлять новых авторов/практиков, если они реально вводят отличный механизм или сильный критический аргумент.

## Ключевые поисковые термины

Использовать русские и английские варианты, а при высокой ценности источника искать оригинальный язык:

`кооперация`, `кооператив`, `совладение`, `общественный капитал`, `коллективная собственность`, `самоуправление`, `экономическая демократия`, `производственная демократия`, `федерация кооперативов`, `субсидиарность`, `взаимопомощь`, `коллективный субъект`, `участие`, `общий результат`, `распределение surplus`, `неотчуждаемые резервы`, `кооперативный капитал`;

`cooperation`, `cooperative`, `cooperative commonwealth`, `worker cooperative`, `worker ownership`, `employee ownership`, `labor-managed firm`, `economic democracy`, `industrial democracy`, `self-management`, `autogestion`, `mutualism`, `mutual aid`, `mutual banking`, `commons governance`, `common-pool resources`, `common ownership`, `social ownership`, `community ownership`, `collective ownership`, `solidarity economy`, `social economy`, `community wealth building`, `cooperative federation`, `secondary cooperative`, `polycentric governance`, `subsidiarity`, `member economic participation`, `indivisible reserves`, `patronage refund`, `cooperative finance`, `credit union`, `community land trust`, `platform cooperativism`, `digital commons`, `group agency`, `collective action`, `collective intentionality`.

## Source priority

Приоритет источников:

1. original works / primary documents / constitutions / bylaws / reports / datasets;
2. официальные материалы кооперативов, федераций и институтов;
3. академические статьи, книги, университетские и исследовательские публикации;
4. качественные исторические и критические обзоры;
5. журналистика и популярные материалы только как навигация к первичным источникам.

Для каждого сильного исторического/экономического claim по возможности искать независимое подтверждение.

## Обязательная карточка человека/организации/кейса

Минимум:

- `subject_id`;
- имя/название;
- годы/период;
- страна/контекст;
- роль: `thinker | practitioner | organization | movement | case | critic`;
- ключевые механизмы;
- ключевые термины;
- primary sources;
- best secondary sources;
- candidate claims;
- evidence strength;
- known criticism / failure modes;
- связь с Бобровским/Чартаевым/COOP;
- различия, которые нельзя замазывать;
- практическая ценность для «Благополучия»;
- publication/provenance state.

## GitHub-ready результат

Подготовить один пакет:

`VOL__COOP-external-scout-v0_1__KOO.tar.gz`

Рекомендуемая структура:

- `registry/EXTERNAL-SOURCE-REGISTRY.jsonl`
- `registry/SUBJECT-REGISTRY.jsonl`
- `registry/CLAIM-QUEUE.jsonl`
- `maps/CONCEPT-MAP.md`
- `maps/PEOPLE-AND-PRACTICE-MAP.md`
- `maps/CASE-MAP.md`
- `maps/CRITICISM-FAILURE-MAP.md`
- `cards/people/*.md`
- `cards/organizations/*.md`
- `cards/cases/*.md`
- `sources/PRIMARY-SOURCE-INDEX.md`
- `sources/SECONDARY-SOURCE-INDEX.md`
- `PUBLIC-MANIFEST.md`
- `README.md`
- `SHA256SUMS.txt`

Не копировать полные чужие тексты в пакет без подтверждённого права на публикацию. Для внешнего корпуса по умолчанию достаточно locator + metadata + собственная карточка/анализ, пока rights basis не установлен.

## Coverage gate первой итерации

Первая итерация считается содержательно достаточной, когда:

- покрыты все основные поисковые линии либо явно зафиксировано `no_material_found`;
- есть минимум 3 качественных источника разных типов на каждую высокоприоритетную линию, где это реально возможно;
- выделены минимум 20 наиболее ценных субъектов/кейсов с primary-source locator;
- есть отдельная карта критики и провалов, а не только успешные примеры;
- обнаруженные совпадения с Бобровским/Чартаевым оформлены как comparison candidates, а не как доказанное тождество;
- материалы подготовлены к размещению в `puev5691/wellbeing-cooperation` после KOO review.

## Параллельность

Эта ветка не ждёт завершения source-gate по 34 файлам Бобровского и не заменяет его. Работы идут параллельно.

По source-gate Бобровского сохраняется отдельный blocker: authoritative exact input set 34/34 пока не подтверждён; найдено 45 file identities при 33 именах. Его не разрешать догадкой.

---
from_entity: KOO
to_entity: VOL
document_type: COOP_external_thinkers_practitioners_research_task
priority: P0
parallel_with: BOBROVSKY_corpus + COOP_evidence_matrix
repository_target: puev5691/wellbeing-cooperation
publication_policy: open_by_default_with_rights_gate_for_external_fulltexts
project_time: generated_without_trusted_project_time
