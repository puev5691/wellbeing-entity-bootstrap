# СИСАДМИН: self-snapshot перед заменой текущего экземпляра

## Смысл

Этот self-snapshot создан текущим экземпляром СИСАДМИНА как authoritative current-writer только для собственного SIS current-state.

Trigger: прямое решение ОПЕРАТОРА остановить затянувшийся текущий экземпляр, зафиксировать состояние и инициировать новый чат.

Snapshot не утверждает состояние других Сущностей и не изменяет recovery-state проекта от имени АРХИВАРИУСА.

## Active Project Sources

Текущий active reference set подтверждён через действующий ARH recovery/current-state:

| Источник | SHA-256 |
|---|---|
| `project-instructions-core-v2_1-approved.md` | `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26` |
| `entity-roles-short-v2_2-approved.md` | `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d` |
| `file-work-canon-universal-v2_3-approved.md` | `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5` |
| `entity-state-preservation-and-recovery-canon-v1_4-approved.md` | `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda` |
| `source-loading-policy-v2-approved.md` | `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061` |

Новый экземпляр обязан самостоятельно прочитать доступные active Project Sources и не считать таблицу заменой их содержимого.

## Роль и граница

СИСАДМИН: серверы, сеть, шлюзы, туннели, firewall, deploy, health-check, systemd, мониторинг и проверяемые отчёты исполнения.

СИСАДМИН не меняет approved Project Sources, чужой self-state, canonical recovery registry или production policy по одной технической возможности.

## Подтверждённый host

Host для sandbox ОСС:

- DNS: `uk.wbnetrus.ru`;
- IPv4: `185.39.19.240`;
- hostname: `ruvds-xnqc6`;
- SSH port: `2222`;
- SSH user: `pev5691`;
- SSH ED25519 fingerprint: `SHA256:+QiM/uh5SBrkm4KpKFR4QCnq5Tcak256OMmg8CdHf2Y`;
- OS: Ubuntu `24.04.4 LTS`;
- kernel: `6.17.0-1022-azure`;
- CPU: 1 vCPU;
- RAM: 1.8 GiB total, около 855 MiB available во время preflight;
- swap: 1 GiB, unused при замере;
- root filesystem: ext4 40 GiB, около 26 GiB free при замере.

Ресурсы ОПЕРАТОР пока решил не увеличивать: сначала запуск и реальные измерения, затем решение по CPU/RAM.

## Существующие сервисы

Подтверждено свежим host-local preflight:

- nginx: `80/tcp`, active;
- Xray: `443/tcp`, `10085/tcp`, active;
- SSH: `2222/tcp`;
- TERA2: `8780/tcp`, `8781/tcp`, `30000/tcp`;
- TERA2 unit: `/etc/systemd/system/wbn-tera2-node.service`;
- TERA2 `ExecStart=/usr/bin/node run-node.js NOPSWD NOAUTOUPDATE`;
- TERA2 использует системный `/usr/bin/node` v18.19.1;
- UFW active/enabled; default INPUT DROP, OUTPUT ACCEPT, FORWARD DROP;
- nginx site `wellbeing` обслуживает static `uk.wbnetrus.ru` на port 80;
- port `18081` был свободен.

Рекомендуемая будущая Stage A схема остаётся:
`/var/lib/wb-oss-sandbox` + `127.0.0.1:18081` + system-level service + SSH tunnel, без изменения nginx/Xray/TERA2/UFW/DNS на первом этапе.

## Remote Desktop Commander

Для удалённого terminal access ОПЕРАТОР установил user-local:

- nvm `v0.40.3`;
- Node `v22.23.2`;
- npm `10.9.8`;
- Remote Desktop Commander `0.2.48`.

Системный Node 18 для TERA2 не заменялся.

Device:
`dd09a197-f716-4dd6-80bb-7f8e5d8260ff`, name `ruvds-xnqc6`.

На момент этого snapshot device status: `offline`; auth token наблюдался как valid.

Для повторного запуска агента на host:

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm use 22
    npx @wonderwhy-er/desktop-commander@latest remote

Секреты в recovery-пакет не включены.

## Текущая профильная задача

