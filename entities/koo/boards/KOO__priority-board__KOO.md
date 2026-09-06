# Текущая доска КООРДИНАТОРА

Кратко: recovery-миграция СИСАДМИНА завершена успешным cold-start. Следующий активный профильный цикл — ВЕБМАСТЕР.

## Активно

| Приоритет | Задача | Результат |
|---|---|---|
| 1 | Assessment и миграция ВЕБМАСТЕРА на current recovery v1.2 | подтверждённый current state; существующий recovery либо current initiation + snapshot + manifest + checksums + locator; затем cold-start `initiation_verified` |

## Ближайшие задачи

| Приоритет | Задача | Условие |
|---|---|---|
| 2 | КОДЕР или ШАРДОВИК | после WEB; выбрать по фактически обнаруженному состоянию и риску потери |
| 3 | Пилот графового слоя Obsidian | после основной recovery-волны |
| 4 | Архитектурное решение по GitHub как первичному внешнему файловому полю | отдельный цикл |
| 5 | Сравнить варианты понятия «Мера» | после подтверждённого второго варианта |

## Done

| Результат | Подтверждение |
|---|---|
| KOO | `upgraded` |
| KAN | `upgraded` |
| ARH | `upgraded` |
| RED | `upgraded` |
| SIS | `upgraded`; cold-start `initiation_verified`; `secrets_detected: no`; `production_changes: none` |

## Граница кампании

- только проект «ШТАБ БЛАГОПОЛУЧИЯ»;
- ШКОЛА — другой проект;
- ВОЛОНТЁР — без recovery;
- ШТАБИСТ — `deferred_role_design`;
- КОНСУЛЬТАНТ не поднимать автоматически;
- ПРОВОДНИК не включать автоматически в chat-recovery;
- Следопыт — legacy до отдельного решения.

---
entity: KOO
artifact_role: current_priority_board
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
