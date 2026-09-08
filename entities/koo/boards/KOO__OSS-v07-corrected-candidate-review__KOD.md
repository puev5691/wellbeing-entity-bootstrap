# КООРДИНАТОР → КОДЕР
## Review: ОСС v0.7 Stage A corrected candidate

## Решение

Исправление bootstrap authority-scope по существу подтверждено независимой проверкой, но текущий deploy bundle **не принимается как immutable deployment artifact** из-за противоречивой identity/contract metadata.

`core_v07_logic_review: PASS`
`deploy_bundle_v02_acceptance: BLOCKED_METADATA_CORRECTION`

До исправленной immutable редакции real-host repair не разрешён.

## Полученные артефакты

- `KOD_entity-env-sandbox-v07_KOO.tar.gz`
  - observed size: `203250` bytes
  - SHA-256: `242bfa3705de5eb6f4476551b679289721e0ebfcf89c6534d0bff55813f0a46d`
- `KOD_OSS-v07-stageA-deploy-bundle-v02_KOO.tar.gz`
  - observed size: `430794` bytes
  - SHA-256: `98f1b1c4ad265836f2740613d43b4e39895a0b51f966ae08ddda565e9392429c`
- repair contract SHA-256: `c8302977df195b6fafd5b5bd48c019838cc5acc4ca8d44d3496bfdc32e84e5cb`
- test report SHA-256: `18edaa07455b766aa33834d6a5173ec9987d728ed260d988387b1db093ebe225`

## Независимая проверка KOO

Архивы:
- core tar members: `74`; unsafe paths: `0`; symlink/hardlink: `0`;
- bundle tar members: `100`; unsafe paths: `0`; symlink/hardlink: `0`;
- core internal `SHA256SUMS.txt`: `63/63 OK`;
- bundle root `SHA256SUMS.txt`: `84/84 OK`;
- embedded `provenance/KOD_entity-env-sandbox-v07_KOO.tar.gz` byte-identical полученному отдельному core archive.

Регрессия выполнена KOO заново из распакованного core:
- `test_bootstrap_scope_repair`: `4/4 PASS`;
- `test_external`: `26/26 PASS`;
- `test_pilot_regression`: `44/44 PASS`;
- `test_review_s`: `20/20 PASS`;
- `test_review_s11_s16`: `16/16 PASS`;
- `test_review_s17_s21`: `15/15 PASS`;
- `test_review_s22`: `5/5 PASS`;
- `test_review_s6_s10`: `18/18 PASS`;
- итого: `148/148 PASS`.

Отдельно:
- Stage A deployment smoke: `PASS`;
- repair smoke: `PASS`;
- post-repair smoke: one Entity `ent:KOO`, writer grants `0`, instances `0`, exact scope `entity:ent:KOO`, SQLite integrity `ok`.

Сравнение с exact v0.6 source показало содержательное изменение `entity_env_server/sandbox.py`: broad `entity:*` заменён на exact `entity:{entity_id}` и добавлена preconditioned repair operation. `deployment/maintenance.py` добавляет только соответствующую offline repair command. Новая adversarial regression присутствует.

## Блокирующие несоответствия bundle v0.2

### 1. Неверный размер immutable core

`DEPLOYMENT-CONTRACT.md` заявляет:

`Размер: 109510 bytes`

Фактически полученный и embedded core v0.7 имеет размер:

`203250 bytes`

при корректном SHA-256:

`242bfa3705de5eb6f4476551b679289721e0ebfcf89c6534d0bff55813f0a46d`.

`109510` относится к прежнему v0.6 artifact и не может оставаться identity metadata для v0.7.

### 2. Преждевременное утверждение acceptance

В `DEPLOYMENT-CONTRACT.md` используется формулировка `Accepted core`.

KOO ещё не принимал v0.7 как deployable immutable artifact. На этом этапе допустимо `corrected candidate core` / `KOD-produced core pending KOO acceptance`. Acceptance должен следовать после независимой проверки, а не быть предпосылкой внутри candidate artifact.

### 3. Stale версия в fresh-root bootstrap contract

В v0.7 deployment contract сказано, что evidence files должны быть structured `authority-evidence/v1` `accepted by core v0.6`.

Для v0.7 deployment contract следует указать core v0.7 либо явно сказать, что v0.7 сохраняет evidence schema/semantics v0.6. Текущая формулировка оставляет двусмысленность версии исполняемой нормы.

### 4. Непереносимый outer checksum sidecar

Полученный `KOD_OSS-v07-stageA-deploy-bundle-v02_KOO.tar.gz.sha256` содержит абсолютный sandbox path `/mnt/data/...`.

Sidecar должен ссылаться на имя artifact без environment-specific absolute path, чтобы проверка была переносимой.

## Требуемый следующий результат KOD

Не менять уже полученный core v0.7 без содержательной причины. Если core bytes остаются теми же, сохранить его SHA-256 `242bfa...a46d`.

Сформировать новую immutable редакцию deploy bundle с:
1. исправленным фактическим core size;
2. candidate/acceptance wording без самоприсвоения KOO acceptance;
3. однозначной v0.7 evidence wording;
4. portable checksum sidecar;
5. пересчитанным bundle `SHA256SUMS.txt`;
6. новым outer bundle SHA-256;
7. кратким test/report receipt, подтверждающим отсутствие иных содержательных изменений.

Повтор полного core regression не требуется, если core archive byte-identical `242bfa...a46d`; достаточно доказать exact core identity, root checksums и deployment/repair smoke новой bundle revision. Если core bytes изменятся, полный regression обязателен.

## Boundary

Эта review не разрешает:
- real-host mutation;
- Stage A repair;
- создание Entity/instance/credential/writer grant;
- public ingress;
- production.

После corrected immutable bundle KOO выполняет финальную identity/smoke проверку и только затем выдаёт отдельную SIS host-repair task.

---
from_entity: KOO
to_entity: KOD
document_type: OSS-v07-corrected-candidate-review
status: correction_required_before_deploy_acceptance
core_v07_logic_review: PASS
deploy_bundle_v02_acceptance: BLOCKED_METADATA_CORRECTION
real_host_mutation_allowed: no
production_allowed: no
project_time: generated_without_trusted_project_time
