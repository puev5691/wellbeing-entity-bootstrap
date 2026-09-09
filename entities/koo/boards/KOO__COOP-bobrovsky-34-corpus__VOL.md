# КООРДИНАТОР → ВОЛОНТЁР
## Полная обработка корпуса Бобровского: 34 входных файла

## Назначение

Корпус из 34 файлов, уже загруженный ОПЕРАТОРОМ в текущий рабочий контекст ВОЛОНТЁРА, становится отдельной приоритетной веткой контура `КООПЕРАЦИЯ`.

Цель не в том, чтобы выбрать из корпуса несколько удобных текстов. Нужно обработать **весь входной набор 34/34**, нормализовать его, отделить дубликаты и редакции, извлечь идеи/claims/термины/механизмы и подготовить GitHub-ready пакет для будущего `wellbeing-cooperation`.

## Source gate

Authoritative input этой задачи: именно 34 файла, уже переданные ОПЕРАТОРОМ ВОЛОНТЁРУ.

Первое действие ВОЛОНТЁРА:
1. составить exact inventory всех входных файлов;
2. зафиксировать `count_received`;
3. если получено не 34 файла, остановить full-corpus acceptance и вернуть `BLOCKED_INPUT_SET_MISMATCH` со списком missing/extra;
4. не заменять отсутствующий файл догадкой, File Library-копией или близкой редакцией без отдельной маркировки provenance.

## Рабочий аналитический протокол

Использовать принятый KOO рабочий фильтр KAN для текущего COOP-цикла:

`source-specific meaning → claim class → evidence strength → limits/conflicts`.

Не превращать авторское утверждение в факт. Различать минимум:
- `fact`;
- `primary-source statement`;
- `interpretation`;
- `hypothesis`;
- `normative proposal`;
- `analogy`;
- `pilot assumption`.

## Обязательная обработка каждого файла

Для каждого входного файла создать запись, содержащую:
- original filename;
- SHA-256, если raw bytes доступны ВОЛОНТЁРУ;
- формат;
- автор/составитель, если это подтверждается самим источником;
- название;
- датировку или `unknown`;
- provenance;
- source role: `primary | later-author-text | secondary-project | compilation | unknown`;
- краткий abstract;
- тематические теги;
- ключевые термины;
- основные claims с классом;
- механизмы/процессы, если описаны;
- количественные/исторические/юридические claims, требующие проверки;
- связи с Чартаевым, кооперацией и проектом «Благополучие»;
- duplicate/variant relationship;
- meeting relevance;
- long-term research relevance;
- publication-rights status.

## Dedupe / variant

Сделать отдельную карту:

`exact duplicate | near duplicate | revision | derivative | compilation overlap | independent work | unknown`.

Exact duplicate заявлять только при byte/hash equality либо иной достаточной проверке exact identity.

Похожие заголовки и похожий текст сами по себе не являются доказательством exact duplicate.

## Производные материалы

Подготовить минимум:

1. `registry/BOBROVSKY-SOURCE-REGISTRY.jsonl`
   - одна запись на каждый из 34 входных файлов;
   - после dedupe логические работы могут иметь отдельный `work_id`, но исходные 34 записи не исчезают.

2. `maps/BOBROVSKY-dedupe-and-variants.md`
   - группы дублей/редакций;
   - что считать базовой редакцией и почему;
   - unresolved variants.

3. `cards/`
   - отдельная source-card на каждую логическую работу/существенную редакцию.

4. `summaries/`
   - плотное содержательное резюме каждой логической работы;
   - не рекламный пересказ, а структура аргумента, механизмов, предпосылок и ограничений.

5. `claims/BOBROVSKY-CLAIMS.jsonl`
   - claim_id;
   - source/work_id;
   - claim text;
   - class;
   - locator;
   - evidence strength;
   - needs_check;
   - conflicts/limits.

6. `maps/BOBROVSKY-theme-map.md`
   Минимум ветки:
   - система Чартаева;
   - собственность / совладение;
   - общественный капитал;
   - наёмный труд / отчуждение;
   - НПЭ / НЭТ / НЭМ;
   - коллективный/общественный субъект;
   - организационные технологии;
   - федерация / представительство / делегирование;
   - управление и ответственность;
   - идеология / суверенитет / власть;
   - построение движения/Союза;
   - пилоты и практическое внедрение.

