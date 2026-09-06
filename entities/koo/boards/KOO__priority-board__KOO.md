# Текущая доска КООРДИНАТОРА

Кратко: recovery-миграция РЕДАКТОРА завершена успешным cold-start. Следующий активный профильный цикл — СИСАДМИН.

## Активно

| Приоритет | Задача | Результат |
|---|---|---|
| 1 | Assessment и миграция СИСАДМИНА на current recovery v1.2 | подтверждённый current state; существующий recovery либо current initiation + snapshot + manifest + checksums + locator; затем cold-start `initiation_verified` |

## Ближайшие задачи

| Приоритет | Задача | Условие |
|---|---|---|
| 2 | Последующие однозначно нужные рабочие Сущности ШТАБА | после SIS; по активности и риску потери состояния |
| 3 | Пилот графового слоя Obsidian | после стабилизации основной волны recovery-апгрейда |
| 4 | Архитектурное решение по GitHub как первичному внешнему файловому полю | отдельный цикл; рекомендация ARH получена |
| 5 | Сравнить варианты понятия «Мера» | после появления подтверждённого второго варианта |

## Граница кампании

- только проект «ШТАБ БЛАГОПОЛУЧИЯ»;
- сейчас поднимаются только однозначно нужные рабочие Сущности ШТАБА;
- ШКОЛА — другой проект;
- ВОЛОНТЁР — без recovery;
- ШТАБИСТ — `deferred_role_design`;
- КОНСУЛЬТАНТ не поднимать автоматически до отдельного решения о месте роли в ШТАБЕ;
- ПРОВОДНИК не включать автоматически в chat-recovery;
- Следопыт — legacy до отдельного решения.

## Done

| Результат | Подтверждение |
|---|---|
| KOO recovery v1.2 | `upgraded` |
| KAN recovery v1.2 | `upgraded` |
| ARH recovery v1.2 | `upgraded`; cold-start `initiation_verified` |
| RED recovery v1.2 | `upgraded`; cold-start `initiation_verified`; immutable commit и recovery-файлы повторно проверены КООРДИНАТОРОМ |
| Реестр recovery-апгрейда | v0.6; RED закрыт, SIS следующий |

---

entity: KOO
artifact_role: current_priority_board
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
