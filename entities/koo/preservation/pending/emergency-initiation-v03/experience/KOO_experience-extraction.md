# KOO — извлечение опыта старого экземпляра

## Граница extraction

Роль подтверждена: `KOO / КООРДИНАТОР`. Источник: доступный контекст этого чата, реально присутствующие файлы и tool evidence. Чат виден не от начала; недоступные ранние участки не реконструировались. Документ является historical Experience Layer, не recovery/current-state и не Project Source.

## Существенные эпизоды

### E1. Fresh GitHub-preflight перед current-state
**Задача:** сообщать реальное состояние задач.  
**Контекст / объект:** `puev5691/wellbeing-hq`.  
**Исходная модель / ожидание:** прежний task list может быть достаточен.  
**Evidence / наблюдение:** свежие commits/inbox меняли статусы быстрее, чем старые summary.  
**Предпринятые действия:** перед статусом читать recent commits, affected inbox/outbox/current, routes/receipts.  
**Неудачные / недостаточные заходы:** вывод по прежней карте или отсутствию имени файла.  
**Рабочее решение:** mandatory preflight.  
**Проверка результата:** fresh readback находил новые results/blockers.  
**Изменение модели:** current truth требует свежего evidence.  
**Lesson:** сначала scan, потом status.  
**next_time_behavior:** current-state claim только после fresh scan.  
**prohibited_repeat:** не выдавать вчерашнюю карту за текущее состояние.  
**Граница применимости:** scan не равен acceptance.  
**Актуальность:** `reusable`.  
**Evidence:** GitHub readback текущего чата.

### E2. Actual code/tests важнее PASS-отчёта
**Задача:** принять activation-worker v0.2.  
**Контекст / объект:** immutable worker/tests/report KOD.  
**Исходная модель / ожидание:** `8/8 PASS` после provenance может быть достаточен.  
**Evidence / наблюдение:** `commit_exists()` поглощал ProviderError; provider unavailable превращался в commit absent, а опубликованный тест ожидал другой error.  
**Предпринятые действия:** прочитаны actual code/tests и сопоставлена ветка ошибок.  
**Неудачные / недостаточные заходы:** report-first acceptance.  
**Рабочее решение:** reject с точным исправимым verification defect.  
**Проверка результата:** contradiction следовал непосредственно из code path + expected assertion.  
**Изменение модели:** `report != proof` для acceptance-critical поведения.  
**Lesson:** primary artifact имеет приоритет.  
**next_time_behavior:** читать immutable implementation/tests до technical acceptance.  
**prohibited_repeat:** не отправлять downstream E2E только по PASS-report.  
**Граница применимости:** глубина review зависит от риска.  
**Актуальность:** `reusable`.  
**Evidence:** v0.2 review текущего чата.

### E3. GitHub 409 между связанными writes
**Задача:** создать KOD inbox locator и dispatch.  
**Контекст / объект:** shared GitHub `main`.  
**Исходная модель / ожидание:** только что полученный commit останется достаточной основой следующего write.  
**Evidence / наблюдение:** dispatch create получил 409, потому что branch успел измениться.  
**Предпринятые действия:** reread actual inbox/HEAD, затем retry.  
**Неудачные / недостаточные заходы:** первый write против stale state.  
**Рабочее решение:** read-after-conflict.  
**Проверка результата:** повторный dispatch commit создан.  
**Изменение модели:** shared repo конкурентен даже между собственными последовательными действиями.  
**Lesson:** conflict требует readback, не blind retry.  
**next_time_behavior:** 409 → reread target/HEAD → retry.  
**prohibited_repeat:** не объявлять dispatch успешным после failed write.  
**Граница применимости:** mutable shared branch writes.  
**Актуальность:** `reusable`.  
**Evidence:** activation-product E2E routing episode.