7. `maps/BOBROVSKY-project-relevance.md`
   Для каждой сильной идеи:
   - что именно предлагается/утверждается;
   - чем это похоже на «Благополучие»;
   - чем отличается;
   - что можно использовать как исследовательский lead;
   - что нельзя принимать без проверки;
   - possible pilot.

8. `maps/BOBROVSKY-chronology.md`
   - только подтверждённые датировки;
   - `unknown` вместо реконструкции.

9. `meeting/BOBROVSKY-meeting-critical.md`
   - 10–20 наиболее полезных для встречи идей/claims;
   - точный source/work locator;
   - class/evidence;
   - возможный вопрос Бобровскому;
   - возможный comparison с проектом;
   - что требует независимого fact-check.

10. `quotes/BOBROVSKY-quote-bank.md`
    - только короткие цитаты, действительно нужные для анализа/выступления;
    - точный locator и контекст;
    - не превращать quote-bank в копию произведений.

11. `rights/BOBROVSKY-rights-registry.md`
    Для каждого source/work:
    - `confirmed_publication_allowed`;
    - `publicly_available_but_republication_rights_unverified`;
    - `operator-provided_private_source`;
    - `unknown`.

    Факт открытого доступа не приравнивать автоматически к разрешению перепубликовать полный текст.

## GitHub-ready layout

Собрать результат в структуру, совместимую с будущим `wellbeing-cooperation`:

- `sources/bobrovsky/registry/`
- `sources/bobrovsky/cards/`
- `sources/bobrovsky/summaries/`
- `sources/bobrovsky/claims/`
- `sources/bobrovsky/maps/`
- `sources/bobrovsky/meeting/`
- `sources/bobrovsky/quotes/`
- `sources/bobrovsky/rights/`

### Public-safe boundary

Подготовить два явных списка:

`PUBLIC-MANIFEST.md`
- производные материалы, которые можно публиковать без копирования полного исходного текста;
- source cards, summaries, claim registry, maps, short quote-bank, locators.

`SOURCE-BINARY-MANIFEST.md`
- какие оригиналы можно выложить только после подтверждения права на републикацию;
- какие вместо этого должны оставаться как external locator/reference.

Не включать полный текст произведения в public-ready слой, если право на его публикацию не подтверждено.

## Acceptance criteria

Работа считается готовой только если:
- coverage = `34/34` входных файлов;
- у каждого входного файла есть provenance/status record;
- dedupe/variant map существует;
- source cards и summaries покрывают все логические работы;
- claims имеют классы и locators;
- meeting-critical selection существует;
- rights registry существует;
- GitHub-ready tree собран;
- `MANIFEST.md` и `SHA256SUMS.txt` проверены;
- итоговый архив проходит внутреннюю checksum verification.

## Итоговый пакет

Вернуть КООРДИНАТОРУ:

`VOL__BOBROVSKY-corpus-v0_1__KOO.tar.gz`

и отдельный receipt:

`VOL__BOBROVSKY-corpus-v0_1-receipt__KOO.md`

Receipt должен содержать:
- `input_files_received`;
- `coverage`;
- число logical works;
- exact duplicates;
- near/revision groups;
- claims extracted;
- rights-status counts;
- meeting-critical items;
- unresolved/unknown;
- archive SHA-256;
- internal checksum result;
- `ready_for_repo_staging: yes|no`.

## Boundary

ВОЛОНТЁР не:
- утверждает научную/экономическую истинность авторских claims;
- превращает позднюю интерпретацию в первичный источник;
- создаёт Project Source;
- публикует пакет на GitHub до отдельного route/approval;
- перепубликовывает полный текст при непроверенных правах.

---
from_entity: KOO
to_entity: VOL
document_type: COOP_Bobrovsky_full_corpus_normalization_task
priority: P0_content_parallel
status: ready_for_address_delivery
required_input_coverage: 34_of_34
repo_target: wellbeing-cooperation
publication_now: no
project_time: generated_without_trusted_project_time
