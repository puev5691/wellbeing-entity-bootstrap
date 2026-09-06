# Текущая доска КООРДИНАТОРА

Кратко: текущий экземпляр KOO отправляется на clean re-init из-за признаков рассинхронизации состояния. Перед заменой состояние сохраняется и recovery обновляется.

## Активно

| Приоритет | Задача | Проверяемый результат |
|---|---|---|
| 1 | Clean cold-start нового КООРДИНАТОРА | `initiation_verified` по обновлённому внешнему recovery; новый экземпляр видит SHT=`upgraded` и active development общей среды |

## Сразу после KOO cold-start

| Приоритет | Задача | Проверяемый результат |
|---|---|---|
| 2 | Продолжить организационный слой общей среды Сущностей | SHT получает semantic candidate KAN + organizational task KOO; возвращает `SHT__entity-environment-organizational-model-v01-candidate__KOO.md` |
| 3 | Независимо проверить recovery КОДЕРА и провести cold-start | verified current recovery KOD + `initiation_verified` либо blocker |
| 4 | ШАРДОВИК | recovery-cycle после KOD |

## Deferred / отдельные решения

- WEB post-init audit — `deferred_nonurgent`;
- emergency-initiation v0.1 — отдельное решение о нормативном статусе;
- изменение routing canon для доставки через external canonical locator — `needs_decision`;
- GitHub как окончательное файловое поле — отдельный архитектурный цикл;
- пилот графового слоя Obsidian — после стабилизации основной recovery-волны.

## Done

`upgraded`:

- KAN;
- ARH;
- RED;
- SIS;
- WEB;
- SHT.

SHT cold-start:

`initiation_verified`

Independent KOO verification commit:

`5ce6f32af8e8dbd599f41cc23831a33891af1727`

KOO текущего экземпляра: preservation + recovery update в работе; новый экземпляр ещё не принят.

---

entity: KOO
artifact_role: current_priority_board
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
