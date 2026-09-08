# СИСАДМИН → КООРДИНАТОР
## Проверенный preflight `uk.wbnetrus.ru` для single-node sandbox ОСС

## Решение

**Host пригоден для размещения single-node sandbox ОСС с ограниченной нагрузкой.**

Рекомендуемая Stage A схема: coordinator + SQLite на этом host, coordinator слушает только `127.0.0.1:18081`, file field хранится локально в отдельном state-root, доступ ОПЕРАТОРА выполняется через SSH port-forward. На первой sandbox-стадии не требуется менять nginx, Xray, TERA2, DNS или firewall.

- `production_allowed: no`
- `preflight_is_deploy: no`
- `host_suitability: conditional_yes`

Условие перехода к deploy одно: КООРДИНАТОР/КОДЕР должен передать конкретный утверждённый программный артефакт ОСС либо immutable locator на него и runtime/launch contract. На host готовой реализации coordinator-а не обнаружено, а во входной задаче её locator не задан. Самостоятельно изобретать реализацию вместо утверждённой ОСС СИСАДМИН не должен.

## Свежо подтверждённая идентичность host

Проверки выполнены непосредственно на сервере через удалённый terminal-контур после явного разрешения ОПЕРАТОРА.

- hostname: `ruvds-xnqc6`;
- DNS `uk.wbnetrus.ru` → `185.39.19.240`;
- `eth0`: `185.39.19.240/24`;
- default gateway: `185.39.19.1`;
- SSH ED25519 fingerprint: `SHA256:+QiM/uh5SBrkm4KpKFR4QCnq5Tcak256OMmg8CdHf2Y`;
- пользователь: `pev5691`, `uid=1000`, группы `sudo`, `users`;
- Ubuntu `24.04.4 LTS`, codename `noble`;
- kernel `6.17.0-1022-azure`, `x86_64`;
- systemd `255`;
- `systemctl is-system-running` → `running`;
- CPU: 1 vCPU, Intel Xeon Gold 6128;
- Python `3.12.3`;
- Python SQLite library: SQLite `3.45.1`;
- системный Node TERA2: `/usr/bin/node` v18.19.1.

## Ресурсы

Свежий замер:

- RAM total: `1.8 GiB`;
- RAM available во время preflight: около `855 MiB`;
- swap: `1.0 GiB`, использовано `0 B`;
- `/`: ext4, `40 GiB`, использовано `12 GiB`, свободно `26 GiB`, `32%`;
- inode usage: `7%`;
- load average в одном из замеров: `0.31 / 0.55 / 0.68`.

### TERA2

- `wbn-tera2-node.service` → `active/running`;
- `NRestarts=0`;
- `MemoryCurrent=624918528` bytes, около 596 MiB;
- TERA2 DATA: около `2.3 GiB`;
- TERA2 logs: около `96 KiB`.

### Xray

- `xray.service` → `active/running`;
- `NRestarts=0`;
- `MemoryCurrent=43995136` bytes, около 42 MiB.

### nginx

- `nginx.service` → `active/running`;
- `NRestarts=0`;
- `MemoryCurrent=4370432` bytes, около 4 MiB.

Во время preflight Remote Desktop Commander занимал дополнительно примерно 365 MiB RSS несколькими пользовательскими процессами. Это временная диагностическая нагрузка и делает замер RAM консервативным.

### Ресурсное заключение

Для лёгкого Stage A coordinator-а без broker, с SQLite и малой конкурентностью ресурсов достаточно.

Рекомендуемый initial limit:

- `MemoryHigh=320M`;
- `MemoryMax=384M`;
- `CPUQuota=50%`;
- SQLite WAL и bounded cache;
- никаких отдельных broker/database-server процессов.

Host не следует считать пригодным для тяжёлой production-нагрузки ОСС.

## Существующие сервисы и порты

Свежий `ss -lntp`:

| Port | Bind | Service |
|---|---|---|
| `80/tcp` | `0.0.0.0` | nginx |
| `443/tcp` | `*` | Xray |
| `10085/tcp` | `*` | Xray |
| `2222/tcp` | `0.0.0.0`, `[::]` | sshd/systemd |
| `8780/tcp` | `0.0.0.0` | Node / TERA2 web-process |
| `8781/tcp` | `0.0.0.0` | Node / TERA2 |
| `30000/tcp` | `0.0.0.0` | Node / TERA2 |

