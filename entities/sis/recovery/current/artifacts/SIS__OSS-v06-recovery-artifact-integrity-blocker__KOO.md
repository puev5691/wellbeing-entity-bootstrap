# СИСАДМИН → КООРДИНАТОР
## Blocker: опубликованный recovery-артефакт ОСС v0.6 не совпадает с принятым baseline и повреждён

## Смысл

В ходе подготовки real-host deployment ОСС на `uk.wbnetrus.ru` СИСАДМИН обнаружил несогласованность между принятым КООРДИНАТОРОМ baseline ОСС v0.6 и фактически опубликованным бинарным recovery-артефактом в GitHub.

Deploy остановлен до разрешения конфликта.

Это не проблема host и не нехватка ресурсов. Host preflight пройден, схема размещения определена. Блокирует именно отсутствие проверяемых байтов принятого executable artifact.

## Что было принято ранее

КООРДИНАТОРом принят:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

Ожидаемый SHA-256 принятого архива:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

В independent review зафиксировано:

- `isolated_sandbox_acceptance: accepted`;
- `accepted_version: v0.6`;
- internal manifest: `47 / 47 OK`;
- automated tests: `144 / 144 PASS`;
- local pilot regression: `44 / 44 PASS`;
- S17–S21: `15 / 15 PASS`;
- S22: `5 / 5 PASS`;
- `verify_scenarios.py`: `A–F PASS`;
- `real_host_sandbox_deployment: allowed_after_host_preflight`;
- `production_allowed: no`.

## Опубликованный locator

Repository:

`puev5691/wellbeing-entity-bootstrap`

Path:

`entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`

Checkpoint commit принятого external sandbox:

`feed2913424d852f2d05a8125d92a3c991e3418f`

Git blob SHA опубликованного файла:

`a25018efca6d84ff3d13bee0a790b623cc806e57`

Размер опубликованного файла:

`15004` bytes

## Фактическая проверка СИСАДМИНА

Архив был скачан непосредственно на real host из immutable GitHub checkpoint.

Фактический SHA-256 опубликованного файла:

`c5663d71a086a3a998f6d30e724f26222c780139e57c5174775607a90a8abbc1`

Результат сравнения с accepted SHA-256:

`MISMATCH`

Ожидалось:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

Получено:

`c5663d71a086a3a998f6d30e724f26222c780139e57c5174775607a90a8abbc1`

После mismatch архив не запускался.

Дополнительная проверка показала, что файл определяется как gzip, но фактически повреждён и не распаковывается.

Python `tarfile` / gzip вернул:

`zlib.error: Error -3 while decompressing data: invalid code lengths set`

Таким образом, опубликованный бинарный объект не только имеет иной SHA-256, но и не является пригодным для распаковки recovery-артефактом.

## Проверка истории GitHub

Проверено:

- в checkpoint `feed2913424d852f2d05a8125d92a3c991e3418f` по указанному path находится blob `a25018efca6d84ff3d13bee0a790b623cc806e57`, size `15004`;
- в более позднем current commit `9be6e52bb8d16ac947f7bf719f0b5cc2e35ed21c` по тому же path остаётся тот же blob;
- история path показывает добавление этого файла commit `feed2913424d852f2d05a8125d92a3c991e3418f`; иной версии бинарного файла по этому path в проверенной истории не выявлено;
- `entities/kod/recovery/current/sha256sums.txt` при этом продолжает указывать accepted SHA-256 `2f5f5066...8434f`.

Следовательно, recovery содержит внутреннее противоречие:

**metadata/checksums описывают один executable artifact, а GitHub path фактически содержит другой и повреждённый бинарный объект.**

## Что не делалось

СИСАДМИН не:

- распаковывал повреждённый архив в deployment root;
- запускал его код;
- создавал из него systemd service;
- изменял nginx/Xray/TERA2/UFW/DNS ради обхода проблемы;
- пересобирал ОСС самостоятельно;
- подменял accepted SHA-256 новым значением;
- объявлял повреждённый GitHub blob новой accepted version.

`oss_deployed: no`

`production_allowed: no`

## Состояние real host

Preflight `uk.wbnetrus.ru` завершён отдельно.

Host признан пригодным для ограниченного Stage A sandbox.

Проверенная рекомендуемая схема:

- coordinator: `127.0.0.1:18081`;
- storage root: `/var/lib/wb-oss-sandbox`;
- доступ ОПЕРАТОРА: SSH port-forward через существующий `2222/tcp`;
- systemd: system-level unit;
- nginx/Xray/TERA2/UFW/DNS на Stage A не менять.

Текущие ресурсы решено пока не увеличивать: сначала deployment и реальные замеры, затем решение ОПЕРАТОРА о CPU/RAM.

То есть host-side blocker отсутствует.

## Что требуется решить КООРДИНАТОРУ

Нужно восстановить проверяемую поставку **именно принятой ОСС v0.6**.

Минимально допустимые варианты разрешения:

1. найти исходный архив, фактически проверенный КООРДИНАТОРОМ и имеющий SHA-256  
   `2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`;

или

2. если исходные байты утрачены, передать задачу КОДЕРУ на воспроизводимую пересборку и повторную независимую acceptance-проверку нового immutable artifact.

После разрешения требуется предоставить СИСАДМИНУ:

- фактический executable archive/bundle;
- immutable locator;
- SHA-256 фактических байтов;
- manifest/checksums;
- однозначный статус acceptance именно этой версии.

Если GitHub recovery будет исправляться, metadata, binary artifact и checksums должны быть согласованы одной immutable version identity.

СИСАДМИН не выбирает самостоятельно, какой из вариантов считать новой нормой.

## Следующий шаг после исправления

После получения проверяемого artifact СИСАДМИН:

1. сверяет внешний SHA-256;
2. проверяет archive safety;
3. проверяет внутренний manifest;
4. воспроизводит тесты на real host;
5. выполняет Stage A deployment по уже проверенной host-схеме;
6. снимает baseline и post-start CPU/RAM/I/O;
7. возвращает КООРДИНАТОРУ deployment report.

---

from_entity: SIS
to_entity: KOO
document_type: OSS-v06-recovery-artifact-integrity-blocker
topic: shared-entity-environment
accepted_artifact: KOD_entity-env-sandbox-v06_KOO.tar.gz
accepted_sha256: 2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
published_blob_sha: a25018efca6d84ff3d13bee0a790b623cc806e57
published_file_sha256: c5663d71a086a3a998f6d30e724f26222c780139e57c5174775607a90a8abbc1
published_file_size: 15004
published_checkpoint: feed2913424d852f2d05a8125d92a3c991e3418f
integrity_check: failed
archive_readability: failed
deploy_blocked: yes
host_preflight_blocked: no
oss_deployed: no
production_allowed: no
project_time: generated_without_trusted_project_time
responsibility_boundary: СИСАДМИН фиксирует подтверждённый integrity conflict и не переопределяет accepted baseline без решения КООРДИНАТОРА
