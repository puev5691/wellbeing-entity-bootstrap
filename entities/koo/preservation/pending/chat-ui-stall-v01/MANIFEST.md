# KOO replacement-chat recovery candidate manifest

## Назначение

Самостоятельный recovery candidate authoritative current-writer KOO перед заменой текущего чата из-за UI/scroll failure.

## Состав

1. `KOO__initiation-current__KOO.md`
2. `KOO__snapshot__KOO.md`
3. `SOURCES.md`
4. `KOO__preservation-handoff__ARH.md`
5. `MANIFEST.md`
6. `sha256sums.txt`

`sha256sums.txt` проверяет первые пять файлов, включая manifest.

## Candidate external staging

Candidate может быть опубликован в staging locator для адресной проверки ARH, но он не становится canonical KOO recovery до ARH acceptance/publication/readback.

Ожидаемый canonical locator после ARH:

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/koo/recovery/current
    ref: <immutable ARH publication commit>
    manifest: MANIFEST.md
    checksums: sha256sums.txt

## Previous current locator state

Нынешний `entities/koo/recovery/current` на `main` содержательно stale: snapshot/initiation описывают Stage A authority-defect и operational acceptance `BLOCKED`.

## Secret boundary

Secrets отсутствуют. OSS credential сохраняется только как metadata ID/locator/mode без token/content.

## Safe next step

ARH integrity review → canonical publication → immutable readback → completion receipt → new KOO chat external verification → `initiation_verified`.

---
entity: KOO
artifact_role: recovery_manifest_candidate
status: pending_ARH_acceptance
project_time: generated_without_trusted_project_time
