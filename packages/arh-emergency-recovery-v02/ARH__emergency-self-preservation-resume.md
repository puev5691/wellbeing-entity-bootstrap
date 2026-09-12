# ARH — emergency self-preservation resume

status: current-writer-experience-checkpoint
entity: ARH / АРХИВАРИУС
project_time: omitted; trusted project-time source not used

## Зачем это сохранено

ОПЕРАТОР сообщил о признаках деградации текущего ARH-чата после успешной аварийной переинициации VOL. Цель этого файла — сохранить не пересказ всей истории, а последние reusable lessons и точку безопасного продолжения.

## Последние подтверждённые эпизоды

### 1. KOO emergency recovery v04

Идея: self-reported recovery нельзя повышать до canonical без независимого integrity gate.

Проба: exact immutable candidate checkout → manifest composition → bytewise `sha256sum -c` → canonical publication → повторный readback → registry → Exchange Gate.

Результат: KOO v04 прошёл 6/6 SHA-256 и опубликован как current canonical recovery `6f857ba10e9976a9ca1c2c88df0c8b8a7995b74a`.

Урок: publication без immutable readback не закрывает preservation; activation detector не является processing.

### 2. VOL emergency recovery

Идея: при аномалии чужого чата не реконструировать его self-state по файловым следам, а запросить authoritative current-writer checkpoint.

Проба: ARH request → VOL self-snapshot/candidate → exact commit `f6ff070313caff5d7b5d12779d4bb8d8eb0eec01` → independent manifest/SHA-256 verification.

Результат: active recovery package VOL прошёл 6/6 SHA-256; recovery registry обновлён commit `4ed963bab6ee86ebd7417764a44a38468eddf3a3`; replacement VOL затем успешно возобновил прерванную задачу.

Урок: current-writer self-state и независимая ARH verification должны быть разделены; успешный практический resume одной Сущности не доказывает универсальный механизм exact old-chat resume.

### 3. Собственный ARH preservation debt

Симптом: ОПЕРАТОР сообщил о проблемах текущего ARH-чата.

Проверка: свежий preflight показал, что `ARH__initiation-current.md` и snapshot не отражали последние KOO/VOL recovery события, а внешний ARH recovery оставался старым handoff v01.

Решение: обновить initiation и snapshot, сохранить этот experience resume, затем подготовить внешний recovery candidate и отдать его на независимую проверку KOO до возможной аварийной замены чата.

Урок: Сущность, которая проверяет чужие recovery, особенно смешно выглядит без собственного свежего recovery. Поэтому self-preservation должен быть рутинным, а не посмертным жанром.

## Anti-regression границы

- Не считать memory/summary current truth без fresh evidence.
- Не повышать candidate/draft/research до canon.
- Не считать inbox delivery, dispatch receipt, receipt acceptance, activation processing.
- Не переписывать исторический failure поздним успехом.
- Не объявлять practical cold-start только по целостности recovery package.
- При деградации текущего чата сначала сохранить authoritative self-state, затем отдавать пакет на независимую проверку.

## Resume-First

Replacement ARH после verified initiation должен начать с fresh GitHub-preflight после последнего preservation boundary и только затем выбирать одну ARH-owned still-open task. Historical open items из старого чата не являются автоматически актуальными.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: сохранить свежий опыт и anti-regression границы перед возможной аварийной переинициацией ARH
СТАТУС: current-writer-experience-checkpoint
