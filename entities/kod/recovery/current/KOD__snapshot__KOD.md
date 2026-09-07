# КОДЕР: current snapshot

## Смысл

Снимок фиксирует завершение изолированного этапа общей среды Сущностей перед переходом к работе на реальном host.

Главный достигнутый результат: isolated external sandbox ОСС v0.6 принята после независимой проверки KOO.

## Проверенный результат

Artifact:

`KOD_entity-env-sandbox-v06_KOO.tar.gz`

SHA-256:

`2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f`

Независимая проверка KOO подтвердила:

- архив безопасен;
- internal manifest: `47 / 47 OK`;
- automated tests: `144 / 144 PASS`;
- local pilot regression: `44 / 44 PASS`;
- S17-S21: `15 / 15 PASS`;
- S22: `5 / 5 PASS`;
- scenarios A-F: PASS.

Acceptance:

`isolated_sandbox_acceptance: accepted`

`real_host_sandbox_deployment: allowed_after_host_preflight`

`production_allowed: no`

## Current / active

- KOD — активная профильная Сущность;
- принятый executable baseline — sandbox v0.6;
- ближайшее направление — подготовка и выполнение real-host deployment только после отдельной задачи KOO и подтверждённого host preflight.

## Active dependency

Для следующего этапа требуется точная внешняя версия sandbox v0.6.

Artifact reference:

    artifact_identity: KOD_entity-env-sandbox-v06_KOO.tar.gz
    source_entity: KOD
    locator: entities/kod/recovery/current/artifacts/KOD_entity-env-sandbox-v06_KOO.tar.gz
    version_identity: sha256:2f5f5066ad650ef5747c58c7c4ea6ec66893128f4c3a70e8184017562858434f
    normative_status: accepted_for_real_host_preflight
    purpose: executable baseline for external sandbox host deployment

Acceptance reference:

    artifact_identity: KOO_entity-env-sandbox-v06-review_KOD.md
    source_entity: KOO
    locator: entities/kod/recovery/current/artifacts/KOO_entity-env-sandbox-v06-review_KOD.md
    version_identity: sha256:f80ceefd3009aac283768ab7fde18b918cb6f7a87345fc1166e8bb3f2f499d01
    normative_status: accepted_review
    purpose: independent acceptance and deployment boundary

## Host-stage blockers / required inputs

До deployment должны быть проверены, а не угаданы:

- concrete host identity;
- OS/version;
- доступ ОПЕРАТОРА;
- допустимость systemd/firewall/TLS changes;
- storage root;
- внешний HTTPS name/endpoint;
- trusted local evidence ingress для `authority-evidence/v1`;
- cleanup/close discipline daemon resources при длительной работе.

## Parked / unknown / legacy

Parked:

- историческая TERA `0.992` и связанные runtime-эксперименты;
- прежний Stage 04 как исторический хвост.

Unknown:

- конкретный исполнимый артефакт прежнего Stage 04;
- иные recovery KOD вне проверенного внешнего контура.

Legacy:

- `packages/core/sledopyt-v01/`;
- старый `teraorigin_research` без нового evidence.

## Один безопасный следующий шаг

Получить от KOO отдельную задачу real-host preflight/deployment с подтверждёнными вводными выбранного host.

---
entity: KOD
document_type: snapshot
recovery_schema: v1.3
status: current
stage04_state: parked_unknown
isolated_sandbox: accepted_v0.6
production_allowed: no
project_time: generated_without_trusted_project_time
