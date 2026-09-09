# КООРДИНАТОР: запуск верхнего приоритета «КООПЕРАЦИЯ»

## Решение

Исследовательский контур `КООПЕРАЦИЯ` становится главным содержательным приоритетом текущего цикла проекта.

Рабочая тема шире одного автора или одной экономической доктрины: кооперация, совладение, федерации кооперативов, система Чартаева, коллективная субъектность, организационные технологии, политэкономия участия, педагогика совместной деятельности и современные worker/community-owned модели.

Материалы Бобровского рассматриваются как один важный узел, а не как граница корпуса.

## Два параллельных трека

### A. Meeting-critical

Цель: быстро получить проверяемую основу для предстоящей встречи/выступления ОПЕРАТОРА.

Минимальный результат:
- карта первичных источников;
- evidence matrix v0.1;
- 5–10 ключевых тезисов с source locator/version;
- список спорных/непроверенных утверждений;
- 3–5 существенных расхождений между моделями;
- 1–2 ограниченных совместных пилота, которые можно предложить без принятия всей идеологии другой стороны;
- reader-document и речь строятся только поверх проверенной матрицы.

### B. Long-term corpus

Цель: создать долговременную доказательную исследовательскую базу, которая переживает конкретную встречу.

Целевая структура отдельного corpus repository:
- `sources/primary/`;
- `sources/secondary/`;
- `cards/`;
- `claims/`;
- `cases/`;
- `maps/`;
- `speech/`;
- `ops/`;
- `registry/`.

Предлагаемое repository name `wellbeing-cooperation` принимается как target architecture. Проверкой GitHub подтверждено, что такого репозитория сейчас нет. Создание repo является отдельным внешним действием; до этого bootstrap-package хранится как самостоятельный артефакт и не смешивается с recovery repository.

## Исследовательский конвейер

`source intake → identity/provenance → dedupe/variant → source card → claim extraction → independent verification → contradiction map → evidence matrix → synthesis → speech/pilot`

Статусы источника, утверждения и рабочего результата не смешиваются.

## Роли текущего цикла

- KOO: приоритет, зависимости, dispatch, acceptance, evidence matrix gate.
- VOL: поиск первичных источников, source registry, dedupe/variant, candidate claims, fact-check queue, cross-linking.
- KAN: понятия, границы утверждений, классификация факт/интерпретация/гипотеза/норма, conflict map терминов и моделей.
- SHT: технологический исследовательский conveyor, handoff, failure states и критерии evidence matrix.
- RED: архитектура речи/reader-document после evidence gate; не владелец фактов.
- ARH: version/provenance/preservation mechanics корпуса и external readback, но не автор чужого исследования.
- KOD: только лёгкие инструменты registry/hash/dedupe/index после появления corpus root; не строить новую платформу раньше процесса.
- SIS: storage/runtime only when required; не отвлекать от terminal OSS Stage A cycle до acceptance.

Новая permanent Entity только ради красивой оргсхемы сейчас не создаётся. После первого доказанного inter-Entity workflow через ОСС отдельно решается, нужен ли самостоятельный `research/corpus` Entity.

## Seed corpus: уже обнаружено

File Library подтверждает наличие материалов, с которых можно начать без ожидания нового поиска:
- исторический сборник `Третий путь.pdf`, содержащий тексты Чартаева/материалы движения;
- `Система_Чартаева_как_инженерный_подход_03.docx`;
- материалы о форме/содержании системы Чартаева, результатах внедрения, вертикали и организации управления, привязке к общему результату;
- текущая research brief VOL.

Эти материалы ещё не объявляются одинаково надёжными: historical/primary fragments и поздние интерпретации должны быть разведены в registry.

## ОСС как технологический пилот этого приоритета

Stage A v0.7 после controlled repair принимается для controlled internal pilot. Первый ручной bootstrap создаёт один operational KOO instance. После этого KOO должен выполнить первый реальный request/task/route workflow через ОСС.

Предлагаемый первый inter-Entity pilot после отдельного exact onboarding `ent:VOL`:

`KOO → VOL: seed corpus registry + primary-source priority map → artifact publication → route dispatch → receipt → KOO acceptance`.

Это станет не демонстрацией ради демонстрации, а реальной работой по главному приоритету.

## Preservation boundary

- KOO pre-reprioritization checkpoint уже запущен;
- SCHOOL остаётся PAUSED и сохраняется отдельным freeze state;
- KOD/RED targeted coverage проверяет ARH;
- SIS checkpoint после terminal repair acceptance;
- mass snapshots без trigger не запускать.

## Current priority order

P0 technical gate: закончить operational client access ОСС.

P1 content: `КООПЕРАЦИЯ`, meeting-critical evidence map.

P2 corpus: bootstrap `wellbeing-cooperation` structure and registry.

P3 first ОСС inter-Entity pilot on real cooperation task.

P4 speech/reader document, затем long-term research expansion.

---
entity: KOO
artifact_role: cooperation_top_priority_launch
status: current_priority_decision
cooperation_priority: P1_CONTENT
OSS_stageA: accepted_for_controlled_internal_pilot
school_state: PAUSED
production_allowed: no
project_time: generated_without_trusted_project_time
