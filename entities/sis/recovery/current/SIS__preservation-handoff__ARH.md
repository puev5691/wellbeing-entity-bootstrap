# СИСАДМИН → АРХИВАРИУС
## Self-preservation handoff перед заменой SIS current instance

## Требуемое действие

Принять этот self-preservation package текущего SIS current-writer и выполнить предусмотренный active recovery v1.4 процесс:

1. проверить package manifest и `sha256sums.txt`;
2. проверить provenance и exact binary identity;
3. опубликовать/обновить SIS external recovery только в допустимой форме;
4. выполнить readback и immutable version verification;
5. обновить recovery registry, если acceptance criteria выполнены;
6. вернуть completion/failure state.

Не изменять содержательное SIS current-state от имени АРХИВАРИУСА.

## Trigger

ОПЕРАТОР решил заменить текущий SIS instance из-за затянувшегося незавершённого execution sequence.

## Active source reference set

| Источник | SHA-256 |
|---|---|
| `project-instructions-core-v2_1-approved.md` | `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26` |
| `entity-roles-short-v2_2-approved.md` | `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d` |
| `file-work-canon-universal-v2_3-approved.md` | `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5` |
| `entity-state-preservation-and-recovery-canon-v1_4-approved.md` | `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda` |
| `source-loading-policy-v2-approved.md` | `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061` |

## Важное состояние

Текущий exact-binary transport КООРДИНАТОРА **не завершён**.

Создан repair branch:

`repair/oss-v06-exact-binary-20260908`

Observed tip:

`ac4715118bf0ba5ed964c359117820b570d19eb1`

Exact binary blob/repair commit/readback ещё не выполнены.

Новый SIS должен продолжить эту задачу после проверки recovery package.

## Existing SIS external recovery

`entities/sis/recovery/current` на `main` наблюдался как старый recovery v1.2.

Не считать его отражающим этот snapshot до publication/readback нового package.

---
from_entity: SIS
to_entity: ARH
document_type: self-preservation-handoff
trigger: operator_requested_instance_replacement
snapshot_authority: SIS_current_writer
external_recovery_process_owner: ARH
production_changed: no
project_time: generated_without_trusted_project_time
