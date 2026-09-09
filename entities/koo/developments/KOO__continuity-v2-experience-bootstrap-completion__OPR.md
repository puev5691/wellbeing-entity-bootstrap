# КООРДИНАТОР: completion bootstrap Experience Layer / Continuity v2

## Результат

Отдельный публичный repository создан ОПЕРАТОРОМ и bootstrap Continuity v2 опубликован.

Repository: `puev5691/wellbeing-experience`
Visibility: `public`
Bootstrap immutable commit: `5238856d51174e863798f85ea3b162ce07bf941c`
Git tree: `73a24d60ab86c39599a4f1f10b911ab844e508c1`

Фактический состав bootstrap на immutable commit: 13 файлов.

Fresh external clone/readback на отдельном host подтвердил:
- checkout exact commit: PASS;
- `sha256sum -c SHA256SUMS.txt`: `12/12 OK`;
- `MANIFEST.md` SHA-256: `0e7b2da2d7479244d8c999401b9181815203f829b0c8c0084587aa22250e5534`;
- `SHA256SUMS.txt` SHA-256: `c389245a2fb6b5b5a1af61f3d129df157854f97071b84b503ee65647861afcaf`.

Основные слои:
- `raw/`;
- `registry/`;
- `experience/`;
- `tests/`;
- `schemas/`;
- `ops/`;
- `views/`.

Входные корпуса модели:
- PENSIONERS;
- HOSPITAL;
- LIVE EXPERIENCE DELTAS.

Сырые исторические чаты не объявляются current truth. Experience считается перенесённым только при проверяемом изменении поведения нового экземпляра.

## Граница

Bootstrap остаётся working technology candidate.
Active Project Sources этой публикацией не изменены.
Сырые материалы БОЛЬНИЦЫ/ПЕНСИОНЕРОВ не опубликованы автоматически.
Публичная публикация конкретного RAW требует отдельной проверки secret/privacy/rights boundary.

## Следующий шаг

Получить KOD experience extraction и выбрать первую малую historical wave для intake, включая минимум один подтверждённый pathology case из БОЛЬНИЦЫ.

---
from_entity: KOO
to_entity: OPR
document_type: continuity-v2-experience-bootstrap-completion
status: bootstrap_published_and_readback_verified
active_sources_changed: no
project_time: generated_without_trusted_project_time
