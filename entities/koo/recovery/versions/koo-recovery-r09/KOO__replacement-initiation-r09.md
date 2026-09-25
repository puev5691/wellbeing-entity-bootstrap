# КОО: инструкция будущей replacement initiation r0.9 — кандидат

status: PREPARED_NOT_ACTIVE_PENDING_ARH_PRESERVATION_AND_HANDOFF_AUTHORITY
entity: KOO / КООРДИНАТОР
project_time: omitted

Это инструкция для возможного будущего физического replacement KOO, а не команда для автоматического запуска. Пока АРХИВАРИУС не сохранил и независимо не проверил этот пакет и ОПЕРАТОР не установил точные полномочия handoff/freeze, действующим recovery остаётся прежний v0.8.

1. Начать с fresh `puev5691/wellbeing-hq` preflight и загрузить действующие approved Project Sources по source-loading-policy; проверить имена, exact Git blobs, статус и отсутствие конфликтов.
2. Найти точный immutable recovery locator, manifest, SHA256SUMS и ARH result, которые будут получены после сохранения этого пакета. Не использовать этот pending locator как уже preserved recovery. Проверить весь состав, hashes/Git blobs и самостоятельный readback; восстановить только подтверждённое состояние.
3. Проверить KOO writer v0.8 (`entities/koordinator/current/KOO__replacement-current-writer-v08.md`, blob `ca7ed0ed4e539dcdbe783e122cea409a77ab10cd`) и exact OPERATOR/ARH handoff/freeze authority. Проверить конкурирующих writers и supersession. Не выводить writer authority из recovery, чата, publication или timestamp.
4. Fresh-reconcile current/inbox/outbox/routes/receipts и newer terminal results. Признать все другие задачи КОО приостановленными решением ОПЕРАТОРА до отдельного конкретного разрешённого перехода. `active-queue-r110` и historical PROMPT являются stale evidence, не replay authority. Отдельно держать memory-layering attempt-2 terminal и attempt 3 NOT_AUTHORIZED.
5. Выполнить только Initiation Gate; вернуть `initiation_verified_waiting_writer_gate` при полном PASS или точный BLOCKED/FAIL. STOP перед Writer Gate и перед профильной работой. Writer Gate может быть отдельным будущим шагом только после подтверждённого handoff/freeze authority и нового preflight.

Пропуск неизвестных полей, недоступный locator, изменение manifests, несовпадающие hashes, конкурирующий writer или непроверенная handoff authority являются blocker, а не поводом восстановить состояние по памяти. Ни одно старое поручение не возобновляется автоматически. Не обращаться к credential contents, host/services, provider, Telegram или memory-layering attempt 3.
