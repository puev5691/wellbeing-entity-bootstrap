# Журнал завершения цикла нормализации path roots

Дата: 2026-04-11
Статус: working
Контур: revision-of-the-project-structure
Назначение: зафиксировать завершение нормализации path roots и разделения operator shell environment и канонической конфигурации Архивариуса

artifact_type: journal
entity_scope: revision-of-the-project-structure
phase: engineering
repo_target: /storage/emulated/0/Documents/repos/wellbeing-archivist
evidence_level: confirmed_by_local_execution
handoff_to: not_applicable
related_docs:
- 0738-1104-2026-cycle-open-path-abstraction-layer.md
- 0748-1104-2026-technical-task-path-abstraction-layer.md
- 0758-1104-2026-mvp-plan-path-abstraction-layer.md
- 0768-1104-2026-task-package-path-abstraction-layer.md
- 1008-1104-2026-path-roots-canonicalization-success-log.md

## 1. Что было проблемой

До нормализации Архивариус жил в ситуации скрытого конфликта корней:

- documents_root определялся одним способом
- project_root приезжал из `WB_PROJECT_ROOT`
- shell environment молча влиял на поведение инфраструктуры

Это создавало риск тихой непереносимости между устройствами и сеансами.

## 2. Что реализовано

В Архивариусе реализовано:

- различение источника каждого root;
- показ source для `documents_root`, `repos_root`, `project_root`;
- предупреждения при конфликте root hierarchy;
- переход к каноническому использованию `config.path_roots`.

Также operator shell environment очищен так, чтобы:
- `WORKROOT` оставался как удобство;
- `cdbl` и `tree` работали от `WORKROOT`;
- `WB_PROJECT_ROOT` больше не был скрытым источником истины для Архивариуса.

## 3. Что подтверждено проверкой

Практически подтверждено, что:

- `show-path-roots` показывает корни и их source;
- после канонизации config показывает:
  - documents_root from config
  - repos_root from config
  - project_root from config
- `resolve-logical-path project_root ...` работает корректно;
- `split-absolute-path` для рабочего пути возвращает `project_root`.

## 4. Практический смысл результата

Теперь Архивариус перестал зависеть от случайного shell-state как от скрытой инфраструктурной правды.

Это означает:
- лучшую переносимость;
- лучшую диагностируемость;
- честную трассировку происхождения путей;
- нормальное разделение между operator shell convenience и программной конфигурацией.

## 5. Итог

Цикл нормализации path roots считается завершённым с положительным результатом.

Канонический источник истины для корней путей теперь находится в `config.path_roots`, а shell-среда больше не подменяет его исподтишка.
