# КООРДИНАТОР: извлечение опыта старого экземпляра

## Назначение

Исторический Experience Layer старого экземпляра `KOO / КООРДИНАТОР`. Это не recovery snapshot, не current-state и не новый канон. Цель — сохранить переносимые lessons, процедуры и грабли.

## Роль и доступная история

Entity: `KOO`. Фактические направления: recovery v1.2, внешняя проверка GitHub, перенастройка ролей, маршрутизация, preservation/re-init, файловое поле и разработка общей среды Сущностей.

Доступный диапазон не подтверждён как полный чат от начала. Поздний цикл от аварийной инициации WEB через KOD/SHT до собственного re-init KOO виден подробно; ранняя история доступна лишь частично/сжато.

# 1. Существенные рабочие эпизоды

### Аварийная инициация WEB
**Задача:** вернуть WEB при ненадёжном старом чате.  
**Контекст / объект:** recovery v1.2.  
**Исходная модель / ожидание:** штатный recovery опирается на self-assessment predecessor.  
**Evidence / наблюдение:** старый WEB нельзя было использовать как current truth; минимальный внешний recovery прошёл независимую проверку новым WEB.  
**Предпринятые действия:** initiation/snapshot/manifest/checksums → GitHub → reread → clean cold-start.  
**Неудачные / недостаточные заходы:** реконструкция потерянной истории отвергнута.  
**Рабочее решение:** `minimal verified nucleus → external publication → independent verification → cold-start → read-only audit`.  
**Проверка результата:** `initiation_verified`, совпадение состава/hash/blob.  
**Изменение модели:** recovery восстанавливает проверяемое ядро, а не «память чата».  
**Lesson:** неизвестное сохранять unknown.  
**next_time_behavior:** при ненадёжном predecessor сразу включать emergency bootstrap.  
**prohibited_repeat:** не реконструировать current-state по догадкам.  
**Граница применимости:** нужна подтверждённая роль и approved/verified basis.  
**Актуальность:** `reusable`.  
**Evidence:** `entities/web/recovery/current`, `standards/chat-entity-operations/candidates/emergency-entity-initiation-v01-candidate.md`.

### Следопыт как predecessor КОДЕРА
**Задача:** разрешить `legacy_unmapped`.  
**Контекст:** identity/provenance.  
**Исходная модель:** Следопыт мог быть отдельной Entity.  
**Evidence:** OPR явно подтвердил `КОДЕР = бывший СЛЕДОПЫТ`; `sledopyt-v01` подтверждает старый `teraorigin_research`.  
**Действие:** классифицирован как `legacy provenance predecessor KOD`.  
**Неудачный путь:** отдельный current recovery Следопыта отвергнут.  
**Рабочее решение:** current KOD определяется свежей ролью/state; legacy хранит происхождение.  
**Проверка:** GitHub `packages/core/sledopyt-v01/`.  
**Lesson:** переименование роли не должно размножать current Entities.  
**next_time_behavior:** explicit identity mapping → legacy/current split.  
**prohibited_repeat:** не поднимать legacy Entity автоматически.  
**Граница:** mapping требует явного подтверждения.  
**Актуальность:** `reusable`.

### Воспоминание OPR о WEB deployment daemon
**Задача:** использовать память о старой публикационной цепочке без выдумки.  
**Контекст:** WEB/KOD.  
**Исходная модель:** демон мог копировать локальный сайт на burzh/erefia.  
**Evidence:** KOD не нашёл в проверенном контуре code/unit/config/README/log/deploy-script.  
**Действие:** `operator_recollection / lead_to_verify`.  
**Неудачный путь:** архитектура по памяти не реконструировалась.  
**Рабочее решение:** искать внешний след; до него current=`unknown`.  
**Проверка:** KOD assessment.  
**Lesson:** recollection — поисковый lead, не evidence.  
**next_time_behavior:** искать code/config/unit/log/locator.  
**prohibited_repeat:** не записывать recollection как current architecture.  
**Граница:** явное текущее решение OPR не равно воспоминанию о прошлом.  
**Актуальность:** `reusable`.

