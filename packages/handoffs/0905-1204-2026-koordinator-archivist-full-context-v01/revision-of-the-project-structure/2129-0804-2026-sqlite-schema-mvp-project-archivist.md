Стартовая SQLite-схема MVP системы «Архивариус проекта Благополучие»

Дата: 2026-04-08
Статус: рабочий проектный документ
Контур: пакет текущего чата, с последующим выделением канонических документов
Назначение: зафиксировать минимальную и практическую SQLite-схему для первой рабочей версии Архивариуса проекта Благополучие

1. Назначение схемы

Эта схема нужна для первой рабочей версии Архивариуса.

Её задача не в том, чтобы сразу выразить всю полноту будущей модели сущностей, а в том, чтобы дать:

устойчивую базу для индексирования;

хранение метаданных файлов;

базовый полнотекстовый поиск по содержимому;

учёт пакетов чатов;

базовую диагностику и статистику.


Главный принцип схемы MVP:

лучше простая и работающая схема сегодня, чем великая схема вселенной, которая так и не дошла до первого запуска.

2. Общая логика схемы

На старте схема строится вокруг трёх основных объектов:

файл;

пакет чата;

настройка/служебная информация.


Файл является главным объектом поиска.
Пакет чата даёт файловому объекту контекст происхождения.
Служебные таблицы обеспечивают управляемость базы.

На этапе MVP допустимо не выделять в отдельные таблицы:

темы;

статусы;

сложные связи версий;

решения ревизии;

публикации;

теги.


Для них достаточно подготовить место для дальнейшего расширения.

3. Минимальный состав таблиц

На старте рекомендуется использовать следующие таблицы:

1. files


2. chat_packages


3. settings


4. index_runs


5. files_fts для полнотекстового поиска, если используется SQLite FTS5



Это уже даёт рабочее ядро.

4. Таблица files

Назначение

Хранит сведения о каждом проиндексированном файле.

Поля

id INTEGER PRIMARY KEY

full_path TEXT NOT NULL UNIQUE

relative_path TEXT

name TEXT NOT NULL

extension TEXT

size_bytes INTEGER

modified_at TEXT

indexed_at TEXT NOT NULL

hash_sha256 TEXT

text_excerpt TEXT

full_text TEXT

text_available INTEGER NOT NULL DEFAULT 0

project_contour TEXT

chat_package_path TEXT

is_chat_readme INTEGER NOT NULL DEFAULT 0

is_copy_map INTEGER NOT NULL DEFAULT 0

is_chat_card INTEGER NOT NULL DEFAULT 0

scan_state TEXT NOT NULL DEFAULT 'ok'

error_note TEXT


Пояснения

full_path должен быть уникальным, чтобы не плодить дубликаты записей по одному и тому же физическому файлу.

relative_path нужен для более удобного отображения внутри корня проекта.

text_excerpt хранит короткий фрагмент для выдачи результатов поиска.

full_text на этапе MVP допустимо хранить прямо в этой таблице, если объём базы остаётся разумным.

text_available нужен для быстрого понимания, извлекался ли текст вообще.

project_contour хранится строкой на старте ради простоты.

chat_package_path хранится строкой, чтобы не тащить сложные связи прежде времени.

scan_state может принимать значения:

ok

read_error

skipped_binary

too_large

unsupported


error_note хранит краткое пояснение, если файл не удалось обработать нормально.


5. Таблица chat_packages

Назначение

Хранит сведения о каталогах, распознанных как пакеты чатов.

Поля

id INTEGER PRIMARY KEY

package_path TEXT NOT NULL UNIQUE

package_name TEXT NOT NULL

readme_file_path TEXT

copy_map_file_path TEXT

chat_card_file_path TEXT

last_indexed_at TEXT NOT NULL

file_count INTEGER NOT NULL DEFAULT 0

note TEXT


Пояснения

package_path должен быть уникальным.

package_name обычно равен последнему сегменту пути каталога.

readme_file_path, copy_map_file_path, chat_card_file_path нужны для быстрой навигации по пакету.

file_count помогает видеть наполненность пакета без дополнительных запросов.

note оставляет место для будущих ручных комментариев.


6. Таблица settings

Назначение

Хранит служебные параметры базы и индексатора.

Поля

key TEXT PRIMARY KEY

value TEXT NOT NULL


Примеры значений

schema_version

database_created_at

last_index_started_at

last_index_finished_at

indexed_roots

fts_enabled


Эта таблица примитивна, но для MVP вполне достаточна.

7. Таблица index_runs

Назначение

Хранит сведения о запусках индексации.

Поля

id INTEGER PRIMARY KEY

started_at TEXT NOT NULL

finished_at TEXT

