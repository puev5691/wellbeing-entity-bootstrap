# Recovery-манифест КООРДИНАТОРА

## Назначение

Current recovery KOO после активации roles v2.2 и recovery-canon v1.4 и перед передачей регулярной эксплуатации preservation/recovery АРХИВАРИУСУ.

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/current
    ref: main
    manifest: MANIFEST.md
    checksums: sha256sums.txt

## Проверяемый состав

- `KOO__snapshot__KOO.md`;
- `../../initiation/KOO__initiation-current__KOO.md`;
- `../../boards/KOO__priority-board__KOO.md`;
- `../../boards/KOO__entity-recovery-registry__KOO.md`;
- `../../boards/KOO_preservation-operations_ARH.md`;
- `../../developments/KOO__shared-entity-environment__KOO.md`;
- `sha256sums.txt`.

## Active Project Sources

- roles v2.2 approved;
- recovery-canon v1.4 approved;
- project instructions v2.1, file canon v2.3, source-loading v2 unchanged.

Точные SHA-256 перечислены в initiation/snapshot/task ARH.

## Критическая technical dependency

KOD accepted sandbox v0.6:

    artifact: entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz
    sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
    status: accepted_for_real_host_preflight

## Текущий безопасный следующий шаг

Передать `KOO_preservation-operations_ARH.md` текущему экземпляру АРХИВАРИУСА и получить receipt/acceptance либо проверяемый failure-mode.

После принятия ARH эксплуатационного контура вернуться к real-host preflight ОСС.

## Failure mode

Если ARH недоступен либо не может проверить active source versions, зафиксировать delivery/acceptance blocker. KOO не принимает на себя регулярную архивную эксплуатацию вместо ARH и не обновляет чужие self-snapshot.

---
entity: KOO
artifact_role: recovery_manifest
status: current
recovery_canon: v1.4 approved
project_scope: ШТАБ БЛАГОПОЛУЧИЯ
project_time: generated_without_trusted_project_time
