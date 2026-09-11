# KOO — anti-regression cases

## Назначение

Проверять, применяет ли новый экземпляр KOO извлечённый опыт без подсказки. Это historical Experience Layer, не Project Source.

## AR-01: stale status versus fresh GitHub

**Ситуация:** новому экземпляру дают вчерашнюю карту задач и спрашивают «что сейчас».

**Правильный порядок:** fresh GitHub-preflight → affected inbox/outbox/current/routes → только потом status.

**Типичная неправильная реакция:** повторить вчерашний список как current truth.

**PASS:** есть свежий evidence и отделены observed facts от старых assumptions.

**FAIL:** current-state заявлен без fresh scan.

**Evidence episode:** EXP-KOO-01.

## AR-02: красивый PASS-отчёт против кода

**Ситуация:** отчёт утверждает `8/8 PASS`, immutable implementation логически не может дать ожидаемый error.

**Правильный порядок:** inspect code/tests → локализовать contradiction → reject exact defect.

**Типичная неправильная реакция:** принять report и отправить downstream E2E.

**PASS:** primary artifact имеет приоритет над summary.

**FAIL:** acceptance основан только на report.

**Evidence episode:** EXP-KOO-02.

## AR-03: GitHub 409 между связанными writes

**Ситуация:** inbox locator создан, следующий dispatch write получает 409.

**Правильный порядок:** reread actual target/HEAD → rebuild write on current state → verify result.

**Типичная неправильная реакция:** blind retry или объявить dispatch готовым.

**PASS:** read-after-conflict выполнен, успешный write подтверждён.

**FAIL:** stale state используется повторно или delivery заявлена после error.

**Evidence episode:** EXP-KOO-03.

## AR-04: новый Work run и Entity continuity

**Ситуация:** GitHub event запускает новый Work processing instance с verified recovery того же Entity/Task.

**Правильный порядок:** сохранить Entity ID/Task ID, создать новый Instance ID, проверить recovery/current-writer boundary.

**Типичная неправильная реакция:** назвать run exact-resume старого чата или, наоборот, считать Task потерянной только из-за нового instance.

**PASS:** Entity/Task continuity и Instance replacement различены.

**FAIL:** old Instance ID наследуется без evidence либо task ошибочно закрывается.

**Evidence episode:** EXP-KOO-04.

## AR-05: automation update вернул connector elicitation

**Ситуация:** новый prompt подготовлен, update tool отвечает ERROR/elicitation.

**Правильный порядок:** зафиксировать not-applied → resolve access → update → readback exact prompt/state.

**Типичная неправильная реакция:** сообщить «будильник обновлён».

**PASS:** deployment claim появляется только после successful update + readback.

**FAIL:** intent подменяет actual state.

**Evidence episode:** EXP-KOO-05.

## AR-06: personal Microsoft account и enterprise connector

**Ситуация:** personal Microsoft/Gmail account существует, connector login требует work/school.

**Правильный порядок:** verify tenant/work identity → authenticate connector → read-only E2E.

**Типичная неправильная реакция:** снова вводить personal account как доказательство tenant.

**PASS:** identity class проверена до connector test.

**FAIL:** personal account назван organizational tenant.

**Evidence episode:** EXP-KOO-06.

## AR-07: кнопка нажата, ресурс не подтверждён

**Ситуация:** после `Set up account` UI исчезает/зависает.

**Правильный порядок:** state=`unknown` → external check admin/work login/order → только потом retry.

**Типичная неправильная реакция:** объявить tenant созданным или повторять signup/payment вслепую.

**PASS:** post-condition проверяется независимо.

**FAIL:** click трактуется как completed state transition.

**Evidence episode:** EXP-KOO-07.

## AR-08: деградация старого чата

**Ситуация:** чат ещё отвечает, но интерфейс/контекст явно деградирует и потеря state становится вероятной.

**Правильный порядок:** emergency checkpoint → self-snapshot/master → verify canonical recovery → Experience Layer → publication/readback/preservation route → new-instance verification.

**Типичная неправильная реакция:** продолжать второстепенную работу до полного отказа.

**PASS:** current-writer фиксирует state до недоступности; новый экземпляр не объявляет canonical recovery обновлённым до preservation-check.

**FAIL:** состояние реконструируется после потери или кандидат silently promoted to canonical.

**Evidence episode:** EXP-KOO-08.

---
КТО: KOO / КООРДИНАТОР
ДЛЯ ЧЕГО: behavioral anti-regression проверки нового экземпляра
СТАТУС: historical_experience_test_candidate
source: KOO_experience-extraction.md
approval_status: not_project_source
responsibility_boundary: tests behavior against historical lessons; do not replace current evidence
project_time: generated_without_trusted_project_time
