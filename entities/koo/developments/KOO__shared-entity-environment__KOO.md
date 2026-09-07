# Разработка: общая среда Сущностей

## Цель

Построить среду, в которой проектные Сущности безопасно и проверяемо взаимодействуют через внешнее coordination field и file field, а ОПЕРАТОР перестаёт быть ручным транспортом файлов между чатами.

## Нормативно-архитектурная база

Действующие approved Project Sources уже содержат необходимые принятые различения для этого этапа:

- Сущность ≠ экземпляр ≠ чат;
- authority ≠ capability;
- request ≠ instruction;
- publication ≠ delivery ≠ receipt ≠ acceptance;
- несколько проверенных экземпляров допускаются, authoritative current-state имеет одного current-writer;
- locator-based delivery допустима только с exact version, addressed dispatch, доступным locator, receipt и failure-mode;
- autonomy определяется authority, а не наличием инструмента.

## Завершённые технические этапы

### Technical model

Baseline technical model v0.4 принят для pilot-stage.

### Local pilot

Local pilot завершён на v0.7.

Acceptance:

`local_pilot: accepted`

### Single-node sandbox design

`KOD_entity-env-sandbox-design-v01_KOO.md` принят как конкретная основа реализации.

### Isolated external sandbox

Финальная принятая редакция:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

SHA-256:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

KOO independently verified:

- `47 / 47` internal checksums;
- `144 / 144` tests;
- A-F scenarios PASS;
- S22 semantic authority-evidence blocker закрыт.

Acceptance:

- `isolated_sandbox_acceptance: accepted`;
- `real_host_sandbox_deployment: allowed_after_host_preflight`;
- `production_allowed: no`.

## Проверяемый внешний KOD baseline

Repository:

`puev5691/wellbeing-entity-bootstrap`

Path:

`entities/kod/recovery/current`

Immutable commit:

`feed2913424d852f2d05a8125d92a3c991e3418f`

Artifact locator:

`entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz`

Git blob:

`a25018efca6d84ff3d13bee0a790b623cc806e57`

Artifact SHA-256:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

## Host-stage обязательные вводные

Перед real-host deployment должны быть подтверждены:

- выбранный host identity;
- OS/version;
- способ и уровень доступа ОПЕРАТОРА;
- возможность systemd changes;
- firewall boundary;
- TLS/reverse-proxy policy;
- storage root;
- внешний HTTPS name/endpoint;
- trusted local evidence ingress для `authority-evidence/v1`;
- cleanup discipline для долгоживущего daemon.

Ни один прежний сервер не назначается автоматически из памяти или legacy-контекста.

## Следующий этап

`real_host_preflight`

После подтверждения вводных KOO формирует отдельную implementation/deployment task для KOD. Реальный deployment и production не смешиваются: сначала sandbox на host, затем независимая проверка, и только потом отдельное решение о дальнейшем статусе.

## Что не делать сейчас

- не создавать новую isolated sandbox revision без нового доказанного blocker;
- не переходить на PostgreSQL/broker/distributed architecture без причины;
- не реализовывать ChatGPT bridge до стабилизации real-host sandbox;
- не считать GitHub окончательным coordination field;
- не назначать host по памяти.

---
entity: KOO
artifact_role: development_state
topic: shared-entity-environment
status: active_development
technical_layer: isolated_sandbox_accepted_v0.6
next_stage: real_host_preflight
production_allowed: no
project_time: generated_without_trusted_project_time