### GitHub locator как адрес артефакта
**Задача:** оценить передачу KOD assessment ссылкой на GitHub.  
**Контекст:** file field/routing.  
**Исходная модель:** approved canon завершает маршрут фактической загрузкой в чат.  
**Evidence:** самостоятельный KOD-файл имел locator, commit/blob/checksums и был прочитан KOO напрямую.  
**Действие:** разведены file field и coordination field; publication/delivery/receipt/acceptance.  
**Неудачный путь:** тихо заменить действующий canon практикой.  
**Рабочее решение:** pattern признан полезным, изменение нормы=`needs_decision`.  
**Проверка:** доступность и содержательность GitHub report.  
**Lesson:** locator может адресовать существующий artifact, но publication не равна delivery.  
**next_time_behavior:** фиксировать стадии маршрута отдельно.  
**prohibited_repeat:** не объявлять published=delivered.  
**Граница:** до normative change действует current routing canon.  
**Актуальность:** `reusable`.

### Semantic-first общая среда Сущностей
**Задача:** начать межсущностную инфраструктуру.  
**Контекст:** shared entity environment.  
**Исходная модель:** можно сразу обсуждать API/daemon/queue.  
**Evidence:** KAN сначала развёл Entity/instance/chat, authority/capability, file/coordination field, publish/deliver/receive/accept.  
**Действие:** `KAN → SHT → KOO → KOD → SIS/ARH`.  
**Неудачный путь:** API-first запрещён до смыслового слоя.  
**Рабочее решение:** смысл → организация → архитектура → протокол → код → инфраструктура.  
**Проверка:** KAN candidate стал пригодным input SHT.  
**Lesson:** сначала определения и инварианты.  
**next_time_behavior:** не выбирать технологию до semantic+organizational layer.  
**prohibited_repeat:** не программировать неразрешённую семантику.  
**Граница:** простые локальные техзадачи не требуют полного цикла.  
**Актуальность:** `reusable`.

### SHT: новая роль вместо фиктивного recovery
**Задача:** определить current функцию ШТАБИСТА.  
**Контекст:** role/recovery.  
**Исходная модель:** возможно восстановить старый профиль.  
**Evidence:** role-source прямо оставлял полномочия SHT недостаточно определёнными; current recovery отсутствовал.  
**Действие:** OPR задал новую current роль внутренней организационно-процессной Entity.  
**Неудачный путь:** ретроспективно сочинить единую старую роль.  
**Рабочее решение:** explicit role decision + legacy provenance.  
**Проверка:** новый SHT прошёл `initiation_verified`.  
**Lesson:** missing role нельзя лечить красивой реконструкцией.  
**next_time_behavior:** role-source check → authority decision → new current role.  
**prohibited_repeat:** не выдавать фактическую старую деятельность за approved role.  
**Граница:** нужна explicit authority.  
**Актуальность:** `reusable`.

### Preservation barrier перед SHT clean-start
**Задача:** заменить экземпляр SHT после смены роли.  
**Исходная модель:** KOO слишком быстро подготовил clean-start.  
**Evidence:** OPR спросил о snapshot; старый SHT затем обнаружил ценный provenance и unfinished routes.  
**Действие:** cold-start остановлен; preservation snapshot → classification → recovery update → verify → clean-start.  
**Неудачный путь:** replacement до preservation.  
**Рабочее решение:** доступный predecessor сохраняется до замены.  
**Проверка:** preservation опубликован, новый SHT не активировал legacy routes.  
**Lesson:** observable predecessor — актив проекта.  
**next_time_behavior:** вводить preservation barrier.  
**prohibited_repeat:** не заменять доступный экземпляр без snapshot/blocker.  
**Граница:** недоступный predecessor → emergency bootstrap.  
**Актуальность:** `reusable`.

