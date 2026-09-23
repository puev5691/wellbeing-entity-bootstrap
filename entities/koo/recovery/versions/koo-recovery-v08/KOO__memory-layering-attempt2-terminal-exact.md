# SIS: memory-layering E2E r0.1 — MAIN attempt 2 terminal

terminal: FAIL_SIS_MEMORY_LAYERING_E2E_R01_MAIN_ATTEMPT_2_EXECUTION
project_time: omitted

## Человеческий итог

MAIN attempt 2 не дошёл до OLD-01.

Pre-claim reconciliation прошла: corrected runtime identities совпали, preparation package checksum PASS, attempt-2 claim отсутствовал, новых ML-E2E blocker/successor после readmission не было.

После этого был создан durable claim attempt=2. С этого момента новая one-shot authority стала consumed.

Claim SHA-256:
7a866997d747ba8e66f77cfc2a3883271177aa4b918bdcf3f09aef784c280767

Дальше supervisor запустил structural verifier. При импорте package/verifier.py Python автоматически создал:
package/__pycache__/verifier.cpython-312.pyc

Это изменило состав immutable preparation package уже после claim. Structural verifier обнаружил лишний файл и корректно остановил execution с:
BLOCKED_INTEGRITY.

OLD-01 task logic не запускалась.
NEW-01 task logic не запускалась.
Corrected broker в этом attempt не запускался.
Semantic reads = 0.
Provider calls = 0.
Automatic retry = 0.

## Cleanup/readback

Побочный __pycache__ удалён.
Preparation package после cleanup:
- SHA256SUMS PASS;
- structural verifier через python3 -B PASS;
- runtime roots empty;
- worker code removed;
- broker socket absent;
- standing broker/worker absent.

Failure reconciliation:
stage = POST_CLAIM_PRE_OLD_EXECUTION
old_task_execution = 0
new_task_execution = 0
main_retry_performed = false

Attempt 2 authority остаётся consumed.
Attempt 3 = NOT_AUTHORIZED.

Historical attempt 1 не изменён и не reclassify/reset/replay.

## Что это означает

Этот FAIL не является отрицательным результатом synthetic recovery/selective-retrieval сценария: сценарий не начался.

Это execution-harness failure до OLD-01. Причина — нарушение immutability самим supervisor tooling через Python bytecode side effect.

Никаких выводов о реальной ChatGPT continuity или production-ready Fast Memory из этого attempt делать нельзя.

## EXPERIENCE

Идея → перед one-shot MAIN проверять immutable package не только по checksum, но и запускать checker так, чтобы сам checker физически не мог менять package.

Проба → после durable claim импортировать verifier и выполнить structural gate.

Результат → обычный Python import создал __pycache__ внутри immutable package; structural gate это обнаружил и остановил attempt до OLD-01.

Вердикт → FAIL execution harness, attempt 2 consumed, scenario не исполнен, retry запрещён.

Урок → verifier immutable package должен запускаться с PYTHONDONTWRITEBYTECODE=1 / python -B либо из read-only projection. Проверяющий инструмент не должен иметь возможность менять объект, который он проверяет.

---
КТО: SIS / СИСАДМИН r0.6
СТАТУС: FAIL_SIS_MEMORY_LAYERING_E2E_R01_MAIN_ATTEMPT_2_EXECUTION
