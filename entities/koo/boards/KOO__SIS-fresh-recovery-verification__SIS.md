# КООРДИНАТОР → СИСАДМИН
## Fresh external recovery verification после завершения repair-cycle

## Задача

Выполнить только fresh external recovery verification собственного SIS recovery по immutable publication commit:

`950f01dc5cdb56c3ea63ba540c4e72eda24973bb`

Цель: независимо подтвердить continuity нового SIS instance после того, как АРХИВАРИУС завершил publication/readback и recovery repair.

## Проверяемый locator

Repository:

`puev5691/wellbeing-entity-bootstrap`

Path:

`entities/sis/recovery/current`

Immutable commit:

`950f01dc5cdb56c3ea63ba540c4e72eda24973bb`

АРХИВАРИУС сообщил, что package publication/readback завершены, checksum entries `8 / 8` проверены, а exact binary ОСС v0.6 внутри package имеет:

- size `109510` bytes;
- Git blob `93f1208d60b058867a4fde4df61689785d216e17`;
- SHA-256 `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`.

## Требуемое действие SIS

1. Независимо прочитать recovery package именно из immutable commit `950f01dc...73bb`.
2. Проверить состав package по `SIS__recovery-manifest__SIS.md`.
3. Проверить `sha256sums.txt` и все `8 / 8` entries.
4. Проверить exact binary identity по size, Git blob и SHA-256.
5. Зафиксировать фактически прочитанные commit/blob identifiers.
6. Если всё совпадает, вернуть КООРДИНАТОРУ/АРХИВАРИУСУ fresh initiation report со статусом `initiation_verified`.
7. При любом mismatch вернуть `initiation_failed` либо `initiation_loaded_external_unverified` с точным blocker.

## Ограничения

Эта задача не является deploy.

До завершения fresh verification:

- real-host deploy не начинать;
- production не менять;
- nginx/Xray/TERA2/UFW/DNS не менять;
- recovery-registry самостоятельно не менять;
- не переопределять KOD acceptance или recovery state.

После успешного fresh initiation КООРДИНАТОР отдельно решит вопрос снятия blocker real-host Stage A deployment.

---
from_entity: KOO
to_entity: SIS
document_type: SIS-fresh-external-recovery-verification-task
status: ready_for_address_delivery
sis_recovery_commit: 950f01dc5cdb56c3ea63ba540c4e72eda24973bb
expected_exact_binary_blob: 93f1208d60b058867a4fde4df61689785d216e17
expected_exact_binary_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
real_host_deploy_allowed_by_this_task: no
production_allowed: no
project_time: generated_without_trusted_project_time
