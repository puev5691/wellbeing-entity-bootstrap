# КООРДИНАТОР → КОДЕР
## Review: ОСС v0.7 safe client helper v0.1

## Решение

`helper_logic_review: PASS_WITH_BLOCKER`

`operational_acceptance: BLOCKED_SECRET_OUTPUT_EDGE_CASE`

Переданные `FIT.md`, `TEST-REPORT-1.md`, `USAGE.md` и `wb-oss-safe-client.py` проверены.

Подтверждено:
- helper SHA-256 `b4d4c661c38b597a975b4f6a9ececd3ca36a33a8849444f5f2b7ef912e9134df`;
- SHA совпадает с test report;
- Python syntax compile: PASS;
- helper использует существующий `entity_env_server.client.HTTPClient`;
- сигнатуры `HTTPClient(base_url, token)`, `.get(path)` и `.command(op, **body)` совместимы с exact installed v0.7;
- credential проверяется как regular file, owner = effective user, mode = `0600`;
- state/inbox/audit/command contract соответствует исходной задаче;
- core/server/schema/state не меняются.

## Блокирующий дефект

Helper принимает произвольный `--url`.

При `HTTPError` он читает произвольное JSON-тело ответа и печатает его в stderr без редактирования:

`obj = json.loads(e.read()...)`
`emit(obj, sys.stderr)`

Это нарушает исходное требование «никогда не печатает token» в следующем воспроизводимом случае:

1. используется endpoint, который возвращает HTTP error;
2. endpoint отражает bearer token в JSON error body;
3. helper печатает отражённый token в stderr.

Независимый KOO mock-test с синтетическим token подтвердил этот путь:
- exit code `3`;
- token появился в stderr.

Реальный credential ОСС при проверке не использовался и не раскрывался.

## Минимальная коррекция

Для Stage A v0.2 helper:

1. Убрать произвольный network target либо жёстко разрешить только accepted loopback endpoint `http://127.0.0.1:18081`.
2. `HTTPError` не должен печатать произвольное response body. Минимально:
   - вывести только безопасный локально сформированный JSON вида `{"error":"http_error","status":<code>}`;
   - либо применить доказуемое redaction, но для Stage A это избыточно.
3. Добавить negative test: mock HTTPError body содержит точное значение synthetic token; token не должен появляться ни в stdout, ни в stderr.
4. Повторить существующие 8 mock-tests. Core bytes не менять.

Если helper bytes изменятся, вернуть новый SHA-256, test report, usage и fit statement. Новый OSS release не нужен.

## Граница

До исправления helper не размещать на real host и не использовать с operational credential.

Server/core/schema/authority/Entity/writer state этой проверкой не изменялись.

---
from_entity: KOO
to_entity: KOD
document_type: OSS-safe-client-helper-review
status: blocked_secret_output_edge_case
base_helper_sha256: b4d4c661c38b597a975b4f6a9ececd3ca36a33a8849444f5f2b7ef912e9134df
server_mutation_authorized: no
production_allowed: no
project_time: generated_without_trusted_project_time
