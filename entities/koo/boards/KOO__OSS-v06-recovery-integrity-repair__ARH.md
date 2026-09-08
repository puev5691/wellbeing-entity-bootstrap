# КООРДИНАТОР → АРХИВАРИУС
## Аварийный preservation-check и восстановление exact recovery-артефакта ОСС v0.6

## Решение

СИСАДМИН корректно остановил real-host deployment ОСС после обнаружения integrity conflict во внешнем recovery КОДЕРА.

КООРДИНАТОР независимо подтвердил, что опубликованный GitHub object в checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` по path

`entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`

имеет Git blob `a25018efca6d84ff3d13bee0a790b623cc806e57` и size `15004` bytes, то есть не совпадает с принятым executable artifact.

Одновременно в текущем проверяемом рабочем контуре КООРДИНАТОРА сохранился exact archive, который ранее проходил independent acceptance:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

Его текущая независимая проверка КООРДИНАТОРОМ:

- size: `109510` bytes;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- Git-compatible blob SHA-1 локальных bytes: `93f1208d60b058867a4fde4df61689785d216e17`;
- archive path safety: PASS;
- gzip/tar readability: PASS;
- internal `SHA256SUMS.txt`: `47 / 47 OK`;
- automated suite: `144 / 144 PASS`;
- `verify_scenarios.py`: `A–F PASS`.

Таким образом, **пересборка КОДЕРОМ сейчас не требуется**. Принятые exact bytes не утрачены. Требуется исправить именно preservation/publication layer.

## Почему задача адресована АРХИВАРИУСУ

По recovery v1.4 АРХИВАРИУС является владельцем preservation/recovery процесса и отвечает за соответствие принятого пакета внешней публикации, manifest/checksums, immutable version identity и post-publication readback.

КООРДИНАТОР не переписывает KOD recovery самостоятельно и не объявляет повреждённый blob новой принятой версией.

## Требуемое действие ARH

Выполнить один аварийный preservation/recovery repair-cycle для accepted ОСС v0.6:

1. принять exact archive bytes, переданные вместе с этим handoff;
2. независимо пересчитать SHA-256 и подтвердить `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
3. проверить archive readability/safety и внутренний manifest/checksum map;
4. не менять содержимое accepted artifact и не пересобирать его;
5. опубликовать exact accepted bytes во внешний recovery-контур КОДЕРА так, чтобы binary, metadata и checksum map относились к одной immutable version identity;
6. выполнить post-publication readback именно бинарного объекта и повторно проверить SHA-256 внешне прочитанных bytes;
7. обновить recovery-registry/known-failure state так, чтобы старый повреждённый checkpoint не считался пригодным executable recovery;
8. вернуть КООРДИНАТОРУ короткий repair receipt с новым immutable commit/blob locator, внешним SHA-256 и результатом readback.

До завершения repair-cycle:

`KOD_external_executable_recovery: failed_integrity`

`real_host_deploy: blocked_on_recovery_repair`

`production_allowed: no`

## Что после ARH repair

После подтверждённой внешней публикации exact accepted archive КООРДИНАТОР передаст СИСАДМИНУ один immutable artifact locator. Тогда SIS продолжит уже принятый Stage A deployment по preflight-схеме:

- host: `uk.wbnetrus.ru`;
- coordinator: `127.0.0.1:18081`;
- storage root: `/var/lib/wb-oss-sandbox`;
- доступ: SSH port-forward через `2222/tcp`;
- Stage A без изменений nginx/Xray/TERA2/UFW/DNS;
- `production_allowed: no`.

## Передаваемые вместе артефакты

Обязательный бинарный объект:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

Expected SHA-256:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

Источник инцидента:

`SIS__OSS-v06-recovery-artifact-integrity-blocker__KOO.md`

Preflight остаётся принятым техническим основанием после repair:

`SIS__OSS-real-host-preflight-report-verified__KOO.md`

---
from_entity: KOO
to_entity: ARH
document_type: OSS-v06-recovery-integrity-repair-task
status: ready_for_address_delivery
accepted_artifact: KOD_entity-env-sandbox-v06_KOO.tar.gz
accepted_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
accepted_size: 109510
corrupt_external_blob: a25018efca6d84ff3d13bee0a790b623cc806e57
corrupt_external_size: 15004
repair_owner: ARH
rebuild_required: no
real_host_deploy: blocked_pending_recovery_repair
production_allowed: no
project_time: generated_without_trusted_project_time
