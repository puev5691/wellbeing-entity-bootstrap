# СИСАДМИН: snapshot текущего состояния

## Назначение

Фиксирует проверенное состояние для recovery v1.2. Это не live-мониторинг: перед любым production-действием повторить проверки.

## Recovery assessment

Задача КООРДИНАТОРА: провести assessment SIS, найти существующие recovery/initiation/snapshot, затем мигрировать либо создать current recovery v1.2, либо вернуть blocker.

Проверки GitHub до публикации:

- `entities/sis` — `404 Not Found`;
- четыре ожидаемых файла в `entities/sis/recovery/current/` — `404 Not Found`;
- поиск `SIS__`, `sisadmin`, `entities/sis` в `puev5691/wellbeing-entity-bootstrap` — current SIS recovery не найден;
- поиск `СИСАДМИН` нашёл KOO registry/board/snapshot, где SIS указан следующим циклом, а current recovery SIS не подтверждён.

Вывод: конфликтующий current recovery SIS в проверенном GitHub-контуре не выявлен; создан current recovery candidate v1.2.

## Роль и режим

СИСАДМИН отвечает за серверы, сеть, шлюзы, туннели, firewall, deploy, health-check, systemd, мониторинг и проверяемые отчёты выполнения. Production без подтверждения не менять.

ОПЕРАТОР усилил режим: не выдумывать, не угождать, не делать удобные неподтверждённые выводы; работать по проверяемым результатам и вести журнал при необходимости.

## Узлы

    RU2498454 = erefia = Эрэфия
    RU2497199 = burzh  = Буржуиния
    p552203   = mazhor = Мажор

## Проверенное по burzh

- host: `ruvds-xnqc6`
- IP: `185.39.19.240`
- OS: Ubuntu 24.04.4 LTS
- listening: `80/tcp` nginx, `2222/tcp` ssh.socket, `443/tcp` xray, `10085/tcp` xray
- UFW active, default incoming deny, outgoing allow; разрешены `2222/tcp`, `443/tcp`, `443/udp`, `80/tcp`, `30000/tcp`, `8780/tcp`, `14443/tcp`, `39743/udp` и IPv6-аналоги
- Windows ОПЕРАТОРА → `burzh:2222` OK, SSH banner получен
- `burzh` → `erefia:443/2222/80` OK; `burzh` → `erefia:21` fail

## Проверенное по erefia

- host: `ruvds-ygo0w`
- IP: `194.87.107.135`
- OS: Ubuntu 24.04.4 LTS
- listening: `2222/tcp` ssh.socket, `80/tcp` nginx, `443/tcp` xray, `10085/tcp` xray
- Windows ОПЕРАТОРА → `erefia:21/2222/443` timeout
- `erefia` → `burzh:2222/443` fail
- `xray.service` active, Xray `26.6.1`
- Xray outbound использовал `burzhuiniya-ssh-socks-out` → `127.0.0.1:1081`
- `wb-errefiya-to-burzhuiniya-socks.service` числился active/running, но `127.0.0.1:1081` не слушал; curl к SOCKS вернул `Couldn't connect to server`
- журнал tunnel unit показывал `ssh: connect to host 185.39.19.240 port 2222: Connection timed out`

## Проверенное по mazhor

- host: `p552203.kvmvps`
- IP: `130.49.174.162`
- OS: Ubuntu 24.04.4 LTS
- kernel: `6.8.0-137-generic`
- listening: `22/tcp` ssh.socket
- не обнаружены listening `80/tcp`, `443/tcp`, `2222/tcp`, nginx, xray
- UFW active, default incoming deny, outgoing allow; разрешены `22/tcp`, `30000/tcp`, `8780/tcp`, `8781/tcp` и IPv6-аналоги
- `mazhor` → `burzh:2222/443` fail
- `mazhor` → `erefia:2222/443` OK
- во время подтверждённого окна tcpdump на burzh попытки `mazhor → burzh:2222/443` не были видны на burzh

## Недействительный тест

Проверка `erefia → burzh` через tcpdump признана недействительной: команды были выполнены на `mazhor`, а отправка началась после завершения наблюдения. Итоговый tcpdump-факт для `erefia → burzh` не получен.

## DNS

Домен проекта: `wbnetrus.ru`. Приняты нейтральные имена `burzh.wbnetrus.ru`, `erefia.wbnetrus.ru`; фактические DNS-записи не проверены.

## Другие завершённые направления текущего SIS-чата

В текущем чате были созданы/разобраны пакеты: local AI healthcheck/smoke/diagnostic, VPN/Xray диагностика, Ubuntu Russian CA audit, domain OSINT и Wayback/local library для `inbelousov.ru`. Они являются evidence, но не входят в recovery current целиком.

## Pending

- свежая проверка DNS `wbnetrus.ru` и нейтральных имён;
- корректная проверка `erefia → burzh`;
- решение по `mazhor` как возможной новой точке после отдельного плана;
- восстановление/замена внутреннего SOCKS `127.0.0.1:1081` только после подтверждения задачи.

## Безопасный следующий шаг

Новый SIS после cold-start фиксирует статус проверки и не меняет production до отдельной команды ОПЕРАТОРА или КООРДИНАТОРА.

---
document_type: snapshot
entity: SIS
status: current_candidate_published_for_verification
recovery_canon: v1.2
project_time: generated_without_trusted_project_time
