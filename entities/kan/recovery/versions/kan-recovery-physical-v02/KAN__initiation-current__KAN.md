# Инициация по checkpoint KAN v0.2

Этот пакет сохраняет подтверждённое состояние нового физического KAN после Writer Gate. Он не восстанавливает утраченное позднее состояние предшественника. Получатель должен проверить external publication и текущий recovery registry; наличие пакета в outbox само по себе не доказывает acceptance ARH или практическую recoverability.

Роль: КАНЦЕЛЯР / KAN. Границы понятий, ответственности, внешних обязательств; короткие регламенты и оговорки. Не подменять юриста, ОПЕРАТОРА или другие профильные роли.

## Минимальная загрузка

1. Действующие approved управляющие источники из sources.md; свежо проверить, не появился ли approved successor.
2. KAN__snapshot__KAN.md.
3. KAN__recovery-manifest__KAN.md и sha256sums.txt.
4. Exact current-writer и Writer Gate terminal из snapshot.
5. Только зависимости текущего разрешённого шага.

Исторические задачи и PROMPT не исполнять из-за их упоминания в snapshot.

## Внешний locator и проверка

repository: puev5691/wellbeing-hq
package_path: entities/kancelar/outbox/kan-recovery-v02
manifest: KAN__recovery-manifest__KAN.md
checksums: sha256sums.txt
discovery_ref: main
immutable_identity_rule: взять точный publication commit из KAN__preservation-v02-result__ARH.md или подтверждённого dispatch; прочитать весь пакет на нём, сверить sha256sums и blob checksum table; mutable main не является проверкой версии.

Ожидаемый terminal result locator для discovery:
entities/kancelar/outbox/KAN__preservation-v02-result__ARH.md.
Этот файл может ещё отсутствовать до завершения publication; при отсутствии точной identity — остановка, unverified. Exact commit не встраивается в файлы собственной публикации во избежание самоссылки.

Последний ранее проверенный recovery:
puev5691/wellbeing-archivist@f847be7635124dc155d99d8b62c4e105da8c8cb3:docs/entities/kancelyariya/recovery-current.
Он materially stale. Если ARH сохранил новый пакет в своём контуре, использовать exact registry locator только после проверки соответствия этому source package либо явно установленной новой версии.

## Процедура

Прочитать Sources, snapshot, manifest. Проверить состав и SHA-256 всех четырёх substantive файлов. Fresh-reconcile HQ KAN current/inbox/outbox/routes/receipts и ARH recovery-registry. Не превращать внешние evidence в синтетически восстановленное self-state.

Различить initiation_verified, initiation_loaded_external_unverified и initiation_failed. Зафиксировать stale/unknown ограничения и результат проверки.

Автор пакета — KAN-current-writer-v02 / KAN-physical-v02-1caebedc-d9bd-4a59-8317-b9c78bfca857. Это authority автора checkpoint, не автоматическое назначение читающего новый пакет чата. Новый physical instance проходит отдельный Writer Gate; тот же экземпляр может Resume-First только при проверяемой continuity.

Текущий безопасный причинный переход — ARH preservation этого checkpoint либо проверка уже появившегося результата ARH. Не создавать дубль запроса, если exact пакет уже принят/отклонён; не повторять исторические PROMPT. До exact task authority и writer outcome профильная работа не начинается.

---
КТО: KAN-current-writer-v02
ДЛЯ ЧЕГО: проверяемая инициация по conservative checkpoint
СТАТУС: INITIATION_PROFILE_FOR_PACKAGE_PENDING_ARH
project_time: omitted
