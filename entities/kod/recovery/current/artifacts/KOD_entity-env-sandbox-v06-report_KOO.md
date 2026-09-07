# KOD: external sandbox ОСС v0.6 — отчёт KOO

## Результат

Исправлен единственный blocker S22 из независимой проверки KOO v0.5: project authority теперь может импортироваться только из структурированного immutable evidence object, чьё содержание само связывает issuer, holder, action и scope. Произвольный файл с корректным SHA-256 больше не является основанием для mint project authority.

## Реализация S22

Введён canonical JSON contract `authority-evidence/v1`. Coordinator самостоятельно читает evidence file, проверяет schema/type, canonical serialization, вычисляет SHA-256 и затем exact-сопоставляет `issuer_kind`, `issuer_ref`, `holder_entity_id`, `action`, `object_scope` с импортируемым authority. Клиент не может заменить эти semantic fields при import.

Поддержаны два evidence kinds: `project_authority` для проектного полномочия и `operator_bootstrap` для строго локального первичного bootstrap. Обычный текстовый/произвольный файл, non-canonical JSON, schema mismatch, holder/action/scope/issuer mismatch и SHA mismatch дают deterministic authority reject.

## Проверки

- прежние regression checks: **139 / 139 сохранены по составу**;
- новые S22 checks: **5 / 5 PASS**;
- общий automated suite: **144 / 144 PASS**;
- `verify_scenarios.py`: **A-F PASS**;
- internal `SHA256SUMS.txt`: проверяется после финальной упаковки/распаковки.

Новые adversarial checks:

1. `S22_arbitrary_file_cannot_mint_project_authority` — PASS;
2. `S22_evidence_holder_mismatch_rejected` — PASS;
3. `S22_evidence_action_mismatch_rejected` — PASS;
4. `S22_evidence_scope_mismatch_rejected` — PASS;
5. `S22_verified_structured_operator_evidence_authorizes_exact_declared_action_scope` — PASS.

Дополнительно credential generation переведена на 256-bit hex token representation, чтобы случайный ведущий `-` не интерпретировался CLI parser как option. Энтропия требования v0.1 сохранена: 32 random bytes / 256 bits.

## Граница изменений

Архитектура не расширялась. Реальный host/VPS, DNS, TLS, systemd, firewall, ChatGPT bridge, PostgreSQL, broker, WebSocket и distributed architecture не затрагивались.

`real_vps_deployed: no`

`production_changed: no`

`active_sources_changed: no`

`recovery_changed: no`

`recommendation: accept_isolated_sandbox_v06_for_final_independent_review`

`project_time: generated_without_trusted_project_time`