### E4. Entity continuity отделена от Instance continuity
**Задача:** найти event-driven activation path.  
**Контекст / объект:** GitHub PR-triggered Work и exact chat resume.  
**Исходная модель / ожидание:** continuity может требовать возврата в тот же chat instance.  
**Evidence / наблюдение:** поддержан новый Work processing context с recovery input; exact existing-chat resume не доказан.  
**Предпринятые действия:** bounded acceptance `NEW_WORK_PROCESSING_INSTANCE_WITH_VERIFIED_RECOVERY_INPUT`; exact-resume оставлен blocker.  
**Неудачные / недостаточные заходы:** смешение Entity ID и Instance ID.  
**Рабочее решение:** Entity ID + Task ID + verified recovery/experience + fresh Instance ID.  
**Проверка результата:** activation boundary фиксировал `processing_started: no` для exact resume.  
**Изменение модели:** смена instance не завершает Entity Task.  
**Lesson:** `FAILED/ENDED INSTANCE != FAILED/ENDED TASK`.  
**next_time_behavior:** разделять Entity/Task/Instance IDs.  
**prohibited_repeat:** не называть новый Work run exact-resume без evidence.  
**Граница применимости:** writer transfer проверяется отдельно.  
**Актуальность:** `reusable`.  
**Evidence:** KOD feasibility + KOO bounded decision + activation boundary.

### E5. Будильник обязан публиковать весь рабочий цикл
**Задача:** сделать timer-run наблюдаемой профильной работой.  
**Контекст / объект:** KOD/KOO/SIS/SHT/ARH automations.  
**Исходная модель / ожидание:** wake + scan + краткий итог достаточны.  
**Evidence / наблюдение:** ОПЕРАТОР потребовал запись в чате на каждый start и полный цикл `START→TASK→ACTION→RESULT/BLOCKER→CHECK→FIXATION/ROUTING→EXPERIENCE`.  
**Предпринятые действия:** подготовлен новый invariant prompt.  
**Неудачные / недостаточные заходы:** две KOO update попытки вернули `ERROR: Eliciting user for connector access`.  
**Рабочее решение:** считать правило pending, пока update + readback не подтверждены.  
**Проверка результата:** tool error означает отсутствие подтверждённого изменения.  
**Изменение модели:** observability каждого run является частью bootstrap result.  
**Lesson:** `prepared prompt != applied automation`.  
**next_time_behavior:** update → readback → только затем `applied`.  
**prohibited_repeat:** не заявлять hardening после failed tool call.  
**Граница применимости:** chat record не заменяет file-first артефакт.  
**Актуальность:** `requires-current-check`.  
**Evidence:** automation peek/update errors.

### E6. Personal Microsoft account не равен organizational tenant
**Задача:** подключить Microsoft connectors.  
**Контекст / объект:** Microsoft work/school login.  
**Исходная модель / ожидание:** personal account на Gmail может хватить.  
**Evidence / наблюдение:** UI явно потребовал work/school account.  
**Предпринятые действия:** начат Microsoft 365 Business Basic Trial signup.  
**Неудачные / недостаточные заходы:** использование personal identity как готовой enterprise identity.  
**Рабочее решение:** создать/проверить M365/Entra tenant/work account.  
**Проверка результата:** explicit login rejection.  
**Изменение модели:** Microsoft Account и organizational identity — разные контуры.  
**Lesson:** перед OAuth verify identity class.  
**next_time_behavior:** сначала tenant evidence, потом connector test.  
**prohibited_repeat:** не считать personal registration tenant creation.  
**Граница применимости:** consumer services могут принимать personal account.  
**Актуальность:** `reusable`.  
**Evidence:** Microsoft login screenshot/error.

