# wellbeing-entity-bootstrap

Репозиторий bootstrap-материалов для воспроизводимой инициации Сущностей проекта Благополучие.

## Назначение

Этот репозиторий отделён от кода Архивариуса и предназначен для хранения:

- policy происхождения и авторства;
- canonical header-блоков;
- профилей Сущностей;
- шаблонов task envelope и handoff;
- initiation package материалов;
- bootstrap manifest-файлов.

## Базовый принцип

Код Архивариуса и bootstrap-пакеты Сущностей являются разными классами инфраструктуры.

- `wellbeing-archivist` отвечает за учёт, поиск, query-layer и service-layer
- `wellbeing-entity-bootstrap` отвечает за воспроизводимое рождение, handoff и масштабирование Сущностей

## Текущее ядро

На текущем этапе в репозитории подготовлены:

- policy происхождения и авторства;
- header v2 policy;
- шаблон envelope;
- шаблон handoff;
- профили:
  - Координатор
  - Редактор
  - Следопыт
  - Архивариус

## Структура

- `policies/`
- `headers/`
- `templates/`
- `profiles/`
- `packages/`
- `manifests/`
- `examples/`