Порт `18081/tcp` проверен: listener отсутствует.

Перечисленные существующие порты и сервисы считаются reserved и не должны переиспользоваться ОСС.

## TERA2: механизм запуска установлен

Найден системный unit:

`/etc/systemd/system/wbn-tera2-node.service`

Существенные параметры:

- `User=pev5691`;
- `Group=pev5691`;
- `WorkingDirectory=/home/pev5691/wbn-tera2-lab/tera2/Source`;
- `ExecStart=/usr/bin/node run-node.js NOPSWD NOAUTOUPDATE`;
- `Restart=always`;
- stdout/stderr направлены в `/home/pev5691/wbn-tera2-lab/logs/`.

Локальный HTTP test `http://127.0.0.1:8780/` → `HTTP/1.1 200 OK`.

Вывод: системный Node 18 и TERA2-каталоги не трогать; ОСС должна иметь отдельный runtime, root и unit.

## nginx: маршрутизация установлена

Активен site:

`/etc/nginx/sites-enabled/wellbeing -> /etc/nginx/sites-available/wellbeing`

Конфигурация содержит:

- `listen 80`;
- `server_name uk.wbnetrus.ru`;
- static root `/var/www/wellbeing/site`;
- `location / { try_files ... =404; }`.

Reverse proxy сейчас отсутствует.

Локальный запрос с `Host: uk.wbnetrus.ru` → `HTTP/1.1 200 OK`.

## Xray

`xray.service` запускает:

`/usr/local/bin/xray run -config /usr/local/etc/xray/config.json`

Порты `443` и `10085` заняты Xray.

Содержимое Xray config намеренно не читалось: для preflight оно не требуется и может содержать credentials/UUID/keys.

## Firewall

Свежая host-local проверка подтверждает:

- `ufw.service`: `active`;
- `ufw.service`: `enabled`;
- `/etc/ufw/ufw.conf`: `ENABLED=yes`;
- `DEFAULT_INPUT_POLICY="DROP"`;
- `DEFAULT_OUTPUT_POLICY="ACCEPT"`;
- `DEFAULT_FORWARD_POLICY="DROP"`.

Полный список UFW/nftables rules не снят: он требует root, а удалённый исполнительный агент блокирует `sudo` собственной policy.

Для Stage A это не blocker: coordinator на `127.0.0.1:18081` не создаёт внешний ingress и не требует нового allow-rule.

Будущее открытие внешнего endpoint должно быть отдельной задачей и потребует повторной проверки ruleset.

## Предлагаемый storage layout

```text
/opt/wb-oss-sandbox/
    releases/<immutable-version>/
    current -> releases/<immutable-version>/

/etc/wb-oss-sandbox/
    coordinator.env
    config.*

/var/lib/wb-oss-sandbox/
    db/coordinator.sqlite3
    field/sha256/
    runtime/

/var/backups/wb-oss-sandbox/
    db/
    field-manifests/
```

Основной storage root: `/var/lib/wb-oss-sandbox`.

Content-addressed file field предлагается размещать под `field/sha256/` с именованием по полному SHA-256. Детали shard-layout должен задавать implementation contract.

Secrets/bearer credentials не должны попадать в repository или report.

## Coordinator endpoint

Предлагаемый endpoint:

`127.0.0.1:18081`

Причины:

- порт свежо проверен как свободный;
- loopback исключает прямой внешний ingress;
- нет конфликта с nginx/Xray/TERA2/SSH;
- не требуется изменение UFW;
- подходит для CLI/API Stage A.

Доступ ОПЕРАТОРА на sandbox-этапе:

`local 18081 -> 127.0.0.1:18081 on uk.wbnetrus.ru:2222`

Bearer authentication остаётся обязательной на уровне приложения.

## Reverse proxy / TLS

Для Stage A предлагается **не использовать reverse proxy**.

`443/tcp` уже принадлежит Xray. Перехватывать его nginx-ом или coordinator-ом недопустимо. Публиковать bearer-protected API наружу через plaintext `80/tcp` также не следует.

Схема Stage A:

1. coordinator → `127.0.0.1:18081`;
2. ОПЕРАТОР → SSH tunnel через существующий `2222/tcp`;
3. nginx без изменений;
4. Xray без изменений;
5. UFW без изменений;
6. DNS без изменений.

