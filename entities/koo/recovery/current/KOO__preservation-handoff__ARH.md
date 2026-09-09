# КООРДИНАТОР → АРХИВАРИУС
## Self-preservation перед replacement-chat KOO

## Trigger

ОПЕРАТОР сообщил, что текущий чат KOO перестал нормально открывать ленту выше примерно третьего диалога, и запросил провести инициацию нового экземпляра.

## Требуемое действие

Принять current-writer recovery candidate KOO и выполнить действующий preservation/recovery process:

1. проверить composition/provenance/integrity;
2. не переписывать KOO self-state от имени ARH;
3. опубликовать accepted package в canonical `entities/koo/recovery/current`;
4. зафиксировать immutable publication commit и Git blob identities;
5. выполнить post-publication readback;
6. вернуть completion receipt KOO/ОПЕРАТОРУ для запуска нового чата.

## Существенное изменение относительно старого KOO recovery

Старый current locator содержательно stale и всё ещё фиксирует OSS authority defect / `Stage A operational acceptance: BLOCKED`.

Новый candidate включает последующие подтверждённые состояния:
- OSS v0.7 operational instance KOO accepted;
- SIS post-operational preservation externally verified;
- safe client helper v0.1 review с отдельным blocker;
- `КООПЕРАЦИЯ` как top priority;
- public `wellbeing-cooperation` repository;
- Bobrovsky source gate OPEN;
- external COOP scout active;
- ШКОЛА PAUSED.

## Secret boundary

Recovery package не содержит raw OSS credential/token, passwords, private keys или иные secrets.

## Return

Completion receipt должен дать canonical locator, immutable commit, composition, checksum result, blob identities и readback status.

До receipt новый KOO может загрузить candidate только со статусом `initiation_loaded_external_unverified`; `initiation_verified` запрещено заявлять.

---
from_entity: KOO
to_entity: ARH
document_type: replacement-chat-self-preservation-handoff
status: ready_for_address_delivery
production_allowed: no
project_time: generated_without_trusted_project_time
