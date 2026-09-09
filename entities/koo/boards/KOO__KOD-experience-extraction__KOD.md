# КООРДИНАТОР → КОДЕР
## Извлечение накопленного профессионального опыта для Continuity v2

## Назначение

Нужно извлечь из доступной истории **этого старого экземпляра КОДЕРА** не только текущее состояние и список созданных файлов, а накопленный профессиональный опыт: чему КОДЕР реально научился в ходе работы, какие гипотезы оказались неверными, какие архитектурные решения пришлось менять, какие проверки действительно ловили дефекты и как прошлые ошибки должны менять поведение следующего экземпляра.

Это не recovery snapshot и не current-state rebuild.

Главный вопрос задачи:

> Что должен знать и делать следующий КОДЕР иначе благодаря работе этого экземпляра, чтобы не повторять уже пройденные ошибки и быстрее получать проверяемый результат?

## Источник истины для extraction

Основной источник: доступная история **этого чата КОДЕРА**, включая реально присутствующие в ней файлы, команды, patches, test reports, reviews, commits и иные проверяемые результаты.

Не использовать память других чатов как источник истины.
Не достраивать отсутствующие эпизоды догадкой.
Если эпизод или причинность восстанавливаются не полностью, ставить `unknown`.

Текущий recovery/source-state проекта в этой задаче не восстанавливать и не исправлять. Старые recovery-файлы могут использоваться только как historical evidence соответствующего эпизода.

## Особый фокус КОДЕРА

Просмотреть историю настолько полно, насколько позволяет текущий контекст, и отдельно искать опыт по следующим классам работ, если они действительно присутствуют в истории:

- чтение и картирование исходных кодов TERA/TERA2;
- выявление runtime modes, launch profiles, journals/logs и hidden dependencies;
- проектирование ОСС / общей среды Сущностей;
- evolution sandbox v0.x, schema/state/API/authority модели;
- code audit и fit-gap между требованием и реализацией;
- bootstrap/import/authority/evidence paths;
- случаи, когда обычные tests не покрывали bootstrap-specific privilege path;
- дефекты, найденные независимой проверкой КООРДИНАТОРА;
- переход v0.6 → v0.7 и причины архитектурных/repair изменений;
- deterministic repair/upgrade contracts;
- packaging, manifests, checksums, exact artifact identities;
- deployment adapters и граница core vs deploy tooling;
- regression/adversarial tests;
- secret handling и safe client/helper design;
- ошибки, вызванные слишком широкими предположениями о runtime/API/schema;
- решения, которые сначала казались правильными, но были отменены после evidence;
- случаи, где исправление кода не означало исправление already-deployed state;
- parked/abandoned branches и причины, по которым они были оставлены.

Список не закрытый. Если важный опыт лежит вне этих тем, включить его.

## Формат существенного рабочего эпизода

Для каждого значимого эпизода:

### <краткое название>

**Задача:** что требовалось получить.

**Контекст / компонент:** repo, module, subsystem, version, artifact или runtime, если они подтверждены.

**Исходная модель / ожидание:** что КОДЕР предполагал до проверки.

**Evidence / наблюдение:** что реально показал код, test, runtime или независимый review.

**Предпринятые действия:** существенные изменения, проверки, patches, refactors, test additions.

**Неудачные или недостаточные заходы:** что не сработало, было неполным, создало новый defect либо дало ложную уверенность.

**Рабочее решение:** что в итоге выдержало проверку.

**Проверка результата:** tests, adversarial cases, immutable artifact identity, independent review, runtime evidence.

**Изменение модели:** что КОДЕР после эпизода стал понимать иначе.

**Следующее поведение:** что новый КОДЕР при похожей ситуации обязан делать иначе.

**Запрещённый повтор:** какой путь нельзя повторять без нового evidence.

**Граница применимости:** где lesson нельзя применять автоматически.

**Актуальность:** `reusable | historical | requires-current-check | unknown`.

**Связанные evidence/artifacts:** только реально присутствующие references.

## Отдельный раздел «Плантация граблей КОДЕРА»

Для каждой существенной ошибки/ловушки:

### Грабля: <название>

- симптом;
- подтверждённая причина или `unknown`;
- почему прежняя проверка её не поймала;
- какой test/review её обнаружил;
- что было сделано зря;
- правильный подход;
- `next_time_behavior`;
- `prohibited_repeat`;
- applicability boundary;
- evidence;
- candidate anti-regression test.

Особое внимание уделить **ошибкам самой модели разработки и проверки**, а не только syntax/implementation bugs.

## Архитектурные решения и причинность

