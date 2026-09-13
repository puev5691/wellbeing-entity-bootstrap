# SHD emergency Experience Resume v02

status: recovery_experience_candidate
project_time: omitted; trusted project-time source not used

## Идея → проба → результат → фиксация → урок

### 1. Fresh evidence before action

Идея: старые планы нельзя считать текущим состоянием.
Проба: сравнить recovery `ce9891f...` с сегодняшними MAZHOR commits.
Результат: recovery существенно старше lab-01 work.
Фиксация: base recovery + external overlay + fresh preflight.
Урок: восстановление только по старому snapshot создаёт уверенного, но устаревшего исполнителя.

### 2. Backup before failover

Идея: сначала сохранить полезное состояние хоста, потом менять чат.
Проба: non-secret backup `/data/wellbeing-lab/backups/shd-pre-reinit-v01`.
Результат: 5/5 checksum PASS.
Фиксация: отдельный backup index.
Урок: чат заменяется быстрее, чем восстанавливается потерянный local evidence.

### 3. Один спокойный RDC-шаг

Идея: нестабильный heartbeat не лечится десятком одновременных проверок.
Проба: single device ping + single bounded read-only command.
Результат: MAZHOR online и отвечал.
Фиксация: recovery launcher требует one-step tool discipline.
Урок: повторные frantic calls увеличивают шум и риск ошибочного вывода.

### 4. Не использовать Буржуинию как обходной мост

Идея: отдельный sandbox должен оставаться отдельным.
Проба старого процесса: side-route через `ruvds-xnqc6`.
Результат: ненужное смешение контуров и дисциплинарная ошибка.
Фиксация: явный запрет в readiness/recovery.
Урок: MAZHOR lab work выполняется на MAZHOR, а не через production-like соседей.

### 5. Не усложнять команды для мобильного ОПЕРАТОРА

Идея: вложенные quoting/многострочные shell-конструкции можно дать одним красивым блоком.
Результат: повышенная вероятность ошибок и непонимания.
Фиксация: один простой шаг, короткий проверяемый вывод.
Урок: мобильный терминал — не место для конкурса по shell-эзотерике.

### 6. UI/chat hang не равен незавершённой backend work

Идея: визуально зависший чат мог уже завершить writes.
Проба: проверять GitHub/host evidence.
Результат: в других инцидентах backend work была завершена при зависшем UI.
Фиксация: перед повтором операции проверить postconditions.
Урок: не дублировать действия только потому, что пузырь сообщения выглядит мёртвым.

### 7. ARH не сочиняет foreign self-snapshot

Идея: при сломанном SHD можно восстановить его current-state за него.
Результат: это нарушает recovery ownership.
Фиксация: ARH external coordination checkpoint, явно `self_snapshot: no`.
Урок: отсутствие trustworthy snapshot — факт, а не приглашение к художественной реконструкции.

### 8. Candidate не становится canon от энтузиазма

Идея: PWH/hashchain выглядит перспективно.
Результат: это research candidate.
Фиксация: no auto-resume/no promotion during recovery.
Урок: recovery должен восстанавливать статусы, а не мечты.

### 9. GitHub publish / dispatch / receipt / acceptance различаются

Фиксация:
`published ≠ dispatched ≠ received ≠ accepted`.

Урок: наличие файла или commit не доказывает обработку адресатом.

### 10. MAZHOR остаётся лабораторией

До exact нового задания:
- no WBN/TERA2 node launch;
- no public ports;
- no firewall/service mutation;
- no production;
- no credentials in GitHub;
- no destructive cleanup.

---
КТО: ARH / АРХИВАРИУС
ДЛЯ ЧЕГО: передать replacement SHD накопленный anti-regression опыт без повышения experience candidate до канона
СТАТУС: recovery_experience_candidate
