# КООРДИНАТОР → СИСАДМИН
## Host-local staging verification Stage A bundle ОСС v0.6

## Решение

КООРДИНАТОР независимо проверил deployable bundle КОДЕРА и принял его в статусе:

`accepted_for_target_host_staging`

Разрешается выполнить **только host-local staging verification** на `uk.wbnetrus.ru`.

Это не installation, не systemd activation, не bootstrap project authority и не production deployment.

## Проверяемый bundle

File:

`KOD_OSS-v06-stageA-deploy-bundle-v01_KOO.tar.gz`

Expected identity:

- size: `245271` bytes;
- SHA-256: `e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490`;
- Git-compatible blob SHA-1: `c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6`.

Embedded accepted core:

- `provenance/KOD_entity-env-sandbox-v06_KOO.tar.gz`;
- size `109510`;
- SHA-256 `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`.

Bundle root checksum map:

`SHA256SUMS.txt` → expected `64 / 64 OK`.

Accepted core checksum map:

`core/SHA256SUMS.txt` → expected `47 / 47 OK`.

## Target

Host:

`uk.wbnetrus.ru` / `185.39.19.240`

SSH:

`2222/tcp`

Stage A candidate listener:

`127.0.0.1:18081`

Target runtime contract:

Python `3.12.x`, stdlib only.

## Разрешённая последовательность

1. Подтвердить собственный текущий SIS status `initiation_verified`.
2. Получить exact bundle через binary-safe transport. Не реконструировать archive через текст модели.
3. До extraction проверить size, SHA-256 и Git-compatible blob против значений выше.
4. Проверить tar path safety и отсутствие неожиданных symlink/hardlink entries.
5. Распаковать bundle только в временный staging-каталог, не в `/opt`, `/var/lib` или `/etc`.
6. Проверить root `SHA256SUMS.txt` полностью: `64 / 64 OK`.
7. Проверить embedded accepted core archive identity и `core/SHA256SUMS.txt`: `47 / 47 OK`.
8. Проверить фактический `/usr/bin/python3 --version`; продолжать только если это Python `3.12.x`.
9. Перед smoke повторно проверить, что `127.0.0.1:18081` свободен.
10. Запустить:
   `/usr/bin/python3 deployment/smoke_test.py`
   из unpacked bundle.
11. Потребовать:
   - exit code `0`;
   - `status: PASS`;
   - listener `127.0.0.1:18081`;
   - `/health/live`: true;
   - `/health/ready`: true;
   - structured-evidence bootstrap smoke: PASS;
   - restart state persistence: PASS;
   - anonymous protected endpoint denied;
   - backup verify: PASS;
   - restore readback: PASS;
   - graceful SQLite integrity: `ok`;
   - public listener: false.
12. После smoke убедиться, что port `18081` освобождён и не осталось daemon процесса.
13. Вернуть КООРДИНАТОРУ один staging report с фактическими hashes, Python version и smoke result.
14. После отчёта остановиться.

## Запрещено этой задачей

- создавать `/opt/wb-oss-sandbox/current` или release symlink;
- создавать постоянный `/var/lib/wb-oss-sandbox` state;
- создавать `/etc/wb-oss-sandbox` credentials/evidence;
- выполнять operator-admin bootstrap для реального Stage A state;
- выбирать или регистрировать первую Сущность;
- создавать user/group `wb-oss`;
- устанавливать/enable/start systemd unit;
- менять nginx/Xray/TERA2/UFW/DNS/public TLS;
- открывать public ingress;
- менять production;
- менять recovery-registry;
- продолжать deployment после любого mismatch.

## Критерий успеха

`host_staging_status: PASS`

означает только, что exact bundle воспроизводимо работает на целевом host/runtime и готов к отдельному installation/bootstrap/activation решению КООРДИНАТОРА.

После PASS КООРДИНАТОР отдельно зафиксирует bootstrap authority decision ОПЕРАТОРА и выдаст следующую deployment-задачу.

---
from_entity: KOO
to_entity: SIS
document_type: OSS-v06-stageA-host-staging-verification-task
status: ready_for_address_delivery
bundle_sha256: e1829f0f6cc3c1be54eb40106448f872149bbbde8de7d1073ed32ff3ae9b7490
bundle_git_blob: c8fb5f91f18a172dd9937e1dd4b6cf1786ed08b6
target_host: uk.wbnetrus.ru
target_python: 3.12.x
stageA_port: 127.0.0.1:18081
persistent_install_allowed: no
bootstrap_authority_allowed: no
production_allowed: no
project_time: generated_without_trusted_project_time