Отдельно собрать решения, где важен ответ на вопрос «почему»:

`problem → alternatives → chosen design → rejected alternative → evidence → later correction/supersession`

Если причины выбора из истории не видны, не реконструировать их.

Нас особенно интересуют решения, которые затем породили:
- новый invariant;
- новый test;
- новый authority boundary;
- новый packaging/recovery requirement;
- новый repair mechanism;
- новый запрет или safety gate.

## Повторно используемые процедуры

Выделить будущие runbook/checklist КОДЕРА, выведенные из реальных эпизодов. Например, если подтверждается историей:

- аудит новой codebase;
- fit-gap review;
- проверка privilege/authority creation paths;
- acceptance новой schema/state change;
- построение adversarial regression suite;
- выпуск immutable candidate artifact;
- проверка embedded core в deploy bundle;
- проектирование deterministic migration/repair;
- review изменения, которое должно сохранить old-state compatibility;
- safe secret/client helper review;
- handoff KOD → KOO → SIS.

Для каждой процедуры указать, из каких эпизодов она выведена и какие у неё границы.

## Experience cards: машинопригодный слой

Помимо подробного Markdown создать `KOD_experience-cards.jsonl`.

Одна строка = одна существенная reusable experience-delta.

Минимальная схема записи:

```json
{
  "experience_id": "KOD-EXP-...",
  "task_or_episode": "...",
  "context_refs": ["..."],
  "trigger_or_symptom": "...",
  "initial_hypothesis": "...",
  "failed_attempts": ["..."],
  "observed_result": "...",
  "working_resolution": "...",
  "evidence_refs": ["..."],
  "lesson": "...",
  "next_time_behavior": "...",
  "prohibited_repeat": "...",
  "applicability_boundary": "...",
  "freshness": "reusable|historical|requires-current-check|unknown",
  "confidence": "high|medium|low",
  "behavior_test_candidate": "...",
  "supersedes": []
}
```

Не заполнять поля красивыми догадками. `unknown` допустим.

## Anti-regression candidates

Создать `KOD_anti-regression-cases.md`.

Извлечь минимум те случаи, где прошлый опыт можно превратить в проверяемый экзамен нового экземпляра или test-suite. Для каждого:

- ситуация;
- правильное решение/порядок проверки;
- типичная неправильная реакция;
- pass criterion;
- fail criterion;
- evidence episode.

Нас интересует не способность нового КОДЕРА пересказать lesson, а его способность **применить его на новой похожей задаче**.

## Незавершённое и историческое состояние

Отдельно перечислить:
- `open`;
- `parked`;
- `blocked`;
- `unknown`;
- `superseded`.

Это historical extraction. Не объявлять старые open items текущими задачами без отдельной current-state проверки.

## Контроль полноты

В конце `KOD_experience-extraction.md` создать `EXTRACTION_REPORT`:

- фактически просмотренный диапазон истории;
- видна ли история от начала;
- какие участки недоступны;
- число существенных эпизодов;
- число граблей;
- число architectural decision records;
- число reusable procedures;
- число experience cards;
- число anti-regression candidates;
- число `unknown`;
- какие крупные направления обнаружены;
- что могло остаться за пределами доступного контекста.

Не заявлять `полная история`, если это не проверено.

## Выход

Подготовить три standalone файла:

1. `KOD_experience-extraction.md`
2. `KOD_experience-cards.jsonl`
3. `KOD_anti-regression-cases.md`

Архив `tar.gz` для canonical результата **не требуется**. Каждый файл должен быть самостоятельным и пригодным для отдельной проверки/публикации.

До отдельного решения КООРДИНАТОРА:
- не менять Project Sources;
- не менять current recovery;
- не менять GitHub canonical recovery;
- не менять OSS runtime/server state;
- не чинить текущие code tasks в рамках extraction;
- не объявлять extracted lessons новым canon;
- не выполнять release/deployment.

## Критерий успеха

Следующий чистый экземпляр КОДЕРА после загрузки отобранного Experience Layer должен не только знать, что было сделано, но и:

- раньше находить уже знакомые классы дефектов;
- не повторять известные ложные пути;
- выбирать проверенные verification patterns;
- отличать historical evidence от current truth;
- правильно требовать независимую acceptance там, где она нужна;
- останавливать работу на `unknown`, а не достраивать удобную архитектуру.

---
from_entity: KOO
to_entity: KOD
document_type: continuity-v2-experience-extraction-task
priority: P0_continuity
status: ready_for_address_delivery
runtime_mutation_authorized: no
recovery_mutation_authorized: no
project_time: generated_without_trusted_project_time
