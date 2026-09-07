# Recovery-манифест КООРДИНАТОРА

## Назначение

Current recovery KOO после завершения isolated sandbox stage, согласования self-preservation KOD и решения ОПЕРАТОРА о нормативной фиксации ответственности за preservation/recovery.

Перед real-host preflight открыт короткий нормативный цикл КАНЦЕЛЯРА. Это текущий безопасный следующий шаг.

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/current
    ref: main
    manifest: MANIFEST.md
    checksums: sha256sums.txt

## Проверяемый состав

- `KOO__snapshot__KOO.md` — current snapshot;
- `../../initiation/KOO__initiation-current__KOO.md` — current initiation;
- `../../boards/KOO__priority-board__KOO.md` — current priority board;
- `../../boards/KOO__entity-recovery-registry__KOO.md` — current recovery registry;
- `../../boards/KOO_preservation-governance_KAN.md` — адресная нормативная задача КАНЦЕЛЯРУ;
- `../../developments/KOO__shared-entity-environment__KOO.md` — active development-state;
- `sha256sums.txt` — SHA-256 проверяемого состава.

## Обязательные Project Sources

Пять current approved Project Sources в версиях и SHA-256, перечисленных в snapshot/initiation.

Никакой successor-candidate не заменяет их до отдельного approval ОПЕРАТОРА.

## Критическая внешняя dependency

KOD accepted sandbox baseline:

    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/kod/recovery/current
    immutable_commit: feed2913424d852f2d05a8125d92a3c991e3418f
    artifact: artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz
    artifact_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
    artifact_git_blob: a25018efca6d84ff3d13bee0a790b623cc806e57
    status: accepted_for_real_host_preflight

## Активная нормативная dependency

ОПЕРАТОР утвердил модель ответственности preservation/recovery. До продолжения host-stage КАНЦЕЛЯР должен подготовить минимальный successor-пакет и conflict review.

Task:

    artifact_identity: KOO_preservation-governance_KAN.md
    source_entity: KOO
    recipient_entity: KAN
    locator: entities/koo/boards/KOO_preservation-governance_KAN.md
    version_identity: sha256:b79f70d3bf26d717cece28735fa9886e3ec61aa081e9eff795e78664e2c4c03a
    normative_status: operator_decision_approved_for_harmonization
    purpose: integrate preservation/recovery responsibility model into approved-source successors without premature activation

## Cold-start

1. Прочитать пять approved Project Sources.
2. Открыть KOO current recovery locator.
3. Проверить состав и `sha256sums.txt`.
4. Зафиксировать immutable Git commit фактически прочитанного recovery.
5. Прочитать initiation, snapshot, priority board, registry, active KAN task и development-state.
6. Проверить KOD recovery commit и exact sandbox artifact/version.
7. Вернуть `initiation_verified`, `initiation_loaded_external_unverified` либо `initiation_failed`.
8. Продолжить только следующий безопасный шаг: передать/доставить KAN нормативную задачу и получить successor-candidates + review.
9. Real-host preflight возобновляется только после закрытия этого нормативного цикла либо явного нового решения ОПЕРАТОРА.

## Failure mode

Если KOD accepted artifact или required recovery version не проверяются, host-stage dependency становится `unverified`; не подставлять локальный одноимённый файл и не начинать deployment.

Если KAN task недоступна или её версия не совпадает, не реконструировать решение по памяти: использовать exact artifact/version из recovery либо вернуть blocker.

---
entity: KOO
artifact_role: recovery_manifest
status: current
recovery_canon: v1.3 approved
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
