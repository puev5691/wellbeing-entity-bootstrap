# КООРДИНАТОР → КОДЕР
## Подготовка deployable Stage A bundle ОСС на базе accepted v0.6

## Решение

Recovery-blocker ОСС v0.6 закрыт, а текущий экземпляр СИСАДМИНА прошёл fresh external recovery verification со статусом `initiation_verified`.

Real-host preflight `uk.wbnetrus.ru` ранее признал host пригодным для ограниченного single-node Stage A sandbox. Поэтому КООРДИНАТОР разрешает перейти к подготовке **deployable Stage A bundle**.

Это пока не host deployment. Профильная задача КОДЕРА: превратить уже принятую реализацию ОСС v0.6 из implementation harness в однозначно запускаемый deployment artifact/runtime contract, не меняя принятые архитектурные семантики без необходимости.

## Основание

Accepted core artifact:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

Exact identity:

- size: `109510` bytes;
- Git blob: `93f1208d60b058867a4fde4df61689785d216e17`;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- canonical recovery repair commit: `48a8aa581147cfe1c0560e46a2edee291ed371e8`.

Accepted verification state:

- automated suite: `144 / 144 PASS`;
- internal checksums: `47 / 47 OK`;
- scenarios: `A–F PASS`;
- `production_allowed: no`.

## Почему нужен отдельный KOD-шаг

Текущий v0.6 README прямо определяет пакет как implementation harness, а не deployment. В составе есть `entity_env_server.httpd.serve(...)`, но нет однозначного long-running daemon entrypoint и полного host runtime/launch contract, который СИСАДМИН мог бы безопасно перенести в systemd без собственной разработки приложения.

СИСАДМИН не должен изобретать application runtime вместо КОДЕРА.

## Зафиксированная Stage A host-схема

Host: `uk.wbnetrus.ru` / `185.39.19.240`

Предварительно принятая схема размещения:

- coordinator listen: `127.0.0.1:18081`;
- persistent state root: `/var/lib/wb-oss-sandbox`;
- releases: `/opt/wb-oss-sandbox/releases/<immutable-version>/`;
- current symlink: `/opt/wb-oss-sandbox/current`;
- config/secrets boundary: `/etc/wb-oss-sandbox/`;
- backup root: `/var/backups/wb-oss-sandbox/`;
- operator access: SSH port-forward через существующий `2222/tcp`;
- system-level service;
- nginx/Xray/TERA2/UFW/DNS на Stage A не менять;
- external HTTPS на этом этапе не требуется;
- `production_allowed: no`.

Host runtime confirmed ранее: Ubuntu 24.04.4 LTS, Python 3.12.3, SQLite 3.45.1, systemd 255, x86_64.

## Требуемый результат КОДЕРА

Подготовить **один самостоятельный deployable bundle** и краткий deployment contract для СИСАДМИНА.

Минимально bundle/contract должен задавать:

1. immutable version/name нового deployment bundle;
2. SHA-256 и manifest/checksum map;
3. точный long-running launch command для coordinator HTTP service на `127.0.0.1:18081`;
4. точный Python/runtime dependency contract;
5. state-root/config paths и необходимые permissions без secrets в bundle;
6. init/bootstrap procedure для fresh root;
7. health contract: `/health/live` и `/health/ready`;
8. graceful stop/restart behavior;
9. migration/startup behavior для SQLite;
10. backup/restore commands, уже поддерживаемые приложением, в форме пригодной для SIS deployment;
11. systemd-facing runtime requirements и рекомендуемый `ExecStart`, но без самостоятельного изменения host;
12. явные параметры/переменные окружения и безопасный способ передачи bearer/admin credentials без помещения raw secrets в repository, argv logs или recovery;
13. rollback criterion на предыдущий release path;
14. проверяемый post-start smoke-test contract для SIS.

## Обязательные проверки до передачи SIS

На fresh temporary root воспроизвести как минимум:

- bundle integrity PASS;
- полный regression suite не хуже accepted v0.6 baseline;
- coordinator стартует на loopback и заданном порту;
- `/health/live` PASS;
- `/health/ready` PASS;
- fresh bootstrap procedure PASS;
- restart с сохранённым SQLite/state PASS;
- protected endpoint без credential отклоняется;
- backup создаётся и проверяется;
- restore-to-staging/readback PASS;
- graceful shutdown не повреждает SQLite;
- никакой listener на `0.0.0.0` не появляется по умолчанию.

Если для deployability требуется менять core application semantics или security boundary, **не считать это просто adapter**: остановиться, оформить новую версию реализации и вернуть её на отдельную независимую acceptance-проверку КООРДИНАТОРУ.

Если достаточно добавить launcher/config/deployment wrapper поверх exact accepted v0.6 без изменения core semantics, это должно быть явно доказано checksum/provenance и тестами.

## Что запрещено этой задачей

- подключаться к real host и выполнять deploy;
- менять nginx/Xray/TERA2/UFW/DNS;
- открывать public ingress;
- создавать production state;
- менять approved project norms/roles/recovery;
- объявлять Stage A production;
- переписывать accepted v0.6 задним числом под тем же immutable identity.

## Следующий маршрут

КОДЕР возвращает КООРДИНАТОРУ bundle + manifest/checksums + runtime/deployment contract + test report.

После независимой проверки КООРДИНАТОР выдаёт **одну** профильную deployment-задачу СИСАДМИНУ на `uk.wbnetrus.ru` по уже утверждённой loopback Stage A схеме.

---
from_entity: KOO
to_entity: KOD
document_type: OSS-v06-stageA-deployment-adapter-task
status: ready_for_address_delivery
base_artifact: KOD_entity-env-sandbox-v06_KOO.tar.gz
base_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
host_target_after_KOO_acceptance: uk.wbnetrus.ru
stageA_listen: 127.0.0.1:18081
stageA_state_root: /var/lib/wb-oss-sandbox
real_host_changes_allowed_by_this_task: no
production_allowed: no
project_time: generated_without_trusted_project_time
