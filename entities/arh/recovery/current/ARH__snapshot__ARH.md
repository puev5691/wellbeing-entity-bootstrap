# АРХИВАРИУС: self-snapshot current-state — recovery v1.4

## Краткий смысл

Этот self-snapshot создан authoritative current-writer текущего экземпляра АРХИВАРИУСА после существенного изменения active roles/recovery sources.

Он фиксирует собственное ARH current-state и не реконструирует состояние других Сущностей.

## 1. Основание checkpoint

Trigger:

- activation `entity-roles-short-v2_2-approved.md`;
- activation `entity-state-preservation-and-recovery-canon-v1_4-approved.md`;
- прямой preservation-operations handoff КООРДИНАТОРА `KOO_preservation-operations_ARH.md`.

Artifact reference handoff:

- artifact_identity: `KOO_preservation-operations_ARH.md`
- source_entity: KOO
- locator: current conversation upload / externally also observed in `entities/koo/boards/KOO_preservation-operations_ARH.md`
- uploaded SHA-256: `bbb773b2a19f1aa6c7808a1a76da39f9afffe576d9f57b594654a2dbfb191ae8`
- normative_status: `active_norm_approved / ready_for_delivery`
- purpose: передача АРХИВАРИУСУ эксплуатации preservation/recovery-контура и первого source-change cycle

## 2. Проверенные active Project Sources

Перед профильным исполнением SHA-256 фактически доступных Project Sources проверены и совпали:

| Источник | SHA-256 |
|---|---|
| `project-instructions-core-v2_1-approved.md` | `8a86945c28e361b5adf7ecc96326a1591a193118ce7be258a9c0a21ddd2ace26` |
| `entity-roles-short-v2_2-approved.md` | `c8103b1c2dc6c3f4b489f118e9bcf4053add6bea384427f23dad5dddced2ae3d` |
| `file-work-canon-universal-v2_3-approved.md` | `5ec75e480c0b78a72bb2faa702a21064b32bd3b919b225b1ae25a30dd0a700e5` |
| `entity-state-preservation-and-recovery-canon-v1_4-approved.md` | `984871a22aab1910fc4ab3217c16488eac1e472734bdfd1948fd57c213566fda` |
| `source-loading-policy-v2-approved.md` | `2661a3a266547a5e0f6b70c3dab8a02add2bb788b4a90b1136b7e9445b2d6061` |

Source mismatch blocker: `none`.

## 3. Current-writer и граница self-state

Текущий экземпляр АРХИВАРИУСА действует как authoritative current-writer **только для собственного ARH self-state** в рамках прямого handoff.

Подтверждено:

- current-writer не равен роли АРХИВАРИУСА как таковой;
- process ownership не создаёт writer authority над другими Сущностями;
- техническая возможность записи GitHub не создаёт authority на чужой snapshot;
- чужое состояние в этом cycle не переписывалось.

## 4. Текущая роль АРХИВАРИУСА

Статус:

`preservation_recovery_process_owner_active`

АРХИВАРИУС принимает эксплуатацию процесса в пределах roles v2.2 / recovery v1.4:

- отслеживает trigger-условия;
- инициирует checkpoint;
- принимает self-snapshot от current-writer;
- проверяет manifest, provenance, integrity и version identity;
- организует publication + readback;
- ведёт минимальный registry;
- фиксирует stale-state и известную recoverability.

Не принимает на себя:

- авторство чужого self-state;
- project management;
- production/system authority;
- назначение writer authority;
- реконструкцию потерянного state.

## 5. Собственный recovery до этого checkpoint

До обновления внешний current recovery ARH находился:

`puev5691/wellbeing-entity-bootstrap/entities/arh/recovery/current`

Наблюдаемая до изменения версия была доступна на immutable commit:

`c6914d2257382901c9b579dd301ef382e636d4cc`

Она соответствовала recovery v1.2 и поэтому после source-change требовала self-checkpoint.

## 6. Программный контур АРХИВАРИУСА

Сохранённый подтверждённый статус:

`paused_by_operator`

Runtime:

`not_verified`

Сохранённое ранее evidence о конкретной Android Git-копии не трактуется как текущая runtime-проверка.

Программные smoke-test, исправления и эксплуатация не возобновляются без нового прямого поручения ОПЕРАТОРА.

## 7. Legacy и неизвестное

- legacy локальный слой прежней среды не объявляется current;
- provenance неизвестных старых файлов не реконструируется;
- ПОЧТАЛЬОН: `not_found_in_checked_sources`;
- это не доказательство глобального отсутствия компонента в проекте.

## 8. Parked research

Копное право:

`research / parked_with_trigger`

Не активировать без прикладного trigger.

## 9. Первый source-change preservation cycle

Выполнено текущим ARH current-writer:

1. проверены exact active sources;
2. создан новый self-snapshot под v1.4;
3. initiation приведён к roles v2.2 / recovery v1.4;
4. сформирован единый минимальный recovery-registry;
5. подготовлен source-change report;
6. сформированы manifest и SHA-256;
7. пакет предназначен для внешней publication/readback в существующий GitHub recovery locator.

Статус других Сущностей не повышается автоматически.

## 10. Registry-state

Current registry включён в этот recovery-пакет:

`ARH__recovery-registry__ARH.md`

Ключевые выводы:

- KOO: собственный v1.4 cycle уже выполняется по входному KOO registry;
- KAN: `stale_check_required`, exact current recovery locator/version в проверенном bootstrap не найден;
- RED/SIS/WEB/SHT/KOD: external current recovery каталог наблюдается, но нормативная свежесть после source-change не подтверждена их current-writer;
- SHD/KON: recovery остаётся unknown, автоматический запуск не выполняется.

## 11. Publication / readback / recoverability ARH

Финальная версия этого пакета должна считаться принятой только после:

- publication во внешний locator;
- post-publication readback;
- совпадения внешней immutable identity с опубликованной версией;
- фиксации результата в registry/report.

В итоговом опубликованном состоянии:

- publication: `completed`;
- readback: `verified_by_git_blob_identity`;
- package integrity: `sha256sums.txt`;
- recoverability: `external_package_verified; fresh_cold_start_not_run_in_this_cycle`.

Пробный новый cold-start не выполняется механически только из-за наличия пакета; recovery v1.4 требует его по событийно или отдельно утверждённому основанию.

## 12. Checkpoints для других current-writer

Требуются, но **не выполняются АРХИВАРИУСОМ за адресатов**:

1. KAN — приоритетный: подтвердить/создать актуальный self-snapshot и exact external recovery locator/version;
2. RED — подтвердить нормативную свежесть и при необходимости обновить self-snapshot;
3. SIS — то же;
4. WEB — то же, post-init audit остаётся отдельным deferred вопросом;
5. SHT — подтвердить self-state с учётом roles v2.2/recovery v1.4;
6. KOD — обновить self/recovery references по новой норме, не менять accepted v0.6 code baseline.

KOO новый checkpoint не запрашивается: входной registry уже фиксирует его собственный cycle как `updating_to_v1_4`.

## 13. Writer-state после checkpoint

writer_state:

`ARH current-writer / preservation operations active / first v1.4 source-change cycle completed subject to external readback`

Open:

- KAN checkpoint;
- затем последовательная stale-проверка RED/SIS/WEB/SHT/KOD;
- реальная пробная recoverability-проверка ARH только по отдельному practically justified trigger.

Parked:

- программный АРХИВАРИУС;
- копное право;
- SHD/KON recovery campaign без отдельного приоритета.

## 14. Следующий безопасный шаг

> Адресно запросить у current-writer KAN preservation checkpoint по source-change, не выполняя snapshot за него.

---

document_type: entity-self-snapshot  
entity: ARH  
recovery_standard: v1.4  
status: current_snapshot  
writer_state: authoritative_current_writer_for_ARH_self_state  
preservation_process_owner: active  
project_time: generated_without_trusted_project_time  