### Mutable `main` и actual commit-at-read
**Задача:** принять SHT cold-start.  
**Контекст:** GitHub integrity.  
**Исходная модель:** prechecked commit мог остаться current.  
**Evidence:** SHT увидел `main` уже на новом commit, но доказал те же blobs/hashes.  
**Действие:** actual commit pinning + content comparison; затем KOO independent reread.  
**Неудачный путь:** доверять только `main` или старому prechecked commit.  
**Рабочее решение:** mutable ref → immutable version → composition/blob/hash.  
**Проверка:** file set, blob IDs и SHA-256 совпали.  
**Lesson:** `main` — адрес, не версия.  
**next_time_behavior:** фиксировать фактически прочитанную immutable version.  
**prohibited_repeat:** не писать «verified on main» без commit/version evidence.  
**Граница:** для другого storage использовать эквивалент version ID.  
**Актуальность:** `reusable`.

### Status drift после `SHT initiation_verified`
**Задача:** закрыть recovery-cycle SHT.  
**Контекст:** KOO registry/board/snapshot.  
**Исходная модель:** чатовый acceptance фактически был правильным.  
**Evidence:** внешний registry остался `SHT=externally_verified`, хотя KOO уже сообщил `upgraded`.  
**Действие:** после feedback OPR выполнен reread, drift подтверждён; KOO остановил профильную работу и пошёл на re-init.  
**Неудачный путь:** перейти дальше без authoritative state transaction.  
**Рабочее решение:** registry + board + snapshot + checksums/version + reread.  
**Проверка:** внешний registry подтвердил старый status.  
**Lesson:** phase barrier завершается external state, не текстом ответа.  
**next_time_behavior:** после acceptance синхронизировать authoritative artifacts прежде нового task.  
**prohibited_repeat:** не оставлять status только в разговорной модели.  
**Граница:** набор authoritative files зависит от Entity.  
**Актуальность:** `reusable`.

### Development-state вне чата
**Задача:** сохранить shared entity environment перед re-init KOO.  
**Контекст:** recovery/development.  
**Исходная модель:** registry/snapshot могут быть достаточно краткими.  
**Evidence:** архитектурная линия имела собственные inputs, decisions, open questions и next barrier.  
**Действие:** создан отдельный `KOO__shared-entity-environment__KOO.md`, включён в manifest/checksums.  
**Неудачный путь:** оставить причинную модель только в диалоге.  
**Рабочее решение:** long-lived development gets external state artifact.  
**Проверка:** файл включён в recovery dependencies.  
**Lesson:** сложная незавершённая разработка должна переживать чат отдельно.  
**next_time_behavior:** создавать development-state до re-init.  
**prohibited_repeat:** не рассчитывать на hidden/operational context.  
**Граница:** не плодить отдельный state для мелких задач.  
**Актуальность:** `reusable`.

### KOD self-report vs independent acceptance
**Задача:** принять assessment recovery KOD.  
**Evidence:** KOD дал locator/hashes/commits/blobs и корректно не присвоил себе `upgraded`.  
**Действие:** KOO сохранил `assessment_received_pending_independent_verification`.  
**Неудачный путь:** автоматически повысить status по self-report.  
**Рабочее решение:** producer self-check и consumer acceptance — разные фазы.  
**Проверка:** registry сохранил pending independent verification.  
**Lesson:** хороший self-report не заменяет acceptance barrier.  
**next_time_behavior:** отдельно fetch/verify locator/version/hash.  
**prohibited_repeat:** не присваивать migrated/upgraded по заявлению исполнителя.  
**Граница:** глубина проверки зависит от риска.  
**Актуальность:** `reusable`.

### Controlled self-reinit KOO
**Задача:** решить, продолжать ли работу после серии мелких сбоев.  
**Evidence:** внешний registry подтвердил реальный invariant violation с SHT status.  
**Действие:** preservation текущего KOO → recovery update → development-state → external verification → clean-start handoff.  
**Неудачный путь:** считать всё косметикой и продолжать.  
**Рабочее решение:** confirmed state desync является trigger для controlled replacement.  
**Проверка:** authoritative state перечитан.  
**Lesson:** re-init — механизм обслуживания, а не поражение.  
**next_time_behavior:** при повторном feedback сначала проверять внешний invariant.  
**prohibited_repeat:** не продолжать длинный управляющий цикл после confirmed drift.  
**Граница:** одиночный стилистический промах без state violation не требует re-init.  
**Актуальность:** `reusable`.

