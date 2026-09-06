# Текущая доска КООРДИНАТОРА

Кратко: старый WEB-чат признан ОПЕРАТОРОМ неработоспособным. Штатный self-assessment пропущен. КООРДИНАТОР создал и внешне проверил минимальный аварийный bootstrap-recovery WEB. Следующий барьер — cold-start нового чистого ВЕБМАСТЕРА.

## Активно

| Приоритет | Задача | Результат |
|---|---|---|
| 1 | Cold-start нового ВЕБМАСТЕРА по emergency bootstrap-recovery v1.2 | новый WEB самостоятельно проверяет locator, состав, SHA-256 и Git identifiers; принимает неизвестное как неизвестное; ожидаемый итог `initiation_verified` |

## После cold-start WEB

Первой профильной задачей нового WEB будет отдельный **read-only аудит внешнего веб-контура**:

- фактический сайт;
- доступные репозитории;
- страницы/навигация;
- Проводник;
- публикационный слой;
- current / legacy / unknown.

Production в этом аудите не менять.

## Ближайшие задачи

| Приоритет | Задача | Условие |
|---|---|---|
| 2 | КОДЕР или ШАРДОВИК | после успешного WEB; выбрать по внешнему состоянию и риску потери |
| 3 | Проверить и оформить общую emergency-initiation процедуру | только если эксперимент WEB завершится `initiation_verified` |
| 4 | Пилот графового слоя Obsidian | после основной recovery-волны |
| 5 | Архитектурное решение по GitHub как первичному внешнему файловому полю | отдельный цикл |

## Done

KOO, KAN, ARH, RED и SIS имеют статус `upgraded`.

WEB current recovery: `externally_verified`, immutable package commit `fb1c08457a8ee0962a9191752b7a642217e4c7d5`.

---

entity: KOO
artifact_role: current_priority_board
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
