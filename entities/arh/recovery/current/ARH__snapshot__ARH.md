# АРХИВАРИУС: self-snapshot после OSS v0.6 recovery repair-cycle

## Краткий смысл

Authoritative self-snapshot текущего экземпляра АРХИВАРИУСА после существенного recovery-инцидента, его устранения и восстановления проверяемого SIS recovery continuity.

## 1. Основание checkpoint

КООРДИНАТОР принял completion receipt `ARH__OSS-v06-recovery-repair-and-SIS-publication__KOO.md` без блокирующих замечаний и инициировал внеплановый ARH self-preservation checkpoint.

Предыдущий ARH snapshot предшествовал KOD exact-binary repair, SIS publication/readback, recovery-deadlock resolution и fresh SIS verification и поэтому стал stale.

## 2. Active Project Sources

Перед checkpoint локально повторно проверены exact SHA-256:

| Источник | SHA-256 |
|---|---|
| `project-instructions-core-v2_1-approved.md` | `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26` |
| `entity-roles-short-v2_2-approved.md` | `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d` |
| `file-work-canon-universal-v2_3-approved.md` | `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5` |
| `entity-state-preservation-and-recovery-canon-v1_4-approved.md` | `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda` |
| `source-loading-policy-v2-approved.md` | `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061` |

Mismatch: `none`.

## 3. Выполненные ARH задачи

### KOD recovery integrity repair

Подтверждён и канонизирован exact executable artifact:

- canonical repair commit: `48a8aa581147cfe1c0560e46a2edee291ed371e8`;
- blob: `93f1208d60b058867a4fde4df61689785d216e17`;
- size: `109510`;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- tar members: `57`;
- unsafe paths: `0`;
- symlink/hardlink: `0`;
- internal checksums: `47/47 OK`.

Повреждённый checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` superseded и не считается пригодным executable recovery.

### SIS recovery publication

Current SIS recovery package опубликован и readback-проверен:

- immutable publication: `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`;
- checksum entries: `8/8 OK`;
- embedded exact binary совпадает с KOD identity выше.

### Recovery registry

После repair/publication registry был обновлён commit:
`fd7366983561a25c6be74d85f6280df915e2f244`.

В этом checkpoint registry дополнительно приводится к подтверждённому fresh SIS status.

## 4. Последующие подтверждённые события

SIS authoritative fresh verification report подтвердил:

- verified recovery commit `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`;
- `8/8 OK`;
- exact binary blob `93f1208d60b058867a4fde4df61689785d216e17`;
- exact SHA-256 `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- `initiation_status: initiation_verified`;
- deploy/production changes в ходе verification: no.

SIS Stage A host-local staging report подтвердил на `uk.wbnetrus.ru`:

- `host_staging_status: PASS`;
- bundle SHA-256 `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- bundle Git blob `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`;
- Python `3.12.3`;
- root checksums `64/64 OK`;
- embedded core `47/47 OK`;
- smoke exit `0`, live/ready PASS, public listener false;
- persistent install/production mutation: no.

Stage A staging не превращается в recovery-registry deployment log; здесь он сохранён только как существенный контекст безопасного следующего шага.

## 5. Recovery-deadlock lesson/state

Зафиксирован operational failure mode: replacement instance нельзя запускать между self-snapshot и external publication/readback, если для продолжения profile task требуется действие этого же replacement instance.

Корректная граница:
`self-snapshot → ARH acceptance → external publication → readback → replacement start → external verification → continuation`.

Это operational state/lesson, не новая project norm.

## 6. Current writer-state

`ARH authoritative current-writer for own self-state; preservation/recovery process owner active`.

Текущий ARH checkpoint не меняет чужой self-state и не создаёт production authority.

## 7. Open / parked / unknown

Open:
- завершить именно этот ARH external publication/readback и вернуть completion report КООРДИНАТОРУ;
- после checkpoint принимать только новый подтверждённый preservation/recovery trigger.

Parked:
- программный контур АРХИВАРИУСА: `paused_by_operator`;
- runtime: `not_verified`;
- копное право: `parked_with_trigger`;
- массовые checkpoints RED/SIS/WEB/SHT/KOD/KAN не инициировать автоматически.

Unknown:
- practical fresh cold-start нового ARH экземпляра после этого checkpoint не выполнялся и не требуется данным решением;
- SHD/KON recovery остаётся unknown без отдельного приоритета.

## 8. Безопасный следующий шаг

> Опубликовать этот ARH recovery package во внешний locator, выполнить immutable readback и вернуть КООРДИНАТОРУ completion report. После закрытия checkpoint не продолжать deployment или чужие checkpoints без нового решения.

---
document_type: entity-self-snapshot
entity: ARH
recovery_standard: v1.4
status: current_snapshot
writer_state: authoritative_current_writer_for_ARH_self_state
checkpoint_scope: post-OSS-v06-recovery-repair
project_time: generated_without_trusted_project_time