### E7. Button pressed не означает tenant created
**Задача:** создать M365 tenant.  
**Контекст / объект:** Business Basic trial signup.  
**Исходная модель / ожидание:** `Set up account` ведёт к organization/sign-in details.  
**Evidence / наблюдение:** после click продолжение исчезло; tenant/admin/work-login evidence нет.  
**Предпринятые действия:** дальнейшая регистрация остановлена.  
**Неудачные / недостаточные заходы:** причина UI failure — `unknown`.  
**Рабочее решение:** tenant state=`unknown/not verified`; сначала external post-condition check.  
**Проверка результата:** нет подтверждения созданного work account.  
**Изменение модели:** UI action ≠ state transition.  
**Lesson:** verify resulting resource independently.  
**next_time_behavior:** проверить admin/work login/order до retry/payment.  
**prohibited_repeat:** не объявлять tenant/trial/payment созданными по click.  
**Граница применимости:** root cause UI failure `unknown`.  
**Актуальность:** `requires-current-check`.  
**Evidence:** последний signup screen + OPERATOR report.

### E8. Emergency handoff до полного отказа
**Задача:** не потерять authoritative self-state.  
**Контекст / объект:** деградирующий старый KOO chat, recovery canon.  
**Исходная модель / ожидание:** можно сохраняться после полного failure.  
**Evidence / наблюдение:** ОПЕРАТОР приказал аварийно бэкапиться и инициироваться, пока current-writer ещё доступен.  
**Предпринятые действия:** создан master + Experience Layer; canonical recovery locator перепроверен.  
**Неудачные / недостаточные заходы:** ждать hard failure.  
**Рабочее решение:** checkpoint при credible risk of state loss.  
**Проверка результата:** handoff files созданы; external publication/readback выполняются отдельно.  
**Изменение модели:** trigger = риск потери, не только уже случившаяся потеря.  
**Lesson:** preserve before break.  
**next_time_behavior:** self-snapshot при деградации до недоступности.  
**prohibited_repeat:** не откладывать snapshot до смерти current-writer.  
**Граница применимости:** не каждый transient glitch требует failover.  
**Актуальность:** `reusable`.  
**Evidence:** recovery canon v1.4 + current OPERATOR instruction.

### E9. Действие важнее координационной риторики
**Задача:** реально закрывать dependency chain.  
**Контекст / объект:** KOO routing/workflow.  
**Исходная модель / ожидание:** описать правильный следующий шаг иногда достаточно.  
**Evidence / наблюдение:** ОПЕРАТОР потребовал выполнять безопасное действие самому, если есть data+authority+tools, и не использовать человека как transport protocol.  
**Предпринятые действия:** direct GitHub artifacts/dispatch вместо plan-only сообщений.  
**Неудачные / недостаточные заходы:** «стоит сделать/нужно передать» без action.  
**Рабочее решение:** `execute → verify → short fixation`.  
**Проверка результата:** commits/locators вместо одного обещания.  
**Изменение модели:** ценность KOO = закрытые проверяемые цепочки.  
**Lesson:** capability+authority+sufficient data => action.  
**next_time_behavior:** перед ответом проверять, можно ли сделать безопасный next step инструментом.  
**prohibited_repeat:** не перекладывать routing на ОПЕРАТОРА без технической необходимости.  
**Граница применимости:** approval-required/non-delegable/high-impact не обходить.  
**Актуальность:** `reusable`.  
**Evidence:** direct GitHub routing + OPERATOR feedback.

## Плантация граблей

1. **Stale state как current truth.** Симптом: неверный статус. Причина: repo изменился. Detection: fresh scan. Правильный подход: preflight. Anti-regression: при старом task list и свежем commit экземпляр обязан сначала читать repo.
2. **PASS-report без implementation review.** Симптом: ложная приёмка. Причина: report противоречит code/test. Detection: immutable primary artifacts. Правильный подход: code/tests first. Anti-regression: contradiction должен привести к reject.
3. **Blind retry после GitHub 409.** Симптом: failed dispatch. Причина: branch advanced. Detection: 409 expected/current mismatch. Правильный подход: reread+retry. Anti-regression: после concurrent commit должен быть readback.
4. **Entity=Instance.** Симптом: новый Work run ошибочно объявляется тем же chat или Task считается потерянной. Причина: identity layers смешаны. Правильный подход: Entity/Task/Instance IDs отдельно.
5. **Prepared prompt=deployed automation.** Симптом: объявлено обновление после tool ERROR. Причина: intent/result confusion. Правильный подход: update+readback.
6. **Personal Microsoft Account=tenant.** Симптом: enterprise login reject. Причина: identity class mismatch. Правильный подход: verify Entra/M365 work identity.
7. **Click=created resource.** Симптом: UI исчез, но tenant объявлен созданным. Причина: `unknown`. Правильный подход: external post-condition.
8. **Handoff после hard failure.** Симптом: state приходится реконструировать. Причина: checkpoint слишком поздно. Правильный подход: preserve при credible degradation risk.

