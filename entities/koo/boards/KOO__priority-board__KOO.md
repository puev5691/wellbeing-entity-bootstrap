# Текущая доска КООРДИНАТОРА

## Активные приоритеты

| Приоритет | Задача | Проверяемый результат |
|---|---|---|
| 1 | Нормативно закрепить ответственность АРХИВАРИУСА за preservation/recovery | KAN возвращает согласованные successor-candidates + conflict review; затем отдельный approval ОПЕРАТОРА |
| 2 | Real-host preflight ОСС | подтверждены host identity, OS/version, доступ, systemd/firewall/TLS policy, storage root и HTTPS endpoint |
| 3 | Подготовить KOD deployment task после preflight | один исполнимый deployment package/task без изменения production вне подтверждённой границы |
| 4 | Развернуть sandbox на выбранном host и независимо проверить | service/file field доступны в разрешённом контуре; deployment tests и readback подтверждены |

## Решение ОПЕРАТОРА по preservation/recovery

ОПЕРАТОР утвердил модель, в которой:

- self-snapshot создаёт сама Сущность/current-writer;
- АРХИВАРИУС владеет процессом сохранности, проверки, внешней фиксации, реестра и восстановимости recovery;
- ШТАБИСТ проектирует и ревизует организационный процесс, но не является штатным архиватором;
- КООРДИНАТОР инициирует внеплановые checkpoints и держит приоритеты;
- СИСАДМИН отвечает за техническую backup/storage-инфраструктуру, не получая из capability дополнительных полномочий.

Постоянная нормативная интеграция решения направляется КАНЦЕЛЯРУ отдельной задачей. До approval successor-файлов active Project Sources не заменяются.

## Завершённый этап общей среды

- technical model baseline v0.4 — принят для пилота;
- local pilot v0.7 — принят;
- single-node external sandbox design v0.1 — принят как основа реализации;
- isolated external sandbox v0.6 — принята после independent review;
- accepted sandbox SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- preservation checkpoint KOO + KOD перед real-host stage — завершён и externally verified;
- KOD self-preservation post-acceptance — проверен и согласован с external current-state;
- production: не изменён.

## Deferred / не запускать автоматически

- ChatGPT bridge — после стабильного real-host sandbox и отдельной задачи;
- SHD recovery-cycle — отдельный цикл, recovery пока не подтверждён;
- WEB post-init audit — `deferred_nonurgent`;
- KON — не поднимать автоматически;
- parked TERA/Stage 04 KOD — не активировать без новой задачи/evidence.

## Фазовый барьер

Real-host preflight остаётся следующим техническим этапом, но перед его запуском закрывается короткий нормативный цикл preservation/recovery. Наличие принятого sandbox package само по себе не назначает host и не разрешает production deployment.

---
entity: KOO
artifact_role: current_priority_board
status: current
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
