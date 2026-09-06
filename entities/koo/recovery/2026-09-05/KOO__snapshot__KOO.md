# Snapshot КООРДИНАТОРА

## Recovery-кампания
- KOO — `upgraded`;
- KAN — `upgraded`;
- ARH — `upgraded`;
- RED — `upgraded`;
- SIS — `externally_verified`, следующий шаг cold-start;
- WEB / KOD / SHD — current recovery пока не подтверждён;
- KON — не поднимать автоматически;
- SHT — `deferred_role_design`;
- SHK — другой проект;
- VOL — утилитарный чат без recovery.

## СИСАДМИН

Проверенный current locator:
`puev5691/wellbeing-entity-bootstrap/entities/sis/recovery/current`

Immutable commit:
`df530d5344e9fa6967c0545e67c5203501355670`

Подтверждены четыре recovery-файла, их blob identifiers и checksum-набор.

Пакет не содержит secrets. Manifest запрещает автоматически восстанавливать private keys, пароли, токены, production-конфиги и runtime-state. Snapshot не объявляет сохранённые инфраструктурные факты live-state и требует свежей проверки перед production-действиями.

Статус SIS: `externally_verified`.

## Следующий безопасный шаг
Создать новый чистый чат SIS и выполнить cold-start только по действующим базовым источникам и внешнему current recovery. Старый assessment-отчёт новому SIS не передавать.

---
entity: KOO
artifact_role: recovery_snapshot
status: current_snapshot
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
