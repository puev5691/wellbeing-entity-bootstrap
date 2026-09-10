# KOO experience extraction

## Роль и граница

Entity: **KOO / КООРДИНАТОР**. Роль подтверждается видимым текущим диалогом и проверенным в нём GitHub initiation KOO.

Доступен только видимый текущему экземпляру фрагмент этого чата: recovery-канон и исправление структуры KOO, Parked по копному праву, превентивная инициация/recovery, текущее extraction-задание. **Чат от начала не подтверждён.** Выпавшие при перезагрузках участки и более ранняя история неизвестны и не реконструируются из памяти других чатов.

## Существенные эпизоды

### Безличный recovery
**Evidence:** ОПЕРАТОР долго искал snapshot и initiation KOO. Проверка показала дефект `packages/handoffs/current-chat-recovery`: владелец состояния не читался из пути, предмет работы смешивался с идентичностью Сущности.
**Рабочее решение:** постоянное состояние перенесено в `entities/koo/initiation/` и `entities/koo/recovery/YYYY-MM-DD/`; legacy оставлен указателем.
**Lesson / next_time_behavior:** перед записью recovery определить owner, artifact role, storage и проверяемое date basis.
**prohibited_repeat:** не создавать новые безличные `current-chat-recovery`.
**Актуальность:** reusable.

### Parked: копное право
**Evidence:** карточка задала `research / parked_with_trigger`, запрет продолжения и следующий результат `claims-map.md`.
**Рабочее решение:** создана `entities/koo/boards/KOO__parked-research__KOO.md`; большой обзор не включён в активный слой.
**Lesson / next_time_behavior:** при парковке фиксировать status, triggers, mother-source и next artifact.
**prohibited_repeat:** не активировать parked-тему без триггера.
**Актуальность:** reusable.

### Превентивный recovery
**Evidence:** ОПЕРАТОР заметил странные перезагрузки ленты и запросил инициацию.
**Рабочее решение:** подготовлены initiation, snapshot, MANIFEST; внешние KOO initiation/snapshot обновлены. Первая локальная попытка после reset не была засчитана, повтор выполнен до успешного результата.
**Lesson / next_time_behavior:** при признаках нестабильности сохранять состояние до отказа и проверять каждый side effect.
**prohibited_repeat:** не считать файл созданным после tool failure; не ждать полной смерти чата.
**Актуальность:** reusable.

### Historical ≠ current
**Evidence:** исторический MVP АРХИВАРИУСА подтверждает прошлое состояние, но не текущий runtime.
**Рабочее решение:** в KOO initiation/snapshot явно перечислено, что старое ПО, пути и ПОЧТАЛЬОН требуют current-check.
**Lesson / next_time_behavior:** всегда маркировать freshness и отделять historical evidence от current truth.
**prohibited_repeat:** не выводить текущее состояние из старого successful log/snapshot.
**Актуальность:** reusable.

## Плантация граблей

### Грабля: безличный recovery
- **Как проявилась:** файлы KOO пришлось долго искать.
- **Причина:** owner отсутствовал в структуре пути.
- **Как обнаружили:** feedback ОПЕРАТОРА + проверка GitHub.
- **Правильный подход:** entity-owned storage.
- **candidate anti-regression test:** snapshot KOO о ARH должен остаться в KOO.

### Грабля: side effect после tool failure
- **Как проявилась:** reset прямо запретил считать файлы созданными.
- **Причина:** внутренняя причина сбоя unknown.
- **Правильный подход:** повтор/verification.
- **prohibited_repeat:** ссылаться на неподтверждённый файл.

### Грабля: historical = current
- **Как проявилась:** старый MVP мог быть ошибочно принят за текущий runtime.
- **Причина:** смешение временных слоёв.
- **Правильный подход:** historical milestone + current unknown.
- **prohibited_repeat:** выводить current из старого successful log.

## Причинные решения

`трудно найти состояние → общий каталог / entity-owned → выбран entity-owned → rejected безличный current-chat-recovery → evidence: feedback + GitHub → legacy оставлен указателем`

`сохранить исследование без active-load → active / delete / parked → выбран parked-card → evidence: research-card → next result claims-map.md`

`нестабильность чата → ждать отказа / сохранить сейчас → выбран preventive recovery → evidence: feedback + успешные записи → instability не объявляется диагнозом`

## Reusable procedures

### Entity-owned recovery
1. Определить owner.
2. Определить artifact role.
3. Зафиксировать проверяемое date basis.
4. Записать initiation/snapshot/manifest в entity-owned path.
5. Проверить внешнюю запись.
**Stop:** owner/date basis неизвестны.

### Park research
1. Проверить решение о парковке.
2. Записать status и все triggers.
3. Записать mother-source и next artifact.
4. Убрать большой обзор из active-layer.
**Stop:** нет подтверждённого return condition.

### Preventive chat recovery
1. Принять instability как trigger фиксации, не диагноз.
2. Обновить initiation, snapshot, manifest.
3. Сохранить внешне.
4. Проверить side effects.
5. Зафиксировать один безопасный next step.
**Stop:** запись не подтверждена.

## Историческое незавершённое состояние

**open:** унификация минимального snapshot/manifest; будущая проверка программного АРХИВАРИУСА/ПОЧТАЛЬОНА; сравнение «Меры» после второго независимого варианта.

**parked:** копное право, только по trigger; next `claims-map.md`.

**blocked:** в видимом диапазоне не подтверждено.

**unknown:** полнота истории чата; причина перезагрузок; current runtime старого ПО; окончательный общий recovery-формат.

**superseded:** новые безличные recovery-пакеты заменены entity-owned storage.

## EXTRACTION_REPORT

Просмотрен только доступный текущему экземпляру фрагмент этого чата. Начало чата не подтверждено. Недоступные/выпавшие участки неизвестны.

Эпизодов: 4. Граблей: 3. Причинных решений: 3. Reusable procedures: 3. Experience cards: 4. Anti-regression cases: 4. Явных крупных unknown: 4.

Крупные направления: recovery Сущностей; идентичность файлов; Parked research; historical-vs-current. За пределами extraction могли остаться ранние эпизоды текущего чата.