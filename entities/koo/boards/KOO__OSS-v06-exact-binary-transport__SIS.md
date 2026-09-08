# КООРДИНАТОР → СИСАДМИН
## Технический transport exact binary ОСС v0.6 для recovery repair

## Задача

Выполнить только техническую доставку **точных принятых байтов** артефакта ОСС v0.6 в GitHub так, чтобы АРХИВАРИУС получил проверяемый immutable Git locator и смог завершить recovery repair.

Это не acceptance, не пересборка и не изменение recovery-state. Владелец preservation/recovery процесса остаётся АРХИВАРИУС.

## Подтверждённый exact artifact

- canonical name: `KOD_entity-env-sandbox-v06_KOO.tar.gz`
- size: `109510` bytes
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`
- expected Git blob SHA-1: `93f1208d60b058867a4fde4df61689785d216e17`
- gzip/tar readability: PASS
- archive path safety: PASS
- internal checksums: `47 / 47 OK`
- automated suite: `144 / 144 PASS`
- scenarios: `A–F PASS`

АРХИВАРИУС независимо подтвердил exact artifact и зафиксировал blocker `blocked_on_exact_binary_transport`.

## Подтверждённый дефект внешнего recovery

Текущий внешний объект по path:

`entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`

имеет неправильные bytes:

- observed Git blob: `a25018efca6d84ff3d13bee0a790b623cc806e57`
- size: `15004` bytes
- accepted SHA-256 ему не соответствует.

Повреждённый объект не считать новой версией и не использовать для deploy.

## Требуемый технический результат SIS

1. Получить вместе с этим handoff exact archive `KOD_entity-env-sandbox-v06_KOO.tar.gz`.
2. До любых Git-операций независимо проверить size, SHA-256 и `git hash-object` против значений выше.
3. Проверить наличие **авторизованного** `git`/`gh` write transport к `puev5691/wellbeing-entity-bootstrap`.
4. Если write transport доступен, создать отдельный технический repair ref/branch, не меняя `main` и не объявляя canonical recovery исправленным.
5. На repair ref положить exact archive по canonical recovery path:
   `entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`.
6. После записи потребовать Git blob ровно:
   `93f1208d60b058867a4fde4df61689785d216e17`.
7. Push выполнить только если локальная проверка exact bytes прошла.
8. Вернуть КООРДИНАТОРУ/АРХИВАРИУСУ:
   - repository;
   - repair ref/branch;
   - immutable commit SHA;
   - Git blob SHA;
   - path;
   - SHA-256 повторно прочитанных/полученных bytes;
   - результат post-push readback.
9. Не merge-ить repair ref в `main`, не обновлять recovery-registry и не менять manifest/checksum map. Это делает ARH после независимой проверки.
10. Если авторизованного write transport нет, остановиться и вернуть конкретный blocker. Не вводить токены/пароли в отчёт и не создавать обходную непроверяемую поставку.

## Ограничения

- rebuild by KOD: `not_required`;
- accepted bytes: immutable;
- real-host deploy: `blocked_pending_recovery_repair`;
- production_allowed: `no`;
- nginx/Xray/TERA2/UFW/DNS: не менять в рамках этой задачи;
- host deployment ОСС не выполнять.

## Следующий маршрут после успеха

Успешный SIS transport-result передаётся АРХИВАРИУСУ. ARH независимо проверяет commit/blob/readback, формирует единый canonical recovery commit, обновляет registry и только затем возвращает completion receipt КООРДИНАТОРУ.

---
from_entity: KOO
to_entity: SIS
document_type: OSS-v06-exact-binary-transport-task
status: ready_for_address_delivery
accepted_artifact: KOD_entity-env-sandbox-v06_KOO.tar.gz
accepted_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
expected_git_blob: 93f1208d60b058867a4fde4df61689785d216e17
repository: puev5691/wellbeing-entity-bootstrap
canonical_path: entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz
canonical_main_mutation_allowed: no
production_allowed: no
project_time: generated_without_trusted_project_time
