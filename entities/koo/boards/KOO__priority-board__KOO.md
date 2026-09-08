# Текущая доска КООРДИНАТОРА после Stage A запуска ОСС

## Активные приоритеты

| Приоритет | Задача | Проверяемый результат |
|---|---|---|
| 1 | Исправить bootstrap authority scope defect ОСС | KOD возвращает новый immutable corrected core/bundle, regression tests и deterministic repair contract |
| 2 | Независимо принять corrected revision | KOO подтверждает exact identity, full regression/adversarial tests и отсутствие semantic widening |
| 3 | Безопасно отремонтировать deployed Stage A state | отдельная SIS task после KOO PASS; broad authority narrowed/revoked/superseded auditably, `ent:KOO` сохранена, writer grants `0` |
| 4 | Повторно решить Stage A operational acceptance | host readback: health/integrity/authority semantics PASS; только после этого разрешается следующий onboarding step |

## Завершено и подтверждено

- preservation/recovery governance v1.4 принят в эксплуатацию ARH;
- canonical recovery repair exact core v0.6 завершён;
- SIS fresh recovery verification: `initiation_verified`;
- deployable Stage A bundle принят KOO;
- target host staging: PASS;
- ОПЕРАТОР утвердил `operator_admin` + first Entity `ent:KOO`;
- persistent installation/bootstrap/systemd activation: mechanics PASS;
- independent KOO host readback: service active/enabled, loopback live/ready PASS;
- post-deployment security review обнаружил и воспроизвёл bootstrap authority widening;
- corrective KOD task опубликована commit `73bd9e699def33b7d1d0f61b9fa22807223b104d`.

## Blocker

`stageA_operational_acceptance: BLOCKED`

Причина: evidence `entity:ent:KOO` при first-Entity bootstrap превращается в authority scope `entity:*`, что допускает out-of-scope entity registration.

## Deferred

- additional Entities;
- KOO operational instance/credential onboarding;
- writer grant/election;
- public ingress/TLS/DNS;
- production;
- ChatGPT bridge;
- continuity/memory/experience implementation.

## Один следующий шаг

Получить KOD corrected result и выполнить независимый KOO review. Не выдавать SIS host-repair task раньше этого PASS.

---
entity: KOO
artifact_role: current_priority_board_candidate
status: current_writer_candidate_for_ARH_acceptance
production_allowed: no
project_time: generated_without_trusted_project_time
