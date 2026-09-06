# Snapshot КООРДИНАТОРА

## Recovery-кампания

- KOO — `upgraded`;
- KAN — `upgraded`;
- ARH — `upgraded`;
- RED — `upgraded`;
- SIS — `upgraded`;
- WEB — `externally_verified`, следующий шаг cold-start;
- KOD / SHD — current recovery пока не подтверждён;
- KON — не поднимать автоматически;
- SHT — `deferred_role_design`;
- SHK — другой проект;
- VOL — утилитарный чат без recovery.

## Новое решение по неработоспособным старым чатам

ОПЕРАТОР подтвердил, что старый чат WEB неработоспособен с тем же типом симптомов, что ранее старый чат ARH.

Для WEB штатный self-assessment заменён аварийным bootstrap-recovery:

- старый чат не используется как источник истины;
- КООРДИНАТОР собирает только минимальное ядро из approved-источников, своей проверяемой управляющей карты и явных решений ОПЕРАТОРА;
- неизвестное не реконструируется;
- пакет внешне публикуется и проверяется;
- новый чат обязан пройти cold-start;
- после cold-start новый WEB сам выполняет read-only аудит реального веб-контура и обновляет snapshot.

Это пока рабочий эксперимент, не approved-канон.

## WEB recovery

До создания пакета `entities/web/recovery/current` в выбранном GitHub-контуре отсутствовал.

Создан current recovery candidate:

`puev5691/wellbeing-entity-bootstrap/entities/web/recovery/current/`

Immutable package commit:

`fb1c08457a8ee0962a9191752b7a642217e4c7d5`

Подтверждены четыре файла, blob identifiers и внешний checksum-набор.

Статус WEB: `externally_verified`.

## Следующий безопасный шаг

Создать новый чистый чат WEB и передать ему только cold-start задачу. Старый assessment-файл и пересказ старого WEB-чата не передавать.

---

entity: KOO
artifact_role: recovery_snapshot
status: current_snapshot
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
