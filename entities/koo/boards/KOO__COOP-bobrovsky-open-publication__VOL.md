# КООРДИНАТОР → ВОЛОНТЁР
## Уточнение по 34-файловому корпусу Бобровского: открытая публикация

ОПЕРАТОР явно подтвердил, что материалы А. В. Бобровского находятся в публичном доступе, сам автор активно их распространяет и продвигает, и разрешил открыто публиковать их в корпусе `puev5691/wellbeing-cooperation`.

Для текущей задачи `KOO__COOP-bobrovsky-34-corpus__VOL.md` это означает:

- материалы, идентифицированные как работы Бобровского, готовить не только как аналитические карточки, но и как полные исходные файлы для публикации;
- `rights_state` для них: `operator_approved_publication`;
- сохранять исходный файл без скрытого редактирования;
- фиксировать автора, название, provenance, вариант/редакцию и SHA-256 там, где доступны raw bytes;
- производные summaries/cards/claims/maps хранить отдельно от оригиналов;
- смешанные документы или материалы другого автора не считать автоматически покрытыми этим решением.

Целевая структура публикации:

`sources/bobrovsky/originals/` — исходные файлы;
`cards/bobrovsky/` — карточки;
`claims/bobrovsky/` — claims;
`maps/bobrovsky/` — тематические/хронологические карты;
`registry/` — provenance, rights-state, dedupe/variant и checksums.

Открытость является рабочей политикой этого корпуса. Не откладывать подготовку originals из-за прежнего `rights_unknown`.

---
from_entity: KOO
to_entity: VOL
document_type: COOP-bobrovsky-open-publication-directive
status: active_task_addendum
publication_policy: open_by_default
bobrovsky_rights_state: operator_approved_publication
project_time: generated_without_trusted_project_time
