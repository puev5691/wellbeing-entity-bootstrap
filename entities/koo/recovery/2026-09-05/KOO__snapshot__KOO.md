# Snapshot КООРДИНАТОРА

## Назначение

Фиксирует подтверждённое состояние КООРДИНАТОРА после первого цикла апгрейда Сущностей под recovery v1.2 и уточнения ОПЕРАТОРОМ состава текущей recovery-кампании.

Сущность: KOO / КООРДИНАТОР  
Каталог recovery: `entities/koo/recovery/2026-09-05/`  
Репозиторий: `puev5691/wellbeing-entity-bootstrap`

## Подтверждённое состояние

Гармонизация источников v2 завершена. ОПЕРАТОР утвердил A+B+C, Project Sources и Project Instructions заменены и проверены. КООРДИНАТОР и КАНЦЕЛЯР приведены к recovery v1.2.

ОПЕРАТОР согласовал конвейер апгрейда Сущностей: единый реестр locator/статусов, затем отдельная миграция одной Сущности за цикл, публикация, внешняя проверка и cold-start.

## Граница текущей recovery-кампании

ОПЕРАТОР уточнил:

- текущая задача касается **только проекта «ШТАБ БЛАГОПОЛУЧИЯ»**;
- сейчас поднимаются только Сущности, которые однозначно должны работать в ШТАБЕ;
- **ШКОЛА БЛАГОПОЛУЧИЯ** — другой проект и в текущий recovery-upgrade не входит;
- **ВОЛОНТЁР** — утилитарный чат для случайных, простых и учебных вопросов; отдельные initiation, snapshot и recovery для него не нужны;
- **ШТАБИСТ** задуман для внутреннего административно-организационного контура по типу КАНЦЕЛЯРА, но пока не проектируется и не мигрируется. Вернуться к нему после подъёма основных рабочих Сущностей.

Текущий реестр:

`entities/koo/boards/KOO__entity-recovery-registry__KOO.md`

Версия: `v0.3`.

## Ключевые результаты реестра v0.3

- KOO — `upgraded`;
- KAN — `upgraded`;
- ARH — `legacy_recovery_assessed`;
- RED — `bootstrap_only`;
- SIS / WEB / KOD / SHD / KON — recovery в аудите не подтверждён;
- SHT — `deferred_role_design`;
- SHK — `out_of_scope_other_project`;
- VOL — `utility_chat_no_recovery`;
- ПРОВОДНИК БЛАГОПОЛУЧИЯ не включается автоматически в chat-recovery;
- legacy-профиль «Следопыт» требует отдельного разбора.

`not_confirmed` не означает доказанное отсутствие локальных или ещё не опубликованных файлов.

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

## Следующий безопасный шаг

Не проектировать ШТАБИСТА и не расширять кампанию на соседние проекты/утилитарные чаты. Начать отдельный профильный цикл ARH, затем двигаться по очереди однозначно нужных рабочих Сущностей ШТАБА.

---

entity: KOO  
artifact_role: recovery_snapshot  
work_subject: entity-recovery-upgrade; obsidian-graph-pilot; pending-measure; parked-research  
status: current_snapshot  
project_scope: ШТАБ БЛАГОПОЛУЧИЯ  
project_time: generated_without_trusted_project_time
