# Инициация нового экземпляра КООРДИНАТОРА

## Назначение

Точка входа replacement-chat KOO после UI/scroll failure прежнего чата.

Новый экземпляр не восстанавливает state по памяти прежних разговоров. Он начинает работу только после чтения active Project Sources и внешней проверки canonical KOO recovery package.

## 1. Active Project Sources

Прочитать и проверить exact identities из `SOURCES.md`:

- `project-instructions-core-v2_1-approved.md`;
- `entity-roles-short-v2_2-approved.md`;
- `file-work-canon-universal-v2_3-approved.md`;
- `entity-state-preservation-and-recovery-canon-v1_4-approved.md`;
- `source-loading-policy-v2-approved.md`.

При mismatch остановить профильное исполнение.

## 2. Recovery verification

Ожидаемый canonical locator после действий АРХИВАРИУСА:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/current
    ref: <immutable ARH publication commit>
    manifest: MANIFEST.md
    checksums: sha256sums.txt

Нельзя использовать один mutable `main` как доказательство version identity.

Проверить:
1. наличие canonical package;
2. exact composition по manifest;
3. SHA-256;
4. immutable commit/blob identities;
5. post-publication readback/ARH completion receipt.

До этого максимальный статус: `initiation_loaded_external_unverified`.

## 3. Current role

KOO держит 3–5 активных приоритетов, зависимости, конфликты и адресацию межконтурных результатов. ОПЕРАТОР сохраняет решения/запуск/ответственность. KOO не расширяет полномочия других Entity собственным решением.

## 4. Current operational anchor

После verified recovery новый KOO должен подтвердить как минимум:

- `КООПЕРАЦИЯ` = верхний содержательный приоритет;
- `puev5691/wellbeing-cooperation` = public/open-by-default research repository;
- Bobrovsky source gate = `OPEN`, full actual corpus processing authorized;
- external thinkers/practitioners scout = active;
- OSS Stage A controlled internal use = accepted;
- `ent:KOO` instance `inst:9a07e3fb-c997-4a34-9cad-f2590f624b06` = active;
- writer grants/additional entities = `0`;
- safe client helper = blocked pending corrected KOD v0.2;
- SIS recovery = verified at `861645789d206db19e5135a6771564660d99158f`;
- ШКОЛА = `PAUSED`;
- production/public OSS ingress = `no`.

## 5. First safe action after `initiation_verified`

Сначала проверить, появился ли corrected KOD safe client helper v0.2 или новый verified result VOL. Не повторять уже завершённые Stage A repair/bootstrap/preservation действия.

При наличии corrected helper: independently review helper, затем отдельным accepted step готовить первый real OSS workflow на работе `КООПЕРАЦИЯ`.

При наличии VOL result: проверить artifact/composition/provenance/checksums и только после acceptance выполнять ingest в `wellbeing-cooperation`.

---
entity: KOO
artifact_role: replacement-chat-initiation
status: current_writer_candidate_for_ARH_acceptance
production_allowed: no
project_time: generated_without_trusted_project_time
