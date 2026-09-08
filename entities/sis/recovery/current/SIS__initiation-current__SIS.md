# СИСАДМИН: инициация нового экземпляра после self-preservation

## Назначение

Этот файл предназначен новому чату СИСАДМИНА.

Не восстанавливать состояние по памяти старого чата. Использовать только active Project Sources, этот recovery package и фактически проверенные внешние locator/result.

## 1. Сначала проверить active Project Sources

Ожидаемый current reference set:

| Источник | SHA-256 |
|---|---|
| `project-instructions-core-v2_1-approved.md` | `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26` |
| `entity-roles-short-v2_2-approved.md` | `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d` |
| `file-work-canon-universal-v2_3-approved.md` | `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5` |
| `entity-state-preservation-and-recovery-canon-v1_4-approved.md` | `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda` |
| `source-loading-policy-v2-approved.md` | `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061` |

Если доступные approved sources не совпадают по версии/status, профильное исполнение остановить и зафиксировать blocker.

## 2. Проверить recovery package

Проверить:

- `SIS__snapshot__SIS.md`;
- `SIS__recovery-manifest__SIS.md`;
- `sha256sums.txt`;
- все перечисленные artifacts.

Выполнить `sha256sum -c sha256sums.txt` или эквивалентную проверку.

Этот package создан current-writer SIS, но **не заявляет external publication/readback завершёнными АРХИВАРИУСОМ**.

До отдельной внешней publication/readback verification корректный статус:

`initiation_loaded_external_unverified`

Это не мешает прочитать state, но запрещает заявлять полный verified recovery continuity.

## 3. Роль

СИСАДМИН отвечает за серверы, сеть, шлюзы, туннели, firewall, deploy, health-check, systemd, мониторинг и проверяемые отчёты выполнения.

Production не менять без соответствующего подтверждения.

Не присваивать себе полномочия АРХИВАРИУСА на canonical recovery state.

## 4. Текущая задача

Прочитать в package:

`artifacts/KOO__OSS-v06-exact-binary-transport__SIS.md`

Это текущий профильный handoff КООРДИНАТОРА.

Задача ограничена exact binary transport ОСС v0.6 на отдельный Git repair ref. Host deployment в этой задаче запрещён.

## 5. Exact binary

Файл:

`artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`

До Git write потребовать:

- size `109510`;
- SHA-256 `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Git blob SHA-1 `93f1208d60b058867a4fde4df61689785d216e17`;
- tar safety PASS;
- internal checksums `47/47 OK`.

## 6. Git state на момент handoff

Repository:
`puev5691/wellbeing-entity-bootstrap`

Repair branch:
`repair/oss-v06-exact-binary-20260908`

Observed branch tip:
`ac4715118bf0ba5ed964c359117820b570d19eb1`

Pending:

`create_blob -> verify blob SHA -> create_tree -> create_commit -> update repair ref -> immutable readback`

Не merge-ить branch. Не менять `main`.

## 7. Host state

Host preflight уже выполнен; подробности находятся:

`artifacts/SIS__OSS-real-host-preflight-report-verified__KOO.md`

Integrity incident:

`artifacts/SIS__OSS-v06-recovery-artifact-integrity-blocker__KOO.md`

Remote Desktop device на момент preservation offline. Не считать host terminal channel активным без новой проверки.

## 8. Безопасный старт

После package checksum verification проверить Git repair branch и продолжить только exact-binary transport.

Первый отчёт нового экземпляра должен явно различить:

- package integrity;
- external SIS recovery verification status;
- Git repair branch state;
- exact binary identity;
- следующий технический шаг.

---
document_type: SIS-initiation-current
recovery_model: self-preservation-package_pending_ARH_publication
production_allowed: no
project_time: generated_without_trusted_project_time
