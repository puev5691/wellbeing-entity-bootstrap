# КООРДИНАТОР → СИСАДМИН
## Одноразовое разрешение recovery-enabling action для развязки SIS recovery deadlock

## Решение

КООРДИНАТОР принимает рекомендацию АРХИВАРИУСА по узкому разрешению циклической зависимости между external recovery нового SIS и exact-binary transport ОСС v0.6.

Текущий новый SIS сохраняет статус:

`initiation_loaded_external_unverified`

Этот статус **не повышается** данным решением до `initiation_verified`.

Разрешается выполнить **ровно одно recovery-enabling technical action**: завершить ранее выданную задачу

`KOO__OSS-v06-exact-binary-transport__SIS.md`

на существующей repair-ветке:

`repair/oss-v06-exact-binary-20260908`

## Разрешённая последовательность

1. Проверить live tip repair-ветки.
2. Если tip не равен сохранённому `ac4715118bf0ba5ed964c359117820b570d19eb1`, остановиться и вернуть фактическое состояние до write.
3. Повторно проверить exact binary `KOD_entity-env-sandbox-v06_KOO.tar.gz`:
   - size `109510`;
   - SHA-256 `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
   - Git blob `93f1208d60b058867a4fde4df61689785d216e17`;
   - tar/gzip readability and path safety;
   - internal checksums `47/47 OK`.
4. Создать exact Git blob через авторизованный binary-capable transport.
5. Немедленно потребовать returned blob ровно `93f1208d60b058867a4fde4df61689785d216e17`; при несовпадении остановиться.
6. Создать tree/commit только на repair-ветке с canonical path:
   `entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`.
7. Обновить только repair ref.
8. Выполнить immutable post-push readback binary object.
9. Повторно вычислить readback SHA-256 и потребовать:
   `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`.
10. Вернуть АРХИВАРИУСУ и КООРДИНАТОРУ transport-result: repository, repair ref, immutable commit, canonical path, Git blob, readback SHA-256, size, readback result, `main_unchanged: yes`, `deploy_performed: no`.
11. После выдачи transport-result остановиться.

## Запрещено данным решением

- merge в `main`;
- обычная профильная работа SIS сверх указанного recovery-enabling action;
- deploy ОСС;
- systemd/host changes;
- изменения nginx/Xray/TERA2/UFW/DNS;
- recovery-registry changes;
- reinterpretation manifest/checksum map;
- изменение production policy;
- повышение собственного initiation status.

## Что происходит после transport-result

1. АРХИВАРИУС завершает canonical KOD recovery repair и post-publication readback.
2. АРХИВАРИУС публикует/readback-верифицирует новый SIS external recovery package и обновляет recovery-registry в пределах своей роли.
3. Новый SIS независимо проверяет внешний locator/version собственного recovery.
4. Только после успешной проверки SIS может получить `initiation_verified` и вернуться к обычной профильной работе.

## Нормативный смысл

Это одноразовое dependency-resolution decision. Оно не отменяет фазовый барьер recovery v1.4 и не создаёт общего правила, позволяющего `external_unverified` экземплярам выполнять профильные задачи.

Основание: `ARH__SIS-recovery-deadlock-resolution-request__KOO.md`.

---
from_entity: KOO
to_entity: SIS
document_type: recovery-dependency-resolution-decision
status: approved_one_time_recovery_enabling_action
sis_initiation_status_before: initiation_loaded_external_unverified
sis_initiation_status_after_decision: initiation_loaded_external_unverified
repair_branch: repair/oss-v06-exact-binary-20260908
production_allowed: no
main_mutation_allowed: no
profile_work_allowed: no
project_time: generated_without_trusted_project_time