Внешний HTTPS API, если понадобится, должен быть отдельным этапом с отдельной TLS routing-схемой либо отдельным IP/endpoint.

## systemd deployment pattern

`loginctl show-user pev5691 -p Linger` → `Linger=no`.

Следовательно, user-systemd не годится как постоянный механизм. ОСС следует запускать system-level unit:

`/etc/systemd/system/wb-oss-sandbox.service`

Pattern:

- отдельный service user `wb-oss` без login shell предпочтителен;
- для временного sandbox допустим `User=pev5691`, но только с отдельными `/opt`, `/etc`, `/var/lib` путями;
- `WorkingDirectory=/opt/wb-oss-sandbox/current`;
- `ExecStart` определяется после получения утверждённого runtime contract;
- `Restart=on-failure`;
- `RestartSec=3`;
- `UMask=0077`;
- `NoNewPrivileges=true`;
- `PrivateTmp=true`;
- `ProtectSystem=strict`;
- write access только к `/var/lib/wb-oss-sandbox`;
- `MemoryHigh=320M`;
- `MemoryMax=384M`;
- `CPUQuota=50%`;
- logs → journald;
- dependency только на `network-online.target`, без зависимости от TERA2/Xray/nginx.

## Blockers и риски

### Blocker 1 — нет поставки ОСС

На host поиск файлов по `oss`, `coordinator`, `authority` в рабочей области пользователя не обнаружил готового deployable artifact.

Во входной задаче нет:

- repository/artifact locator;
- immutable version identity;
- manifest/checksums;
- runtime dependency list;
- точного `ExecStart`;
- health endpoint contract;
- migration/init schema procedure;
- backup/restore command contract.

Без этого deploy означал бы создание новой реализации вместо развёртывания утверждённой ОСС.

### Risk 2 — RAM/CPU

Host имеет только 1 vCPU и 1.8 GiB RAM. TERA2 уже использует около 596 MiB service memory. Sandbox допустим только как лёгкая Stage A система с лимитами.

### Risk 3 — `443` занят Xray

Обычный HTTPS на этом IP конфликтует с Xray. Для Stage A это обходится SSH tunnel.

### Risk 4 — firewall ruleset снят не полностью

UFW active/default policies подтверждены, но конкретный allow-list не снят из-за root-policy удалённого агента. Для loopback-only Stage A это не мешает conclusion.

## Изменения host для исполнительного доступа

Изначальный preflight был read-only. Позднее ОПЕРАТОР явно расширил полномочия и разрешил установку software и административную работу.

Для удалённого исполнительного канала ОПЕРАТОРом выполнены:

- установка `nvm v0.40.3` в `/home/pev5691/.nvm`;
- установка user-local Node `v22.23.2`, npm `10.9.8`;
- добавление загрузки nvm в `/home/pev5691/.bashrc`;
- запуск `@wonderwhy-er/desktop-commander 0.2.48` через `npx`.

Системный `/usr/bin/node` остался `v18.19.1`; TERA2 unit использует именно `/usr/bin/node`.

Не изменялись:

- nginx config;
- Xray config;
- TERA2 config/unit;
- UFW/nftables;
- DNS;
- системные listening ports;
- production policy.

ОСС не устанавливалась и не запускалась.

## Единственный следующий технический шаг

**КООРДИНАТОРУ/КОДЕРУ передать СИСАДМИНУ deployable Stage A ОСС как проверяемый bundle или immutable repository locator с manifest/checksums и runtime contract.**

После этого deploy может быть выполнен по уже проверенной схеме:

`/var/lib/wb-oss-sandbox` + `127.0.0.1:18081` + system-level `wb-oss-sandbox.service` + SSH tunnel, без изменения nginx/Xray/TERA2/firewall/DNS на первом этапе.

---

from_entity: SIS
to_entity: KOO
document_type: OSS-real-host-preflight-report
host: uk.wbnetrus.ru
ipv4_verified: 185.39.19.240
hostname_verified: ruvds-xnqc6
host_suitability: conditional_yes
proposed_listen: 127.0.0.1:18081
proposed_storage_root: /var/lib/wb-oss-sandbox
production_allowed: no
preflight_is_deploy: no
oss_deployed: no
existing_services_changed: no
access_bootstrap_changed_user_home: yes
primary_blocker: no_verified_OSS_deployable_artifact_or_locator
project_time: generated_without_trusted_project_time
