# Recovery-манифест КООРДИНАТОРА

## Назначение

Current recovery KOO после завершения isolated sandbox stage и перед real-host preflight.

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
- `../../developments/KOO__shared-entity-environment__KOO.md` — active development-state;
- `sha256sums.txt` — SHA-256 проверяемого состава.

## Обязательные Project Sources

Пять approved Project Sources v2.1/v2.3/v1.3/v2 в версиях и SHA-256, перечисленных в snapshot/initiation.

## Критическая внешняя dependency

KOD accepted sandbox baseline:

    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/kod/recovery/current
    immutable_commit: feed2913424d852f2d05a8125d92a3c991e3418f
    artifact: artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz
    artifact_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
    artifact_git_blob: a25018efca6d84ff3d13bee0a790b623cc806e57
    status: accepted_for_real_host_preflight

## Cold-start

1. Прочитать пять approved Project Sources.
2. Открыть KOO current recovery locator.
3. Проверить состав и `sha256sums.txt`.
4. Зафиксировать immutable Git commit фактически прочитанного recovery.
5. Прочитать initiation, snapshot, priority board, registry и development-state.
6. Проверить KOD recovery commit и exact sandbox artifact/version.
7. Вернуть `initiation_verified`, `initiation_loaded_external_unverified` либо `initiation_failed`.
8. Продолжить только следующий безопасный шаг: real-host preflight.

## Failure mode

Если KOD accepted artifact или required recovery version не проверяются, host-stage dependency становится `unverified`; не подставлять локальный одноимённый файл и не начинать deployment.

---
entity: KOO
artifact_role: recovery_manifest
status: current
recovery_canon: v1.3 approved
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
