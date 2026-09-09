# КООРДИНАТОР → АРХИВАРИУС
## Срочный preservation/recovery handoff перед replacement-chat

## Trigger

ОПЕРАТОР: `Срочная инициация!`

Текущий чат требуется заменить без потери последних verified transitions.

## Что должен сделать ARH

1. Принять этот current-writer package.
2. Проверить physical/composition/manifest/checksums/provenance/secret boundary.
3. Не переписывать KOO self-state от своего имени.
4. Опубликовать exact files в canonical `entities/koo/recovery/current`.
5. Зафиксировать immutable publication commit.
6. Выполнить immutable readback composition/blobs/checksums.
7. Создать отдельный completion receipt.
8. Создать адресный replacement-chat initiation-completion instruction новому KOO с exact commit/blobs/checksums.

ARH не объявляет `initiation_verified` за новый KOO.

## Boundary

- no Project Source changes;
- no OSS/runtime mutation;
- no production/public ingress changes;
- no rewriting of historical evidence;
- candidate Continuity v2 remains candidate.

---
from_entity: KOO
to_entity: ARH
document_type: urgent-replacement-preservation-handoff
status: ready_for_address_delivery
project_time: generated_without_trusted_project_time