## Причинные решения

- stale summary vs fresh repo → выбран mandatory preflight; memory-only rejected.
- PASS report vs primary implementation → chosen primary code/tests; report-only acceptance rejected.
- exact chat resume vs replaceable instance + recovery → bounded new-instance path accepted; exact resume remains blocker.
- short timer card vs full run trace → OPERATOR chose full cycle + chat record; application requires readback.
- continue degraded chat vs emergency handoff → OPERATOR chose handoff now; hard-failure waiting rejected.

## Reusable procedures

### P1. GitHub current-state preflight
recent commits → affected inbox/outbox/current → dispatch/receipts/activation/recovery → classify change → choose task. Stop on unavailable/conflicting authoritative evidence. Scan is not profile completion.

### P2. Technical acceptance
immutable locator → actual code/config/tests → compare claim → confirm/reproduce contradiction → accept or exact reject. Stop if exact version unavailable.

### P3. Shared GitHub routing
create artifact → readback blob → inbox locator → on 409 reread state → dispatch → verify dispatch. Publication/dispatch/receipt/acceptance remain distinct.

### P4. Alarm-run observability
WAKE → CHAT START → SCAN → TASK → ACTION → RESULT/BLOCKER → CHECK → FIXATION/ROUTING → CHAT EXPERIENCE. Tool error becomes blocker; deployment claim only after readback.

### P5. Enterprise connector onboarding
identify identity class → verify tenant/work account → authenticate → verify scopes → one read-only E2E → only then architectural use. Stop on identity/billing/approval ambiguity.

### P6. Emergency KOO handoff
stop nonessential mutations → fresh state readback → self-snapshot/master → Experience Layer → verify canonical recovery → publish/readback → ARH preservation route → new instance recovery verification → one-writer check.

## Историческое незавершённое состояние

**open:** alarm full-cycle hardening; research more alarms/plan/settings/GitHub/Work/Microsoft; M365 tenant/connector; GitHub queue after fresh preflight.  
**parked:** exact existing-chat resume until supported evidence appears.  
**blocked:** last KOO automation updates by connector elicitation; M365 signup UI after `Set up account`.  
**unknown:** partial tenant/order existence; automation changes after last peek; commits after snapshot; lessons hidden in unavailable early chat.  
**superseded:** exact chat resume as only continuity model; exact-resume capability itself remains unresolved.

## EXTRACTION_REPORT

- диапазон: доступный текущий контекст KOO до emergency handoff;
- чат от начала: `no`;
- недоступно: ранняя часть истории;
- эпизоды: `9`;
- грабли: `8`;
- причинные решения: `5`;
- reusable procedures: `6`;
- experience cards: `9`;
- anti-regression cases: `8`;
- explicit `unknown`: `6`;
- направления: GitHub coordination, activation/continuity, automation, recovery, technical acceptance, Microsoft integration.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: historical Experience Layer перед аварийной инициацией нового экземпляра
СТАТУС: historical_experience_extraction_candidate
source: текущий доступный чат KOO; KOO__OLD-CHAT-experience-extraction-task.md
approval_status: not_project_source
responsibility_boundary: current applicability requires fresh evidence
project_time: generated_without_trusted_project_time
