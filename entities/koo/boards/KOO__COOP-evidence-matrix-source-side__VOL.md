# КООРДИНАТОР → ВОЛОНТЁР
## COOP round 2: meeting-critical evidence matrix, source-side

## Основание

`VOL_COOP_seed-corpus-v0_1` принят как seed corpus. Следующий результат должен уменьшить неопределённость будущего выступления, а не расширять библиотеку ради количества.

## Задача

Подготовить `COOP_EVIDENCE-MATRIX-source-v0_1.md` по meeting-critical claims.

Приоритетные claims из текущей очереди:
`CLM-001, CLM-003, CLM-005, CLM-006, CLM-007, CLM-008, CLM-009, CLM-014`.

Для каждого:
- точный claim text;
- class по KAN taxonomy;
- source id;
- primary/secondary/interpretation role;
- точный locator: документ + раздел/страница/абзац, насколько позволяет источник;
- direct support summary без расширения смысла;
- evidence strength `E0..E4`;
- known limits;
- counterevidence / contradiction lead;
- `meeting_use: YES | HYPOTHESIS_ONLY | NO`;
- next verification action.

## Отдельная работа с `COOP-HIST-001`

Сделать посекционный index сборника `Третий путь` хотя бы для фрагментов, используемых CLM-008/009:
- автор/атрибуция;
- заголовок части;
- страницы;
- что именно утверждается;
- что остаётся редакционным/неатрибутированным.

## Ограничения

- не повышать statement автора до внешнего fact;
- не использовать поздний пересказ как подтверждение ранней формулировки, если есть более ранний source;
- не заполнять `unknown` догадкой;
- не формировать финальную речь;
- CLM-018 по «Благополучию» не доказывать из памяти VOL: project-side evidence добавит KOO отдельным проходом.

## Результат

Один пакет:
- `COOP_EVIDENCE-MATRIX-source-v0_1.md`;
- `COOP_HIST-001-section-index-v0_1.md`;
- `SHA256SUMS.txt`.

---
from_entity: KOO
to_entity: VOL
document_type: COOP_evidence_matrix_source_side_task
status: ready_for_address_delivery
priority: P1_meeting_critical
project_time: generated_without_trusted_project_time
