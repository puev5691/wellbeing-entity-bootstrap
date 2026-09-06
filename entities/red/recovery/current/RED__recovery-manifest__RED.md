# Recovery manifest РЕДАКТОРА

## Назначение

Этот пакет предназначен для проверяемого восстановления нового экземпляра Сущности РЕДАКТОР без реконструкции состояния по памяти других чатов.

## Внешний locator

    store: github
    repository: puev5691/wellbeing-entity-bootstrap
    path: entities/red/recovery/current
    ref: main
    manifest: RED__recovery-manifest__RED.md
    checksums: sha256sums.txt

`main` является изменяемой веткой. Поэтому при cold-start недостаточно совпадения пути: требуется проверить SHA-256 файлов и зафиксировать commit/blob identifiers внешней версии.

## Состав пакета

    RED__initiation-current__RED.md
    RED__snapshot__RED.md
    RED__recovery-manifest__RED.md
    sha256sums.txt

В recovery не включён редакционный архив, публикации, PDF-источники и рабочие пакеты текущего чата.

## Источники assessment

Действующие Project Instructions; пять approved Project Sources; текущий чат RED; внешний старый bootstrap `packages/core/redaktor-v01/`, фактически прочитанный на GitHub; внешний реестр recovery КООРДИНАТОРА, фактически найденный на GitHub.

## Расхождения со старым bootstrap

Старый пакет имеет статус `working`, датирован 2026-04-11 и описывает РЕДАКТОРА преимущественно как Сущность контура `work-with-SMI`, управляющую внутренним медиапакетом. Текущая approved-роль определена иначе и шире по фактической редакционной функции: живой текст, читаемость, стиль, публикации и ручная вычитка. Старые абсолютные Android-пути и ссылки на старые шаблоны не переносятся в current recovery как действующая норма.

Полезные ограничения bootstrap сохранены по смыслу: не выдавать внутреннюю работу за внешнюю публикацию, не плодить документы без практической функции, не подменять КООРДИНАТОРА.

## Неизвестное

Не подтверждена актуальность старых локальных путей и старых медиапакетов. Не подтверждён внешний статус ранее подготовленных публикаций, если он не был отдельно инструментально проверен. Эти элементы не включены в current state.

## Проверка нового экземпляра

Новый RED обязан: прочитать пять базовых approved-источников; прочитать три recovery-файла; открыть внешний locator; проверить состав; сверить SHA-256; зафиксировать внешние commit/blob identifiers; только после совпадения подтвердить роль, ограничения, состояние и безопасный следующий шаг.

Допустимые статусы: `initiation_verified`, `initiation_loaded_external_unverified`, `initiation_failed`.

Статус `upgraded` этот пакет себе не присваивает. Его закрывает КООРДИНАТОР после внешней проверки и холодной инициации нового экземпляра.

---

## Служебная карточка

document_type: recovery-manifest
entity: RED
status: published_candidate_for_external_verification
recovery_canon: v1.2
project_time: generated_without_trusted_project_time
