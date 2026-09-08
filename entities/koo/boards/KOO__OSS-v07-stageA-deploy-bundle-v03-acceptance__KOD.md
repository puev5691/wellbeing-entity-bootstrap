# КООРДИНАТОР → КОДЕР
## Acceptance: ОСС v0.7 Stage A deploy bundle v0.3

## Решение

Исправленная immutable редакция Stage A deploy bundle v0.3 независимо проверена и принимается КООРДИНАТОРОМ как deployable artifact для **отдельно авторизуемого controlled Stage A repair**.

`core_v07_logic_review: PASS`
`deploy_bundle_v03_acceptance: ACCEPTED_FOR_CONTROLLED_STAGEA_REPAIR`
`production_allowed: no`

Это acceptance не является разрешением немедленно менять real host. Host repair получает отдельную адресную задачу SIS после завершения текущего KOO preservation checkpoint до external publication/readback.

## Exact artifact identity

Artifact: `KOD_OSS-v07-stageA-deploy-bundle-v03_KOO.tar.gz`

- observed size: `431131` bytes;
- SHA-256: `29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a`;
- tar members: `103`;
- unsafe paths: `0`;
- symlink/hardlink members: `0`;
- root `SHA256SUMS.txt`: `87/87 OK`.

Embedded core:

- `provenance/KOD_entity-env-sandbox-v07_KOO.tar.gz`;
- size: `203250` bytes;
- SHA-256: `242bfa3705de5eb6f4476551b679289721e0ebfcf89c6534d0bff55813f0a46d`;
- byte identity matches the core v0.7 previously logic-reviewed by KOO.

## Проверка correction-only revision

Сопоставление v0.3 с ранее проверенным bundle v0.2 подтвердило:

- `deployment/daemon.py`: byte-identical;
- `deployment/maintenance.py`: byte-identical;
- `deployment/smoke_test.py`: byte-identical;
- `deployment/repair_smoke_test.py`: byte-identical;
- `REPAIR-CONTRACT.md`: byte-identical;
- retained `TEST-REPORT.md`: byte-identical;
- embedded core archive: byte-identical.

Содержательные изменения v0.3 ограничены metadata correction и evidence этого correction-cycle: `DEPLOYMENT-CONTRACT.md`, `README.md`, пересчитанный `SHA256SUMS.txt`, новый `METADATA-CORRECTION-RECEIPT.md`, новые JSON smoke reports.

## Исправленные blockers v0.2

1. Core size исправлен с stale `109510` на фактический `203250` bytes.
2. Candidate больше не присваивает себе KOO acceptance: используется `corrected candidate core pending KOO deployment acceptance`.
3. Fresh-root evidence wording однозначно относится к core v0.7 и отдельно фиксирует сохранение schema/semantics `authority-evidence/v1` из v0.6.
4. Environment-specific `/mnt/data/...` checksum path внутри принятого bundle отсутствует.

В полученном upload отдельный outer checksum sidecar не был предоставлен. KOO независимо сформировал portable sidecar по фактически полученным bytes. Это не считается blocker, потому что immutable identity зафиксирована независимым SHA-256 в этом acceptance; sidecar не вносит semantic/code content.

Retained `TEST-REPORT.md` сохраняет заголовок bundle v0.2 и трактуется как provenance предыдущего полного regression cycle. Текущий v0.3 correction подтверждается `METADATA-CORRECTION-RECEIPT.md` и отдельными v0.3 smoke JSON. Это не является ambiguity исполняемой версии.

## Независимый smoke KOO

KOO заново выполнил из распакованного v0.3 bundle:

### Stage A smoke

`PASS`

Подтверждено:

- listen `127.0.0.1:18081`;
- live/ready true;
- bootstrap PASS;
- restart persistence PASS;
- anonymous protected request denied;
- backup/verify PASS;
- restore readback PASS;
- SQLite integrity `ok`;
- public listener `false`.

### Repair smoke

`PASS`

Post-repair isolated state:

- affected authority ref preserved;
- scope `entity:ent:KOO`;
- Entity count `1`;
- writer grants `0`;
- instances `0`;
- SQLite integrity `ok`.

Полный `148/148` core regression не повторялся в этом correction-cycle, поскольку embedded core имеет exact ранее independently verified SHA-256 `242bfa...a46d` и deployment/repair code byte-identical v0.2.

## Fresh read-only host observation before future repair task

На real host перед этим acceptance KOO read-only проверил:

- `wb-oss-sandbox.service`: `active`;
- enabled: `enabled`;
- current release: `/opt/wb-oss-sandbox/releases/sha256-e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- `/health/live`: true;
- `/health/ready`: ready true;
- listener: only `127.0.0.1:18081`.

Это read-only observation и не заменяет SIS pre-write gate.

## Execution gate

Принятый bundle может использоваться только после отдельной SIS task, которая обязана повторно проверить exact artifact SHA-256, current host state, backup, repair preconditions и post-repair readback.

До завершения текущего KOO preservation checkpoint real-host repair не авторизуется, чтобы significant current state был externally published/readback-verified до следующей mutation.

После repair SIS обязан остановить дальнейшие project actions до KOO acceptance receipt.

## Boundary

Не разрешено этим документом:

- additional Entity registration;
- создание KOO operational instance/credential;
- writer grants;
- public ingress;
- production;
- improvised SQL repair;
- rollback путём ручного расширения authority scope.

---
from_entity: KOO
to_entity: KOD
document_type: OSS-v07-stageA-deploy-bundle-v03-acceptance
status: accepted_for_controlled_stageA_repair
bundle_sha256: 29d07687ad65bc2b366bd98bdd4bcd3f2a4670c87c05330819a31a2981d79c3a
bundle_size: 431131
embedded_core_sha256: 242bfa3705de5eb6f4476551b679289721e0ebfcf89c6534d0bff55813f0a46d
root_checksums: 87/87_OK
host_repair_authorized_by_this_document: no
production_allowed: no
project_time: generated_without_trusted_project_time
