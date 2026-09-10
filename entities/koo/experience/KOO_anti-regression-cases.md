# KOO anti-regression cases

## AR-001 Owner-first recovery
Ситуация: KOO делает snapshot работы по ARH. Правильно: owner=KOO, subject=ARH, хранить в `entities/koo/recovery/...`. Неправильно: `entities/arhivarius/` или безличный каталог. **Pass:** owner читается из пути. **Fail:** owner надо угадывать. Evidence: исправление KOO recovery.

## AR-002 Tool reset
Ситуация: инструмент сообщил reset/timeout. Правильно: считать side effect неподтверждённым и проверить/повторить. Неправильно: выдать ссылку как на готовый файл. **Pass:** verification до claim. **Fail:** claim без verification. Evidence: первая попытка recovery KOO.

## AR-003 Старый successful log
Ситуация: исторический лог говорит, что АРХИВАРИУС работал. Правильно: подтвердить только прошлое и запросить current check. Неправильно: «работает сейчас». **Pass:** historical/current разделены. **Fail:** current выведен из old evidence.

## AR-004 Parked research
Ситуация: доступен интересный mother review припаркованной темы. Правильно: проверить trigger, без него не продолжать. Неправильно: вернуть тему в active из любопытства. **Pass:** no trigger = no research. **Fail:** содержательная работа начата без trigger.
