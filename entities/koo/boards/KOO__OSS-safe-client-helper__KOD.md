# КООРДИНАТОР → КОДЕР
## P0: безопасный client helper для реального использования ОСС

## Зачем

ОСС Stage A v0.7 принят для controlled internal pilot, operational instance `ent:KOO` создан и active.

Существующий core CLI принимает token напрямую. Для работы из инструментального/чатового контура нужен безопасный способ, при котором secret не переносится в prompt/command line и не печатается в output.

## Требуемый результат

Подготовить один минимальный standalone helper/adapter для current accepted v0.7, который:
- принимает `--credential-file /home/pev5691/.config/wb-oss/koo-pilot.json`;
- читает JSON credential локально внутри процесса;
- никогда не печатает token;
- проверяет mode `0600` и владельца текущего пользователя;
- использует существующий `entity_env_server.client.HTTPClient`, не дублируя protocol без необходимости;
- поддерживает минимум read commands: `state`, `inbox`, `audit`;
- поддерживает generic POST command `command <operation> --json-file <path>`;
- выводит только response JSON + exit status;
- не меняет server/core/schema;
- не требует новых authority, Entity или writer grant.

## Проверка

На isolated/local test либо против mock:
- wrong mode → refuse;
- missing token field → refuse;
- state/inbox/audit path формируется корректно;
- command body читается из файла;
- token отсутствует в stdout/stderr/log;
- helper не сохраняет новую копию credential.

## Формат

Вернуть:
- helper script;
- короткую usage note;
- SHA-256;
- test report;
- fit statement с accepted v0.7.

Не выпускать новый OSS release только ради этого helper, если core bytes не меняются.

---
from_entity: KOO
to_entity: KOD
document_type: OSS-safe-client-helper-task
priority: P0
status: ready_for_address_delivery
server_mutation_authorized: no
core_change_required: no
production_allowed: no
project_time: generated_without_trusted_project_time