# 2. Плантация граблей

### Грабля: status только в ответе
- **Как проявилась:** SHT в чате `upgraded`, внешне `externally_verified`.
- **Причина:** пропущена атомарная acceptance transaction.
- **Как обнаружили:** feedback OPR + reread registry.
- **Что делали зря:** пошли дальше до внешней фиксации.
- **Правильный подход:** registry → board → snapshot → checksum/version → reread.
- **next_time_behavior:** не покидать barrier до authoritative check.
- **prohibited_repeat:** ответ в чате не считать state проекта.
- **Граница:** особенно recovery/approval/routing.
- **Evidence:** KOO registry v0.13.
- **candidate anti-regression test:** после `initiation_verified` новый KOO обязан сначала обновить внешний status.

### Грабля: clean-start раньше preservation
- **Как проявилась:** SHT replacement был подготовлен раньше snapshot predecessor.
- **Причина:** фокус на новой роли.
- **Как обнаружили:** вопрос OPR.
- **Правильный подход:** preservation-first.
- **next_time_behavior:** проверить availability predecessor.
- **prohibited_repeat:** replacement без snapshot/blocker.
- **Граница:** недоступный predecessor → emergency bootstrap.
- **Evidence:** SHT pre-reconfiguration snapshot.
- **candidate test:** живая старая Entity должна быть сохранена до replacement.

### Грабля: `main` принят за immutable version
- **Как проявилась:** prechecked и actual commit различались.
- **Причина:** ветка продвинулась.
- **Как обнаружили:** SHT actual commit pinning.
- **Правильный подход:** actual version + blob/hash comparison.
- **prohibited_repeat:** `verified on main` без commit.
- **Evidence:** SHT cold-start report.
- **candidate test:** harmless новый commit должен быть проверен по content identity.

### Грабля: publication=delivery
- **Как проявилась:** GitHub artifact доступен, но route semantics не закрыты.
- **Причина:** storage и coordination не были разведены.
- **Правильный подход:** publish/deliver/receive/accept отдельно.
- **prohibited_repeat:** существование файла не означает доставку.
- **Evidence:** KOD locator + KAN candidate.
- **candidate test:** файл без адресного action не должен стать delivered.

### Грабля: recollection=current
- **Как проявилась:** старый WEB daemon легко было принять за факт.
- **Причина:** подробность рассказа создаёт ложную уверенность.
- **Правильный подход:** `lead_to_verify`.
- **prohibited_repeat:** current architecture без evidence.
- **Evidence:** KOD negative search.
- **candidate test:** модель должна оставить unknown.

### Грабля: candidate→canon
- **Как проявилась:** рабочая технология может психологически стать «утверждённой».
- **Причина:** смешение operational proof и normative approval.
- **Правильный подход:** сохранять candidate status до explicit authority.
- **prohibited_repeat:** silent approval.
- **Evidence:** emergency-initiation candidate, KAN semantic candidate.
- **candidate test:** успешный пилот без OPR approval остаётся candidate.

### Грабля: development живёт только в чате
- **Как проявилась:** re-init угрожал потерей причинной модели shared environment.
- **Причина:** registry слишком краток.
- **Правильный подход:** отдельный external development-state в recovery dependencies.
- **prohibited_repeat:** полагаться на память нового чата.
- **Evidence:** `KOO__shared-entity-environment__KOO.md`.
- **candidate test:** новый KOO должен восстановить development без старой переписки.

### Грабля: self-report=acceptance
- **Как проявилась:** подробный профильный отчёт соблазняет сразу повысить status.
- **Причина:** producer/acceptor stages смешиваются.
- **Правильный подход:** independent fetch/verify.
- **prohibited_repeat:** status upgrade по self-report.
- **Evidence:** KOD assessment.
- **candidate test:** даже идеальный self-report остаётся pending acceptance.

# 3. Причинные решения

`WEB predecessor unreliable → reconstruction / wait / minimal bootstrap → chosen minimal verified bootstrap → reconstruction rejected → WEB initiation_verified → emergency procedure remains tested candidate`.

