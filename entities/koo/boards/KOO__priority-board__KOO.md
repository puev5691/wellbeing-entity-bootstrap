# Текущая доска КООРДИНАТОРА

## Активные приоритеты

| Приоритет | Задача | Проверяемый результат |
|---|---|---|
| 1 | Передать АРХИВАРИУСУ эксплуатационную ответственность preservation/recovery по новой active-норме | ARH получает task, подтверждает receipt/acceptance, выполняет собственный source-change checkpoint и открывает минимальный recovery-registry cycle |
| 2 | Real-host preflight ОСС | подтверждены host identity, OS/version, доступ, systemd/firewall/TLS policy, storage root и HTTPS endpoint |
| 3 | Подготовить KOD deployment task после preflight | один исполнимый deployment package/task без изменения production вне подтверждённой границы |
| 4 | Развернуть sandbox на выбранном host и независимо проверить | service/file field доступны в разрешённом контуре; deployment tests и readback подтверждены |

## Завершено

- preservation/recovery governance согласован KAN и KOO;
- ОПЕРАТОР утвердил `entity-roles-short-v2_2-approved.md` и `entity-state-preservation-and-recovery-canon-v1_4-approved.md`;
- Project Sources UI replacement подтверждён ОПЕРАТОРОМ;
- загруженные active files проверены по SHA-256;
- KOO current recovery переводится на recovery schema v1.4;
- isolated external sandbox v0.6 принята;
- preservation checkpoint KOO + KOD перед real-host stage завершён и проверен;
- production не изменён.

## Source-change trigger

Изменение ролей и recovery-canon является событийным trigger для recovery-managed Сущностей. Оно не означает автоматическую перезапись всех recovery силами KOO. Эксплуатационный владелец ARH должен определить stale-state по подтверждённым данным и инициировать checkpoints у соответствующих current-writer.

## Deferred

- ChatGPT bridge — после стабильного real-host sandbox и отдельной задачи;
- SHD recovery-cycle — отдельный цикл;
- WEB post-init audit — `deferred_nonurgent`;
- KON — не поднимать автоматически;
- parked TERA/Stage 04 KOD — не активировать без новой задачи/evidence.

---
entity: KOO
artifact_role: current_priority_board
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
