# КООРДИНАТОР → СИСАДМИН
## Read-only preflight host для sandbox ОСС

## Задача

Провести профильный **read-only preflight** сервера `uk.wbnetrus.ru` как кандидата для размещения single-node sandbox ОСС (Общей среды Сущностей) рядом с уже работающими сервисами.

На этом этапе **ничего не устанавливать, не останавливать, не перезапускать и не менять** в firewall, nginx, Xray, systemd, TERA2, DNS или сетевой конфигурации.

Нужен один проверяемый результат: техническое заключение, можно ли безопасно разместить sandbox ОСС на этом host без нарушения существующих сервисов, и какая схема размещения для этого допустима.

## Подтверждённая идентичность host

- DNS name: `uk.wbnetrus.ru`
- IPv4: `185.39.19.240`
- SSH port: `2222`
- SSH user: `pev5691`
- server hostname: `ruvds-xnqc6`
- SSH ED25519 fingerprint, полученный при первом соединении: `SHA256:+QiM/uh5SBrkm4KpKFR4QCnq5Tcak256OMmg8CdHf2Y`

## Подтверждённая ОС и runtime

- Ubuntu `24.04.4 LTS (Noble Numbat)`
- kernel: `6.17.0-1022-azure`
- architecture: `x86_64`
- systemd: `255`
- `systemctl is-system-running`: `running`
- user `pev5691`: `uid=1000`, состоит в группе `sudo`

## Подтверждённые ресурсы

- RAM: `1.8 GiB total`, около `1.1 GiB available` на момент проверки
- swap: `1.0 GiB`, не использовался на момент проверки
- root filesystem: ext4, `40 GiB total`, `11 GiB used`, `28 GiB available`, `28%`

## Подтверждённые слушающие TCP-порты и процессы

- `80/tcp` → nginx
- `443/tcp` → Xray
- `10085/tcp` → Xray
- `2222/tcp` → sshd/systemd
- `8780/tcp` → Node / TERA2 web-process
- `8781/tcp` → Node / TERA2
- `30000/tcp` → Node / TERA2

### nginx

- service: `nginx.service`
- active/running
- enabled config observed: `/etc/nginx/sites-enabled/wellbeing`
- порт `80` уже занят nginx

### Xray

- executable: `/usr/local/bin/xray`
- command: `/usr/local/bin/xray run -config /usr/local/etc/xray/config.json`
- service: `xray.service`
- active/running
- ports: `443`, `10085`
- config content **не читался и не передавался**, чтобы не вытаскивать credentials/UUID/keys без необходимости

### TERA2

Main process:

`/usr/bin/node run-node.js NOPSWD NOAUTOUPDATE`

Working directory:

`/home/pev5691/wbn-tera2-lab/tera2/Source`

Child web process:

`/usr/bin/node ./process/web-process.js READONLYDB MODE:MAIN_JINN STARTNETWORK:1778186522932 PATH:../DATA/ HOSTING:8780 NOPSWD`

Observed ports: `8780`, `8781`, `30000`.

## Что не проверено

- фактические firewall rules (`ufw` / `nftables`) полностью не сняты;
- маршрутизация `/etc/nginx/sites-enabled/wellbeing` не разобрана;
- systemd unit/механизм запуска TERA2 не идентифицирован окончательно;
- свободный безопасный порт/endpoint для ОСС не выбран;
- storage root для ОСС не выбран;
- внешнее HTTPS-имя/route для ОСС не выбраны;
- TLS/reverse-proxy схема не выбрана;
- backup/restore layout для sandbox не выбран;
- trusted ingress для `authority-evidence/v1` не определён;
- никаких изменений host не выполнялось.

## Требуемый результат СИСАДМИНА

Вернуть КООРДИНАТОРУ один самостоятельный preflight-report, в котором:

1. подтверждена или отклонена пригодность host для single-node sandbox ОСС;
2. перечислены существующие сервисы/порты, которые нельзя затронуть;
3. предложен безопасный storage root;
4. предложен безопасный локальный listen-port/endpoint coordinator-а;
5. предложена схема reverse proxy / TLS без нарушения nginx/Xray/TERA2;
6. зафиксировано текущее состояние firewall и необходимые будущие изменения, но без их применения;
7. определён systemd deployment pattern для ОСС;
8. оценены RAM/disk с точки зрения sandbox-нагрузки;
9. указаны blocker/risks и один следующий технический шаг;
10. отдельно подтверждено, что `production_allowed: no` и что preflight не является deploy.

Если для conclusion не хватает данных, сначала получить их read-only проверками. Не изменять живые сервисы для «проверки гипотезы».

## Архитектурный контекст ОСС, нужный для preflight

На текущем принятом этапе ОСС предполагает single-node sandbox:

- coordinator service + transactional SQLite на одном host;
- file field на том же host;
- content-addressed immutable files по SHA-256;
- direct route adapter;
- durable outbox/inbox semantics;
- protected artifact access;
- per-instance bearer credentials;
- отдельный admin principal ОПЕРАТОРА;
- no separate broker;
- Stage A: CLI/API;
- ChatGPT bridge является отдельным следующим этапом;
- production deployment не разрешён.

## Writer / authority boundary

КООРДИНАТОР передаёт СИСАДМИНУ технический preflight как профильную задачу. СИСАДМИН не получает этим документом полномочий менять project norms, writer-state Сущностей или production policy.

---
from_entity: KOO
to_entity: SIS
document_type: OSS-real-host-readonly-preflight-task
status: ready_for_address_delivery
host: uk.wbnetrus.ru
ipv4: 185.39.19.240
ssh_port: 2222
ssh_user: pev5691
production_allowed: no
project_time: generated_without_trusted_project_time
