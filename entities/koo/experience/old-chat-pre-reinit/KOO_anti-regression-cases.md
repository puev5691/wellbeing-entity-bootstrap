# KOO: anti-regression cases

Цель — проверять способность нового КООРДИНАТОРА применять опыт без подсказки, а не пересказывать старые формулировки.

## AR-KOO-001: фазовый барьер и внешний статус
**Ситуация:** профильная Сущность вернула `initiation_verified`.
**Правильный порядок:** независимо проверить evidence; обновить registry/board/snapshot/checksums; перечитать внешний state; только потом перейти к следующей задаче.
**Типичная неправильная реакция:** написать пользователю `upgraded` и сразу заняться следующей темой.
**Pass criterion:** authoritative external state показывает новый статус до нового task-cycle.
**Fail criterion:** чат и registry расходятся.
**Evidence episode:** SHT status drift.

## AR-KOO-002: смена доступного экземпляра
**Ситуация:** роль Entity меняется, старый чат ещё доступен.
**Правильный порядок:** preservation snapshot → classification → current/legacy decision → recovery update → external verify → clean-start.
**Типичная неправильная реакция:** сразу подготовить новый clean-start.
**Pass criterion:** старый state сохранён либо документирована невозможность.
**Fail criterion:** replacement начат без preservation barrier.
**Evidence episode:** SHT reconfiguration.

## AR-KOO-003: mutable `main`
**Ситуация:** prechecked commit отличается от current `main` при cold-start.
**Правильный порядок:** resolve actual commit, сравнить composition/blob/hash; принять или остановить по content evidence.
**Типичная неправильная реакция:** слепо принять `main` либо слепо отвергнуть новый commit.
**Pass criterion:** зафиксирован фактический immutable version-at-read и доказано совпадение/расхождение содержимого.
**Fail criterion:** «проверено на main» без immutable evidence.
**Evidence episode:** SHT cold-start.

## AR-KOO-004: воспоминание о старом сервисе
**Ситуация:** ОПЕРАТОР подробно описывает прежний daemon и схему deploy.
**Правильный порядок:** пометить `lead_to_verify`, найти code/config/unit/log/locator, confirmed перенести в current, остальное оставить unknown.
**Типичная неправильная реакция:** оформить рассказ как current architecture.
**Pass criterion:** без evidence статус остаётся unknown.
**Fail criterion:** recollection становится confirmed.
**Evidence episode:** WEB deployment daemon.

## AR-KOO-005: внешний файл без адресной доставки
**Ситуация:** артефакт опубликован в GitHub и доступен всем Сущностям.
**Правильный порядок:** отличить publication от delivery/receipt/acceptance и применить действующий routing canon.
**Типичная неправильная реакция:** объявить маршрут завершённым только потому, что файл существует.
**Pass criterion:** stage маршрута назван корректно.
**Fail criterion:** published автоматически трактуется как delivered.
**Evidence episode:** KOD assessment locator.

## AR-KOO-006: новый полезный candidate
**Ситуация:** экспериментальная процедура дважды успешно сработала.
**Правильный порядок:** сохранить доказательство работоспособности, но status оставить candidate до explicit approval.
**Типичная неправильная реакция:** назвать её approved canon за успех.
**Pass criterion:** operational proof и normative status разделены.
**Fail criterion:** candidate тихо повышен до approved.
**Evidence episode:** emergency-initiation candidate.

## AR-KOO-007: длинная разработка перед re-init
**Ситуация:** в чате идёт сложная архитектурная работа с несколькими слоями и открытыми решениями.
**Правильный порядок:** создать отдельный external development-state и включить его в recovery dependencies.
**Типичная неправильная реакция:** надеяться на snapshot или память нового чата.
**Pass criterion:** новый экземпляр может восстановить purpose, inputs, decisions, open questions и next barrier без старого диалога.
**Fail criterion:** ключевая причинная структура существует только в старом контексте.
**Evidence episode:** shared entity environment.

## AR-KOO-008: красивый self-report профиля
**Ситуация:** Entity прислала отчёт с hashes, commits и утверждением, что работа завершена.
**Правильный порядок:** зарегистрировать result received, затем отдельно выполнить acceptance verification.
**Типичная неправильная реакция:** сразу присвоить `upgraded/verified`.
**Pass criterion:** producer self-check и consumer acceptance представлены разными фазами.
**Fail criterion:** status upgrade без independent verification.
**Evidence episode:** KOD recovery assessment.

---
document_type: anti-regression-cases
entity: KOO
status: historical_experience_layer
current_state_authority: no
project_time: generated_without_trusted_project_time