Активная задача КООРДИНАТОРА:
`KOO__OSS-v06-exact-binary-transport__SIS.md`.

Назначение: выполнить только техническую доставку exact accepted bytes ОСС v0.6 в отдельный Git repair ref, не меняя `main`, recovery registry, manifest/checksum map и не выполняя host deployment.

Repository:
`puev5691/wellbeing-entity-bootstrap`

Canonical target path на repair ref:
`entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`

Accepted exact binary:

- canonical name: `KOD_entity-env-sandbox-v06_KOO.tar.gz`;
- size: `109510` bytes;
- SHA-256: `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;
- expected Git blob SHA-1: `93f1208d60b058867a4fde4df61689785d216e17`.

Независимая повторная проверка текущим SIS перед snapshot:

- size: PASS;
- SHA-256: PASS;
- `git hash-object`: PASS;
- tar/gzip readability: PASS;
- archive path safety: PASS;
- symlink/hardlink: none;
- internal `SHA256SUMS.txt`: `47 / 47 OK`.

Exact binary включён в этот recovery package под canonical filename.

## Git transport state

GitHub connector подтвердил права repository: `push=true`, `admin=true`.

Создан отдельный repair branch:

`repair/oss-v06-exact-binary-20260908`

На момент snapshot branch существует и указывает на commit:

`ac4715118bf0ba5ed964c359117820b570d19eb1`

Это тот же base commit, от которого ветка была создана.

**Exact binary blob в repair branch ещё НЕ записан.**
**Repair commit ещё НЕ создан.**
**Post-push readback ещё НЕ выполнен.**
**main не изменён.**

Именно здесь остановилось исполнение предыдущего экземпляра.

## Почему задача выглядела зависшей

Нет подтверждения исчерпания токенов или поломки чата. Инструменты продолжали отвечать.

Практический дефект был в исполнении: после проверки exact binary и создания repair branch последовательность `create binary blob → tree → commit → branch update → readback` не была доведена до конца. На фоне длинного контекста это стало достаточной причиной заменить экземпляр, а не продолжать накапливать неопределённость.

## Закрыто / подтверждено

- real-host preflight завершён;
- дефект повреждённого recovery artifact обнаружен и передан КООРДИНАТОРУ;
- КООРДИНАТОР передал exact accepted binary;
- exact bytes перепроверены;
- GitHub write capability подтверждена;
- repair branch создан;
- host deployment не выполнялся.

## Open / pending

1. Завершить exact-binary transport на существующий repair branch.
2. Выполнить post-push readback и повторно доказать SHA-256/Git blob.
3. Подготовить transport-result для КООРДИНАТОРА/АРХИВАРИУСА.
4. Не merge-ить repair branch.
5. После независимого recovery repair АРХИВАРИУСОМ может быть снят blocker real-host deploy.
6. Только после этого возвращаться к sandbox deployment и измерению ресурсов.

## Parked / not required now

- увеличение CPU/RAM host: отложено до фактических измерений;
- внешний HTTPS/reverse proxy: не нужен для Stage A;
- production deployment: запрещён;
- rebuild by KOD: не требуется по текущему handoff.

## Writer-state

`SIS_current_writer: this_snapshot_author`

`ARH_preservation_process_owner: yes`

`SIS_external_recovery_publication_claimed: no`

`canonical_recovery_changed_by_this_snapshot: no`

## Один безопасный следующий шаг

Новый SIS после проверки этого package должен:

1. подтвердить, что repair branch всё ещё указывает на `ac4715118bf0ba5ed964c359117820b570d19eb1` либо зафиксировать фактическое изменение;
2. заново проверить exact binary из `artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`;
3. через авторизованный GitHub binary-blob transport создать blob и потребовать ровно `93f1208d60b058867a4fde4df61689785d216e17`;
4. только при совпадении создать tree/commit на repair branch;
5. выполнить immutable post-push readback;
6. вернуть transport-result КООРДИНАТОРУ/АРХИВАРИУСУ.

Не выполнять deploy и не менять `main`.

---
document_type: SIS-self-snapshot
snapshot_trigger: operator_requested_instance_replacement
snapshot_authority: SIS_current_writer_only
production_allowed: no
project_time: generated_without_trusted_project_time
