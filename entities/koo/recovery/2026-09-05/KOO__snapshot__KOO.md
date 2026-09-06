# Snapshot КООРДИНАТОРА

## Назначение

Фиксирует подтверждённое состояние КООРДИНАТОРА после первого цикла апгрейда Сущностей под recovery v1.2 и уточнения ОПЕРАТОРОМ границ текущей recovery-кампании.

Сущность: KOO / КООРДИНАТОР  
Каталог recovery: `entities/koo/recovery/2026-09-05/`  
Репозиторий: `puev5691/wellbeing-entity-bootstrap`

## Подтверждённое состояние

Гармонизация источников v2 завершена. ОПЕРАТОР утвердил A+B+C, Project Sources и Project Instructions заменены и проверены. КООРДИНАТОР и КАНЦЕЛЯР приведены к recovery v1.2.

ОПЕРАТОР согласовал конвейер апгрейда Сущностей: единый реестр locator/статусов, затем отдельная миграция одной Сущности за цикл, публикация, внешняя проверка и cold-start.

## Граница текущей recovery-кампании

ОПЕРАТОР уточнил:

- текущая задача касается **только проекта «ШТАБ БЛАГОПОЛУЧИЯ»**;
- **ШКОЛА БЛАГОПОЛУЧИЯ** — другой проект и в текущий recovery-upgrade не входит;
- **ВОЛОНТЁР** — утилитарный чат для случайных, простых и учебных вопросов; отдельные initiation, snapshot и recovery для него не нужны.

Версия реестра v0.1 была исправлена. Текущая версия:

`entities/koo/boards/KOO__entity-recovery-registry__KOO.md`

Версия: `v0.2`.

## Ключевые результаты реестра v0.2

- KOO — `upgraded`;
- KAN — `upgraded`;
- ARH — `legacy_recovery_assessed`;
- RED — `bootstrap_only`;
- SIS / WEB / KOD / SHD / KON — recovery в аудите не подтверждён;
- SHT — `blocked_missing_role`;
- SHK — `out_of_scope_other_project`;
- VOL — `utility_chat_no_recovery`;
- ПРОВОДНИК БЛАГОПОЛУЧИЯ не включается автоматически в chat-recovery;
- legacy-профиль «Следопыт» требует отдельного разбора.

`not_confirmed` не означает доказанное отсутствие локальных или ещё не опубликованных файлов.

## АРХИВАРИУС

Для ARH подтверждены:

- bootstrap `packages/core/arhivarius-v01/`;
- полный snapshot `arhivarius-current-chat-snapshot-v01/`;
- дельта-snapshot `arhivarius-current-chat-snapshot-v02/`;
- initiation-backup в v02.

README v02 требует для полного восстановления v01 + v02 + актуальные project sources + recovery policy.

В v02 нет `sha256sums.txt` и отдельного формализованного recovery-manifest v1.2.

Следующий цикл должен свести подтверждённое состояние ARH в current recovery v1.2, сохранив v01/v02 как provenance.

## РЕДАКТОР

В `packages/core/redaktor-v01/` существует bootstrap v0.1 со статусом `working`. Он предназначен для инициации нового чата/handoff, но не доказывает текущее состояние РЕДАКТОРА и не является recovery v1.2.

RED идёт после обкатки процесса на ARH.

## Текущий главный приоритет

> assessment и миграция АРХИВАРИУСА на recovery v1.2.

Критерий результата:

- current initiation;
- current snapshot;
- recovery-manifest;
- `sha256sums.txt`;
- внешний locator;
- повторная проверка внешней копии;
- cold-start с итогом `initiation_verified`.

## Ближайшие, но не активные задачи

Пилот графового слоя Obsidian остаётся приоритетом №2 после стабилизации ближайшего recovery-апгрейда.

Сравнение вариантов понятия «Мера» остаётся pending до появления подтверждённого второго варианта.

«Копное право и локальное самоуправление» остаётся `research / parked_with_trigger`.

## Не подтверждено

Не считать установленными текущее состояние ПО АРХИВАРИУСА и ПОЧТАЛЬОНА, наличие общего автоматического backup и актуальность старых абсолютных путей без отдельной проверки.

## Следующий безопасный шаг

Не мигрировать другие Сущности массово. Начать отдельный профильный цикл ARH с проверки его текущего чата и сведения v01/v02 в current recovery.

---

entity: KOO  
artifact_role: recovery_snapshot  
work_subject: entity-recovery-upgrade; obsidian-graph-pilot; pending-measure; parked-research  
status: current_snapshot  
project_scope: ШТАБ БЛАГОПОЛУЧИЯ  
project_time: generated_without_trusted_project_time
