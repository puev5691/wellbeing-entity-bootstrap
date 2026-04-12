# Шаблон операторского конверта задачи для Сущностей

Дата: 2026-04-11
Статус: canonical
Контур: revision-of-the-project-structure
Назначение: дать оператору короткий шаблон постановки задачи, уменьшающий риск маршрутизационных и фазовых ошибок

artifact_type: template
entity_scope: revision-of-the-project-structure
phase: coordination
repo_target: not_applicable
evidence_level: not_applicable
handoff_to: not_applicable
related_docs:
- 0178-1104-2026-phase-confirmation-protocol.md

## Шаблон

Позывной Сущности:
<Координатор / Следопыт / Редактор / другое>

Текущая фаза:
<bootstrap / correction / audit / raw_evidence / research / coordination>

Тип операции:
<create / update / restore / inventory / audit / normalize>

Целевой файл:
<полный путь>

Основание:
<какие файлы, evidence или предыдущие документы являются основанием>

Жёсткие ограничения:
- один shell-скрипт
- один файл
- без побочных файлов
- без перехода к следующей фазе

Что считать успехом:
<какой именно вывод файловой системы оператор должен показать после исполнения>

## Примечание

Следующий шаг запрещён до тех пор, пока успех не подтверждён фактическим наличием артефакта на диске.
