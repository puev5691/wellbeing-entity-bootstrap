# АРХИВАРИУСУ: принять эксплуатацию preservation/recovery-контура

## Смысл

ОПЕРАТОР утвердил новую active-норму preservation/recovery. АРХИВАРИУС назначен профильным владельцем процесса сохранности и проверяемого recovery, но не автором чужих self-snapshot.

Требуется принять регулярную эксплуатацию этого контура и обработать первое событие: замену базовых roles/recovery Project Sources.

## Active Project Sources для этой задачи

Обязательные точные версии:

- `project-instructions-core-v2_1-approved.md` — `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`;
- `entity-roles-short-v2_2-approved.md` — `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d`;
- `file-work-canon-universal-v2_3-approved.md` — `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`;
- `entity-state-preservation-and-recovery-canon-v1_4-approved.md` — `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda`;
- `source-loading-policy-v2-approved.md` — `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`.

Если фактически доступные Project Sources не совпадают, остановить профильное исполнение и вернуть точный blocker.

## Граница роли

АРХИВАРИУС:

- инициирует предусмотренные preservation-checkpoint;
- принимает self-snapshot/recovery-пакеты;
- проверяет manifest, provenance, version identity, publication и readback;
- ведёт минимальный recovery-registry;
- контролирует stale-state и практическую recoverability.

АРХИВАРИУС не:

- пишет self-snapshot вместо current-writer другой Сущности;
- назначает себе или другим writer authority;
- реконструирует потерянный self-state;
- получает production/system authority из архивной роли;
- превращает каждое событие в отдельную гору документов.

## Первая эксплуатационная задача

Выполнить один source-change preservation cycle.

1. Сначала обновить **собственный ARH self-snapshot/recovery** по новой норме v1.4, поскольку роль ARH существенно изменилась. Self-snapshot создаёт текущий ARH current-writer.
2. После собственного preservation-check открыть/обновить единый минимальный recovery-registry для recovery-managed Сущностей.
3. Использовать current KOO registry как вход, но не повышать его старые статусы без проверки.
4. Для KOO, KAN, RED, SIS, WEB, SHT и KOD определить `current`, `stale_check_required`, `unknown` или иной явно определённый статус только по подтверждённым данным.
5. Если source-change требует содержательного обновления recovery конкретной Сущности, инициировать checkpoint у её current-writer. Не создавать snapshot за неё.
6. Сохранить exact locator/version последнего принятого recovery, publication/readback state и известную recoverability.
7. Не запускать SHD/KON только ради заполнения таблицы, если их recovery остаётся unknown и нет отдельного приоритета.

## Минимальный результат

Вернуть KOO один проверяемый пакет/набор файлов, содержащий:

- ARH self-preservation/recovery под v1.4;
- минимальный recovery-registry current-state;
- короткий report о первом source-change cycle;
- manifest + SHA-256;
- exact external locator и readback evidence, если публикация выполнена;
- перечень checkpoints, которые реально требуется запросить у других current-writer, без их самовольного выполнения.

## Acceptance

KOO считает первичную передачу эксплуатационного контура успешной, если:

- ARH собственный recovery обновлён и проверяем;
- ARH явно принял process ownership в границах roles v2.2/recovery v1.4;
- registry различает known/stale/unknown и не реконструирует чужое состояние;
- publication отдельно от readback;
- capability не превращена в authority;
- выдан один безопасный следующий шаг, а не массовая кампания переписывания всех архивов.

---
from_entity: KOO
to_entity: ARH
document_type: preservation-operations-handoff
status: ready_for_delivery
operator_decision_status: active_norm_approved
source_change_trigger: roles_v2_2_and_recovery_v1_4
production_changed: no
project_time: generated_without_trusted_project_time