status TEXT NOT NULL

files_seen INTEGER NOT NULL DEFAULT 0

files_indexed INTEGER NOT NULL DEFAULT 0

files_updated INTEGER NOT NULL DEFAULT 0

files_failed INTEGER NOT NULL DEFAULT 0

chat_packages_found INTEGER NOT NULL DEFAULT 0

note TEXT


Возможные значения status

running

completed

failed

partial


Пояснения

Эта таблица не обязательна для самого первого чернового прототипа, но очень полезна даже в MVP, потому что позволяет понимать:

когда шла индексация;

сколько файлов реально обработано;

были ли ошибки;

завершился ли запуск нормально.


8. Полнотекстовый поиск: files_fts

Если используется SQLite FTS5, рекомендуется создать отдельную виртуальную таблицу:

files_fts


Назначение

Хранит полнотекстовый индекс по содержимому файлов и части метаданных.

Поля

full_path

name

relative_path

full_text

text_excerpt


Пояснение

Эта таблица не обязательно должна быть основной таблицей хранения. Её лучше использовать как отдельный поисковый слой, синхронизируемый с таблицей files.

На старте допустимы два варианта:

Вариант А. Самый простой

Искать по LIKE внутри files.full_text

Плюсы:

проще реализовать;

меньше возни на старте.


Минусы:

медленнее;

хуже качество поиска на больших объёмах.


Вариант Б. Сразу использовать FTS5

Плюсы:

быстрее поиск;

нормальная основа для роста.


Минусы:

чуть сложнее логика индексации.


Для MVP допустимы оба варианта, но если есть силы сделать аккуратно, лучше брать FTS5.

9. Рекомендуемые индексы

Для нормальной работы схемы полезно создать следующие индексы:

Для таблицы files

индекс по name

индекс по extension

индекс по project_contour

индекс по chat_package_path

индекс по modified_at

индекс по hash_sha256


Для таблицы chat_packages

индекс по package_name


Для таблицы index_runs

индекс по started_at

индекс по status


Это ускорит типовые запросы и не усложнит схему чрезмерно.

10. SQL-черновик создания таблиц

Ниже приведён рабочий черновик SQL для MVP.

CREATE TABLE IF NOT EXISTS files (
    id INTEGER PRIMARY KEY,
    full_path TEXT NOT NULL UNIQUE,
    relative_path TEXT,
    name TEXT NOT NULL,
    extension TEXT,
    size_bytes INTEGER,
    modified_at TEXT,
    indexed_at TEXT NOT NULL,
    hash_sha256 TEXT,
    text_excerpt TEXT,
    full_text TEXT,
    text_available INTEGER NOT NULL DEFAULT 0,
    project_contour TEXT,
    chat_package_path TEXT,
    is_chat_readme INTEGER NOT NULL DEFAULT 0,
    is_copy_map INTEGER NOT NULL DEFAULT 0,
    is_chat_card INTEGER NOT NULL DEFAULT 0,
    scan_state TEXT NOT NULL DEFAULT 'ok',
    error_note TEXT
);

CREATE TABLE IF NOT EXISTS chat_packages (
    id INTEGER PRIMARY KEY,
    package_path TEXT NOT NULL UNIQUE,
    package_name TEXT NOT NULL,
    readme_file_path TEXT,
    copy_map_file_path TEXT,
    chat_card_file_path TEXT,
    last_indexed_at TEXT NOT NULL,
    file_count INTEGER NOT NULL DEFAULT 0,
    note TEXT
);

CREATE TABLE IF NOT EXISTS settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS index_runs (
    id INTEGER PRIMARY KEY,
    started_at TEXT NOT NULL,
    finished_at TEXT,
    status TEXT NOT NULL,
    files_seen INTEGER NOT NULL DEFAULT 0,
    files_indexed INTEGER NOT NULL DEFAULT 0,
    files_updated INTEGER NOT NULL DEFAULT 0,
    files_failed INTEGER NOT NULL DEFAULT 0,
    chat_packages_found INTEGER NOT NULL DEFAULT 0,
    note TEXT
);

CREATE INDEX IF NOT EXISTS idx_files_name
    ON files(name);

CREATE INDEX IF NOT EXISTS idx_files_extension
    ON files(extension);

CREATE INDEX IF NOT EXISTS idx_files_project_contour
    ON files(project_contour);

CREATE INDEX IF NOT EXISTS idx_files_chat_package_path
    ON files(chat_package_path);

CREATE INDEX IF NOT EXISTS idx_files_modified_at
    ON files(modified_at);

CREATE INDEX IF NOT EXISTS idx_files_hash_sha256
    ON files(hash_sha256);

