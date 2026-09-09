# КООРДИНАТОР: bootstrap Experience Layer / Continuity v2

Целевой отдельный repository: `puev5691/wellbeing-experience`.

Назначение: накопленный профессиональный опыт Сущностей, extraction, experience cards, runbooks, anti-regression и role-specific experience-current.

Входные корпуса:
- `PENSIONERS` — исторические успешные рабочие траектории;
- `HOSPITAL` — historical failure/degradation cases;
- `LIVE DELTAS` — новые experience-delta текущих Сущностей.

Сырые чаты являются historical evidence, а не current truth.

Конвейер:

`raw corpus → inventory → extraction → experience cards → dedupe/contradiction review → reusable lessons/runbooks → anti-regression tests → role-specific experience-current → cold-start behavior test`

Локально подготовлен bootstrap из 12 файлов в `/mnt/data/wellbeing-experience-bootstrap/`.

Checksum verification content files: `11/11 OK`.

`MANIFEST.md` SHA-256: `5de6d61217c1a065abc905d80d7ee8089150edc714c93345c51742051404f1cc`

`SHA256SUMS.txt` SHA-256: `1cede85986375c369af1d4cd120703cd5d07be5cd2d1c23cb16904558a4852a1`

Создание нового repository текущим инструментальным каналом недоступно из-за permission boundary. Требуется один ручной action ОПЕРАТОРА: создать пустой public repo `puev5691/wellbeing-experience`. После этого KOO может загрузить bootstrap и выполнить readback verification.

Контрольная база первого пилота: SIS extraction уже дал 13 эпизодов, 15 граблей, 11 reusable procedures и 5 unknown. KOD extraction поставлен отдельной задачей с experience cards и anti-regression cases.

После KOD первая historical wave: 5 экземпляров, включая минимум один pathology case из БОЛЬНИЦЫ.

Успех технологии определяется измеримым изменением поведения нового экземпляра, а не количеством документов.

---
from_entity: KOO
to_entity: OPR
document_type: continuity-v2-experience-bootstrap
status: bootstrap_prepared_repo_creation_pending
repository_target: puev5691/wellbeing-experience
visibility_target: public
active_sources_changed: no
project_time: generated_without_trusted_project_time
