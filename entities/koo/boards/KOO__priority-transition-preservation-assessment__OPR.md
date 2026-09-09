# КООРДИНАТОР: переход к новому набору приоритетов и оценка preservation

## Решение ОПЕРАТОРА

Работа по ШКОЛЕ БЛАГОПОЛУЧИЯ поставлена на паузу до отдельного возобновления.

КООРДИНАТОР должен:
- не продолжать school governance/review cycle;
- сохранить точку возобновления;
- проверить необходимость preservation текущих Сущностей перед сменой приоритетов;
- быть готовым принять новый набор первоочередных задач;
- параллельно довести текущий первый этап ОСС до проверяемого terminal state.

## Текущее состояние ОСС

Подтверждённые до этого решения факты:
- corrected core v0.7 logic review: PASS;
- accepted deploy bundle v0.3 SHA-256: `29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- KOO controlled-repair task SIS опубликована;
- pre-repair KOO recovery опубликован и readback-проверен at commit `ae0ad1ad9eab2d9bba6f72ade462ff28f50ed162`.

Fresh read-only host observation при этой оценке:
- `wb-oss-sandbox.service`: active;
- enabled: enabled;
- current release: `/opt/wb-oss-sandbox/releases/sha256-29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- `/health/live`: true;
- `/health/ready`: ready true;
- listener: only `127.0.0.1:18081`.

Это доказывает, что host уже переключён на accepted v0.7 release и daemon healthy. Это **не** заменяет SIS completion receipt и не доказывает DB/authority/audit invariants. До receipt + KOO acceptance Stage A operational acceptance остаётся `BLOCKED`.

## Preservation assessment

### KOO — checkpoint требуется сейчас

Причины:
- внешний recovery KOO предшествует acceptance bundle v0.3;
- после него выпущена controlled-repair task SIS;
- host уже наблюдается на v0.7 release;
- создан post-OSS intensive-development/media plan;
- выполнен существенный school governance/source-barrier cycle;
- ОПЕРАТОР теперь меняет приоритеты и ставит ШКОЛУ на паузу.

Текущее KOO state materially отличается от externally current snapshot. KOO current-writer должен сформировать self-state candidate; ARH должен проверить и опубликовать recovery.

### KOD — checkpoint вероятно требуется до нового крупного назначения

KOD создал corrected core v0.7, deterministic repair contract и deploy bundle v0.3. Это существенное изменение после прежнего verified v0.6 recovery.

ARH должен проверить, существует ли уже externally verified KOD recovery, включающий exact v0.7 state. Если нет — инициировать checkpoint у KOD current-writer. Не реконструировать KOD self-state силами KOO/ARH.

### SIS — checkpoint после terminal state текущего repair cycle

Не фиксировать SIS mid-transaction без необходимости.

Trigger:
- SIS completion receipt `PASS|BLOCKED|FAIL`;
- KOO acceptance либо отдельное решение по failure/recovery.

После terminal state SIS current-writer должен сохранить фактические actions, release identity, backup identity, repair/readback result и open failure state, если он есть.

### ШКОЛА: ZAV/LIB — freeze checkpoint нужен, но без продолжения governance

Пауза должна сохранить:
- source barrier result;
- clean successor candidates;
- подготовленные review packages;
- факт отсутствия approval новых school sources;
- точку безопасного возобновления.

ZAV сохраняет собственный current educational/governance state; LIB организует school preservation/storage по школьной модели. HQ ARH не пишет school self-state за них.

DOC checkpoint нужен только если у DOC есть собственное существенное незавершённое current-state, не представленное внешним artifact. Сам факт паузы школы не требует искусственного snapshot пустого/неизменившегося state.

### RED — targeted verification/checkpoint рекомендован

RED создал существенную концепцию автоматизированного медиаконтура, принятую KOO как planning basis для post-OSS развития. До выдачи RED нового большого приоритета ARH должен проверить current recovery coverage; если concept/current editorial state не входит в externally verified recovery — запросить RED self-checkpoint.

### ARH / KAN / SHT / WEB / VOL и прочие

Массовый snapshot «всех на всякий случай» не запускать.

ARH проверяет trigger по фактическому change-state:
- если current externally verified recovery покрывает значимое состояние и нового self-state нет — checkpoint не нужен;
- если есть substantive unpublished state перед сменой задач/instance replacement — запросить self-checkpoint;
- `unknown` не повышать и не заполнять догадкой.

## Режим перехода к новым приоритетам

До получения нового набора задач:
- ШКОЛА: `PAUSED`;
- ОСС Stage A: `repair_cycle_terminal_receipt_pending`;
- new priority intake: `READY`;
- новые Entity/authority действия в ОСС: не разрешены до operational acceptance;
- существующие Сущности могут получать новые задачи параллельно, если это не конфликтует с незавершённым профильным critical cycle.

## Правило маршрутизации новых задач

Каждая новая первоочередная задача после intake получает:
1. профильную Сущность;
2. проверяемый expected result;
3. dependencies/blockers;
4. authority boundary;
5. preservation trigger, если задача меняет significant current-state.

Не создавать новые permanent Entity только ради декомпозиции задачи до подтверждения operational onboarding path ОСС.

---
entity: KOO
artifact_role: priority_transition_and_preservation_assessment
status: current_transition_decision
school_state: PAUSED
OSS_stageA_operational_acceptance: BLOCKED_pending_SIS_receipt_and_KOO_readback
new_priority_intake: READY
production_allowed: no
project_time: generated_without_trusted_project_time
