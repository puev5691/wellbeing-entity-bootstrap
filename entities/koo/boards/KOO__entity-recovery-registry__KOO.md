# Реестр recovery Сущностей — current KOO state

## Смысл

Этот KOO-authored registry фиксирует подтверждённое recovery-состояние, необходимое КООРДИНАТОРУ для маршрутизации и continuity. Он не является authority на чужой self-state и не повышает статусы без проверяемого основания.

## Current registry

| Код | Подтверждённое состояние | Recoverability / следующий шаг |
|---|---|---|
| KOO | текущий current-writer выполнил post-StageA self-preservation; snapshot/initiation/priority подготовлены; этот registry и development-state закрывают выявленный ARH content-gap | `candidate_complete_pending_ARH_publication_readback` |
| KAN | recovery publication/readback ранее принят KOO | `structurally_verified_pending_fresh_initiation_test` |
| ARH | post-OSS v0.6 self-preservation опубликован и readback-проверен; KOO acceptance опубликован | `current_and_externally_verified`; новый checkpoint только по trigger |
| RED | current recovery после active-source change отдельно не перепроверен в этом KOO cycle | `stale_check_required` |
| SIS | external recovery repair опубликован и fresh verification завершён | `initiation_verified`; operational Stage A state учитывается отдельно |
| WEB | current recovery после active-source change отдельно не перепроверен в этом KOO cycle | `stale_check_required` |
| SHT | current recovery после active-source change отдельно не перепроверен в этом KOO cycle | `stale_check_required` |
| KOD | exact v0.6 executable recovery repaired and externally verified; v0.7 corrected core logic independently reviewed PASS, но deploy bundle v0.2 пока blocked на metadata correction | fresh KOD initiation не запускался; ждать corrected immutable deploy bundle |
| VOL | external recovery publication/readback подтверждён ARH | `structurally_verified_pending_fresh_initiation_test` |
| SHD | locator/version не подтверждены | `unknown` |
| KON | locator/version не подтверждены | `unknown` |

## Существенные проверяемые identities

### ARH

- immutable ARH preservation publication: `afe6d7d3d03288a1e56c927ea9924268f0696ebd`;
- KOO acceptance publication: `1f9c73ee6bf3125d55641c3dad9157eb1937a1b1`;
- state: `current_and_externally_verified`.

### SIS

- immutable recovery publication: `950f01dc5cdb56c3ea63ba540c4e72eda24973bb`;
- exact recovered v0.6 executable blob: `93f1208d60b058867a4fde4df61689785d216e17`;
- exact recovered v0.6 executable SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- fresh recovery state: `initiation_verified`.

### KOD

- canonical v0.6 executable repair commit: `48a8aa581147cfe1c0560e46a2edee291ed371e8`;
- corrupt checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` is superseded and must not be used as executable recovery;
- corrected core v0.7 candidate SHA-256: `242bfa3705de5eb6f4476551b679289721e0ebfcf89c6534d0bff55813f0a46d`;
- KOO independent core logic review: `PASS`;
- deploy bundle v0.2 acceptance: `BLOCKED_METADATA_CORRECTION`;
- KOO corrective-review publication: `aec71afa65c80997f7910179a4668431769e1099`.

## Operational state is not recovery promotion

SIS `initiation_verified` does not mean Stage A operational acceptance.

Current Stage A operational state:

- installation/runtime mechanics: `PASS`;
- service: loopback-only;
- authority defect: `evidence_scope_widening`;
- operational acceptance: `BLOCKED`;
- no additional Entity registration;
- no KOO operational instance/credential;
- writer grants: `0`;
- production/public ingress: prohibited.

## Граница достоверности

`stale_check_required` означает только отсутствие свежей проверки в текущем cycle. `unknown` не заменяется реконструкцией.

Этот registry не переписывает self-state других Сущностей и не назначает им authority.

---
document_type: entity-recovery-registry
entity: KOO
status: current_registry
recovery_canon: v1.4 approved
stageA_operational_acceptance: BLOCKED
project_time: generated_without_trusted_project_time
