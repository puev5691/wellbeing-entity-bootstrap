# Журнал завершения цикла выноса service-layer из cli.py

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать успешный вынос локального service-layer из cli.py в отдельный модуль

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: confirmed_by_local_execution
handoff_to: not_applicable
related_docs:
- 0688-1104-2026-cycle-open-service-layer-extraction.md
- 0698-1104-2026-technical-task-service-layer-extraction.md
- 0708-1104-2026-mvp-plan-service-layer-extraction.md
- 0718-1104-2026-task-package-service-layer-extraction.md
- 0658-1104-2026-local-service-entry-success-log.md
- 0678-1104-2026-json-contract-normalization-success-log.md

## 1. Что реализовано

В репозитории Архивариуса создан отдельный модуль:

`src/archivist/service_layer.py`

В него вынесена сборка payload для локального сервисного входа `service-query`.

## 2. Что изменилось в архитектуре

После выноса:

- `cli.py` больше не содержит основную логику построения service-query payload;
- `cli.py` используется как тонкая оболочка:
  - разбирает аргументы;
  - вызывает service-layer;
  - печатает JSON;
- service-layer стал самостоятельным локальным модулем.

## 3. Что подтверждено проверкой

Практически подтверждено, что запрос:

`service-query entity-summary --callsign Редактор`

после выноса service-layer продолжает возвращать корректный JSON-ответ.

Это означает, что:
- JSON-контракт не сломан;
- отделение service-layer от argparse-слоя выполнено успешно.

## 4. Практический смысл результата

Архивариус теперь имеет не только локальный JSON-вход, но и более чистую внутреннюю архитектуру.

Это создаёт основу для следующих шагов:
- выделения локального сервисного слоя в более самостоятельную форму;
- перехода к path abstraction layer;
- последующего движения к внешнему или полу-внешнему API.

## 5. Итог

Цикл выноса service-layer из cli.py считается завершённым с положительным результатом.

Локальный сервисный вход:
- сохранён;
- не сломан;
- архитектурно отделён от CLI-оболочки.