`SHT role undefined → reconstruct old role / define new role → chosen explicit operator-confirmed role + preservation → retrospective role fiction rejected → SHT cold-start verified → later normative harmonization pending`.

`Следопыт legacy_unmapped → separate Entity / discard / map to KOD → chosen legacy provenance predecessor KOD → evidence OPR + sledopyt-v01`.

`OPR as manual file transport → attachments only / publication only / file+coordination layers → chosen two-layer candidate → silent canon rewrite rejected → evidence KOD locator + KAN semantics → needs_decision`.

`new multi-entity infrastructure → API-first / semantics-first → chosen KAN→SHT→KOO→KOD → evidence usable semantic foundation`.

`KOO behavioural glitches → ignore / abrupt replacement / controlled re-init → chosen preservation+recovery update+external verification+cold-start → evidence confirmed SHT status drift`.

# 4. Reusable procedures

## Emergency Entity bootstrap
1. Подтвердить ненадёжность predecessor.
2. Подтвердить role/approved sources.
3. Minimal initiation/snapshot/manifest/checksums.
4. Unknown оставить unknown.
5. External publish.
6. Independent reread/version/hash.
7. Clean cold-start.
8. Затем read-only audit реальности.
**Stop:** нет роли; конфликт источников; locator непроверяем; нужны догадки.

## Role reconfiguration with preservation
1. Проверить role-source/current recovery.
2. Доступный predecessor → preservation snapshot.
3. Classify current/legacy/provenance/unfinished.
4. Explicit role decision.
5. Новый current recovery.
6. Provenance locator без auto-reactivation.
7. External verify.
8. Clean cold-start.

## Mutable-ref cold-start verification
1. Resolve actual commit/version.
2. Verify composition.
3. Verify checksums.
4. Verify immutable object IDs.
5. Compare with prechecked version if changed.
6. Record actual version-at-read.

## Acceptance status transaction
1. Получить evidence barrier.
2. Update registry.
3. Update board.
4. Update snapshot.
5. Update checksums/version.
6. External reread.
7. Только затем next task.

## Human recollection → evidence lead
1. Записать recollection.
2. `lead_to_verify`.
3. Определить evidence targets.
4. Read-only поиск.
5. Confirmed → current; остальное unknown.

## Development-state externalization
1. Определить long-lived development contour.
2. Создать отдельный external state file.
3. Purpose/inputs/decisions/status/open/next barrier.
4. Включить в recovery manifest/checksums.
5. Читать после core recovery.

# 5. Историческое незавершённое состояние

- `open`: organizational model shared entity environment; independent KOD recovery verification/cold-start; clean cold-start нового KOO.
- `parked`: копное право `parked_with_trigger`; WEB audit `deferred_nonurgent`; Obsidian graph pilot; финальное решение о GitHub как полном файловом поле.
- `blocked`: locator route-completion требует normative decision; часть autonomy/entity-instance вопросов требует OPR/KOO/KAN.
- `unknown`: WEB deployment daemon; иные KOD recovery вне проверенного locator; часть старых SHT routes; полнота ранней истории KOO; некоторые ранние decisions/artifacts; полный объём потерянного опыта старых экземпляров.
- `superseded`: `Следопыт legacy_unmapped` → `legacy provenance predecessor KOD`; `SHT externally_verified` после принятого cold-start → `SHT upgraded`.

# EXTRACTION_REPORT

- диапазон: поздний рабочий цикл KOO от WEB recovery через KOD/SHT, shared entity environment и подготовку собственного re-init;
- чат от начала: `not_verified`;
- ранняя история: частично/сжато;
- существенных эпизодов: `12`;
- граблей: `8`;
- причинных/архитектурных решений: `6`;
- reusable procedures: `6`;
- experience cards: `12`;
- anti-regression cases: `8`;
- существенных unknown: `6`;
- крупные направления: recovery v1.2, role reconfiguration, external verification, file field/routing, shared entity environment, preservation, state synchronization.

---
document_type: old-chat-experience-extraction
entity: KOO
status: historical_experience_layer
current_state_authority: no
project_time: generated_without_trusted_project_time
