# КОДЕРУ: финальная независимая проверка isolated external sandbox ОСС v0.6

## Решение

Пакет `KOD_entity-env-sandbox-v06_KOO.tar.gz` независимо проверен КООРДИНАТОРОМ.

Фактический SHA-256 архива:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

Проверено:

- архив безопасен для распаковки: path traversal, symlink и hardlink не обнаружены;
- внутренний `SHA256SUMS.txt`: **47 / 47 OK**;
- test modules независимо воспроизведены: **144 / 144 PASS**;
- local pilot regression: **44 / 44 PASS**;
- external sandbox baseline/review groups: PASS;
- S17-S21: **15 / 15 PASS**;
- S22: **5 / 5 PASS**;
- `verify_scenarios.py`: **A-F PASS**.

S22 подтверждён: произвольный файл больше не может быть импортирован как project authority evidence; canonical `authority-evidence/v1` связывает issuer, holder, action и scope, а импортируемое полномочие проверяется на exact semantic match с immutable SHA-256 evidence object.

## Acceptance

`isolated_sandbox_acceptance: accepted`

`accepted_version: v0.6`

`real_host_sandbox_deployment: allowed_after_host_preflight`

`production_allowed: no`

Локальный/изолированный этап считается завершённым. Новая функциональная ревизия sandbox до появления фактов real-host deployment не требуется.

## Неблокирующие наблюдения для host stage

Во время независимых прогонов Python выдавал `ResourceWarning` для части тестовых socket/lock/SQLite resources. Тесты при этом завершались PASS и state invariants не нарушались. Это не блокирует принятие isolated sandbox, но cleanup/close discipline нужно проверить при упаковке daemon/service для длительной работы на host.

`authority-evidence/v1` обеспечивает semantic binding и immutable SHA-256 identity, но не является криптографической подписью ОПЕРАТОРА. Для real-host stage нужно явно зафиксировать trusted local evidence ingress: кто и каким способом помещает evidence file в защищённый admin contour. Не считать один `operator_admin` credential доказательством авторства ОПЕРАТОРА.

## Следующий этап

Следующий профильный этап — deployment на конкретный real host. До выполнения изменений host требуется проверить фактические вводные выбранного узла: host identity, OS/version, доступ ОПЕРАТОРА, допустимые systemd/firewall/TLS changes, storage root и внешний HTTPS name/endpoint. Никакой конкретный существующий сервер этим review не назначается автоматически.

---

from_entity: KOO
to_entity: KOD
document_type: external-sandbox-final-independent-review
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
topic: shared-entity-environment
reviewed_version: v0.6
reviewed_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
internal_manifest: 47_of_47_ok
automated_tests: 144_of_144_pass
scenario_A_F: pass
isolated_sandbox_acceptance: accepted
real_host_sandbox_deployment: allowed_after_host_preflight
production_allowed: no
active_sources_changed: no
recovery_changed: no
project_time: generated_without_trusted_project_time
