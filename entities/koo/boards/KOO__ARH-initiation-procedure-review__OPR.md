# КООРДИНАТОР → ОПЕРАТОР
## Review исправления процедуры preservation/recovery/initiation АРХИВАРИУСА

## Решение

`ARH_operating_instruction_content_review: PASS`

`replacement_KOO_recovery_preflight: PASS`

`active_Project_Source_status: NOT_CHANGED`

## Что исправлено правильно

Кандидат `ARH__preservation-recovery-operating-instruction-candidate__KOO.md` закрывает обнаруженный procedural defect: publication/readback/receipt больше не подменяют адресную подготовку replacement-chat и не позволяют АРХИВАРИУСУ объявлять `initiation_verified` за новую Сущность.

Обязательная цепочка сформулирована корректно:

`current-writer snapshot → ARH integrity review → canonical publication → immutable readback → completion receipt → separate initiation-completion instruction → fresh new-instance external verification → initiation_verified`.

Отдельный файл `ARH__KOO-initiation-completion-instructions__KOO.md` реализует недостающий адресный шаг.

## Независимый preflight canonical KOO recovery

Проверено через GitHub:

- repository: `puev5691/wellbeing-entity-bootstrap`;
- canonical path: `entities/koo/recovery/current`;
- immutable commit: `ad159d463b45cc25e347165e57703a7edc1738f4` существует;
- exact composition: 6 ожидаемых файлов;
- Git blob identities всех 6 файлов совпадают с ARH instruction;
- `sha256sums.txt` на immutable commit содержит ожидаемые SHA-256 пяти content-bearing файлов;
- локальные bytes исходного KOO candidate для пяти content-bearing файлов дают те же SHA-256.

Это подтверждает готовность recovery package к fresh cold-start проверке новым экземпляром KOO.

## Что НЕ объявляется

Текущий экземпляр KOO не объявляет `initiation_verified` за будущий replacement-chat.

Новый экземпляр обязан самостоятельно:
1. проверить exact active Project Sources;
2. прочитать immutable recovery commit;
3. сверить composition/blobs/checksums;
4. прочитать snapshot/initiation/handoff и ARH instruction;
5. только после PASS объявить `initiation_verified`.

## Нормативный статус ARH operating instruction

Сам документ прямо имеет `candidate_only`. КООРДИНАТОР не повышает его до active Project Source без явного решения ОПЕРАТОРА.

Рекомендация: не плодить ещё один параллельный управляющий канон без harmonization. Использовать этот документ как обязательный operational candidate для текущего recovery cycle, а его инварианты передать в уже открытый KAN source-harmonization cycle для включения в successor recovery/source-loading norm. Это исключит расхождение с действующим `source-loading-policy-v2-approved.md` и дублирование recovery canon.

## Текущий практический статус

`replacement_chat_launch_material: READY`

Для нового чата достаточно передать `ARH__KOO-initiation-completion-instructions__KOO.md`; дальнейшую проверку новый KOO делает сам по указанному immutable locator.

---
from_entity: KOO
to_entity: OPR
document_type: ARH-initiation-procedure-review
status: PASS_with_source-status-boundary
production_allowed: no
project_time: generated_without_trusted_project_time