CREATE INDEX IF NOT EXISTS idx_chat_packages_name
    ON chat_packages(package_name);

CREATE INDEX IF NOT EXISTS idx_index_runs_started_at
    ON index_runs(started_at);

CREATE INDEX IF NOT EXISTS idx_index_runs_status
    ON index_runs(status);

11. SQL-черновик для FTS5

Если решено использовать FTS5, можно добавить такую виртуальную таблицу:

CREATE VIRTUAL TABLE IF NOT EXISTS files_fts
USING fts5(
    full_path,
    name,
    relative_path,
    full_text,
    text_excerpt
);

Примечание

На старте можно не усложнять схему триггерами.
Допустимо просто при индексации:

очищать files_fts;

заново наполнять её из files для текстовых файлов.


Да, это не верх инженерного изящества, но для MVP вполне годится.

12. Минимальная логика обновления данных

При индексации рекомендуется такая последовательность:

1. Запустить запись в index_runs со статусом running.


2. Обойти файловые корни.


3. Для каждого файла:

собрать метаданные;

определить, изменился ли файл;

обновить или вставить запись в files.



4. Обнаружить пакеты чатов и обновить chat_packages.


5. При включённом FTS обновить files_fts.


6. Обновить запись в index_runs, выставив:

время завершения;

итоговый статус;

числа обработанных файлов.




13. Минимальные правила хранения времени

Для простоты и переносимости рекомендуется хранить даты и время в виде текста в ISO-формате.

Например:

2026-04-08T21:29:00


Это упростит:

отладку;

чтение базы;

сравнение значений;

перенос между окружениями.


Не надо на старте устраивать ритуалы с избыточной временной магией.

14. Минимальные запросы, которые должна поддерживать схема

Схема MVP должна позволять выполнять как минимум такие запросы:

Поиск по имени файла

Найти все файлы, где name содержит строку.

Поиск по содержимому

Найти все файлы, где full_text или files_fts соответствует запросу.

Показ карточки файла

Получить полную запись по id.

Показ файлов определённого контура

Например, все файлы из 09_ADMIN.

Показ файлов конкретного пакета чата

Найти все записи по chat_package_path.

Показ статистики

Получить:

общее число файлов;

число текстовых файлов;

число пакетов чатов;

число ошибок обработки.


15. Что сознательно упрощено в этой схеме

На текущем этапе сознательно упрощены:

связь файла с пакетом чата через путь, а не через полноценный внешний ключ;

отсутствие отдельных таблиц statuses, topics, project_contours;

отсутствие таблицы решений ревизии;

отсутствие таблицы канонических связей;

отсутствие таблицы публикаций и медиаконтурных объектов;

отсутствие нормализации всех справочников.


Это сделано не из лени, а ради запуска рабочего ядра.

16. Что можно расширить следующим шагом

После первого рабочего запуска наиболее естественно расширять схему так:

1. добавить таблицу project_contours


2. добавить таблицу statuses


3. добавить таблицу topics


4. добавить таблицу связи file_topics


5. добавить таблицу revision_decisions


6. добавить таблицу canonical_relations


7. добавить таблицу publications



Но всё это уже должно делаться после того, как Архивариус начал реально искать файлы, а не раньше.

17. Практический компромисс по full_text

Поле full_text в files удобно на старте, но со временем может распухнуть база.

Поэтому рекомендуется такая стратегия:

Для MVP

Хранить full_text прямо в files.

Для следующего этапа

При росте объёма можно:

вынести полнотекстовые данные в отдельную таблицу;

перейти полностью на FTS-слой;

ограничивать индексируемый объём слишком больших файлов.


Это нормальная эволюция, а не архитектурный грех.

18. Минимальная совместимость с логикой пакетов чатов

Чтобы схема лучше работала с твоей методикой, важно учитывать такие признаки:

is_chat_readme

is_copy_map

is_chat_card

chat_package_path


Этого уже достаточно, чтобы:

видеть пакет как сущность;

находить его ключевые служебные файлы;

связывать остальные файлы с происхождением из конкретного чата.


19. Критерий пригодности схемы

Стартовую SQLite-схему можно считать пригодной для MVP, если она позволяет:

индексировать реальные файлы без лишней бюрократии;

быстро находить материалы по имени и тексту;

видеть полный путь файла;

различать контуры проекта;

различать принадлежность к пакету чата;

понимать, когда и как проходила индексация.


Если этого не получается, схема слишком усложнена или слишком слаба.

20. Итог

Настоящий документ фиксирует стартовую SQLite-схему MVP системы Архивариус проекта Благополучие.

Эта схема должна стать базой для:

первого индексатора;

первого CLI-поиска;

базовой диагностики;

дальнейшего роста модели данных.