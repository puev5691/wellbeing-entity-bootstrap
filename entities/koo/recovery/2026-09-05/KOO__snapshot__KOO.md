# Snapshot КООРДИНАТОРА

## Recovery-кампания

- KOO — `upgraded`;
- KAN — `upgraded`;
- ARH — `upgraded`;
- RED — `upgraded`;
- SIS — `upgraded`;
- WEB — `upgraded`, дальнейший аудит `deferred_nonurgent`;
- SHT — `externally_verified`, следующий шаг clean cold-start;
- KOD — assessment получен, independent verification pending;
- SHD — после KOD;
- KON — не поднимать автоматически;
- SHK — другой проект;
- VOL — утилитарный чат без recovery.

## Общая среда Сущностей

КАНЦЕЛЯР подготовил смысловой фундамент v0.1 со статусом `candidate_for_coordination`.

Следующий слой — организационная модель ШТАБИСТА.

## Новая роль SHT

Прежний approved role-source не задавал ШТАБИСТУ достаточно точных полномочий.

По решению ОПЕРАТОРА SHT перенастроен как внутренняя организационно-процессная Сущность.

Это новая current role, а не восстановление памяти старого SHT.

Основная функция:

> превращать согласованные смыслы и проектные решения в организационные модели, процессы, жизненные циклы, распределение ответственности и handoff следующему слою.

SHT не заменяет KAN, KOO, OPR, SIS или KOD.

## Recovery SHT

Current locator:

`puev5691/wellbeing-entity-bootstrap/entities/sht/recovery/current`

Immutable KOO precheck:

`aa717ccb19ea9e07327d2da1359eb0bfea2b6332`

Подтверждены пять файлов recovery, их blob identifiers и внешний checksum-набор. Локальные Git blob hashes совпали с GitHub, что подтверждает точные байты пакета.

Task-входы организационной модели вынесены из recovery и передаются после успешного cold-start.

Статус SHT: `externally_verified`.

## KOD

КОДЕР вернул GitHub-locator assessment-отчёта и заявил current recovery. Это хороший пример использования внешнего файлового поля.

Independent verification KOD recovery ещё не завершена; сильный статус пока не присваивать.

## Следующий безопасный шаг

Передать новому чистому SHT только cold-start файл.

После `initiation_verified` отдельно передать semantic candidate KAN и organizational task KOO.

---

entity: KOO
artifact_role: recovery_snapshot
status: current_snapshot
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
