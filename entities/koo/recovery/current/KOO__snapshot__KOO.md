# Snapshot КООРДИНАТОРА

## Смысл

Snapshot фиксирует состояние после утверждения и фактической замены active Project Sources по preservation/recovery governance.

Нормативный цикл закрыт. АРХИВАРИУС назначен владельцем процесса сохранности и проверяемого recovery; self-snapshot по-прежнему создаёт authoritative current-writer самой Сущности.

## Current KOO

- Entity: KOO / КООРДИНАТОР;
- current instance: действующий рабочий экземпляр;
- recovery schema: v1.4;
- current-writer: этот snapshot не выполняет handoff/failover;
- active development: общая среда Сущностей;
- production changes: no.

## Active Project Sources

- `project-instructions-core-v2_1-approved.md` — `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26`;
- `entity-roles-short-v2_2-approved.md` — `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d`;
- `file-work-canon-universal-v2_3-approved.md` — `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5`;
- `entity-state-preservation-and-recovery-canon-v1_4-approved.md` — `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda`;
- `source-loading-policy-v2-approved.md` — `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061`.

ОПЕРАТОР подтвердил замену Project Sources. Фактически загруженные файлы roles v2.2 и recovery v1.4 проверены и имеют точные SHA-256 выше. UI-суффиксы `(1)/(2)` являются именами копий интерфейса, содержимое совпадает с canonical approved files.

## Preservation/recovery governance

Active норма теперь устанавливает:

- self-snapshot авторствует сама Сущность через authoritative current-writer;
- АРХИВАРИУС владеет preservation/recovery-процессом, проверкой, external publication/readback, recovery-registry и recoverability;
- АРХИВАРИУС не переписывает чужой self-state и не получает writer authority;
- ШТАБИСТ проектирует и ревизует организационный процесс;
- КООРДИНАТОР может инициировать внеплановый checkpoint и удерживает приоритет;
- СИСАДМИН отвечает за техническую storage/backup-инфраструктуру в пределах отдельного authority;
- emergency failover не требует невозможного свежего snapshot от недоступного writer и опирается только на last externally verified state + допустимое основание failover.

Изменение active sources само является trigger-событием. Для recovery-managed Сущностей требуется проверить stale-state и инициировать self-snapshot там, где это действительно необходимо. Это не разрешает KOO или ARH переписывать чужие snapshots.

## Технический baseline ОСС

Accepted sandbox:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

SHA-256:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

Status:

- isolated sandbox v0.6 accepted;
- real-host deployment only after preflight;
- production unchanged.

## Следующий безопасный шаг

Передать АРХИВАРИУСУ `KOO_preservation-operations_ARH.md` и получить receipt/acceptance либо конкретный failure-mode.

После принятия ARH эксплуатационного контура следующим техническим этапом остаётся real-host preflight ОСС.

---
entity: KOO
artifact_role: recovery_snapshot
status: current_snapshot
recovery_schema: v1.4
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
