Черновик Python-каркаса системы «Архивариус проекта Благополучие»

Дата: 2026-04-08
Статус: рабочий проектный документ
Контур: пакет текущего чата, с последующим выделением канонических документов
Назначение: зафиксировать стартовый каркас Python-кода Архивариуса, первые имена классов, функций, модулей и CLI-команд для практического начала реализации MVP

1. Назначение документа

Этот документ нужен для перехода от проектных рассуждений к реальной реализации.

Предыдущие документы уже зафиксировали:

зачем нужен Архивариус;

какие сущности он должен различать;

что входит в MVP;

как устроен репозиторий;

какой будет стартовая SQLite-схема.


Теперь нужно зафиксировать следующий шаг: какие именно Python-модули, классы и функции разумно создать первыми, чтобы не начать писать код хаотично.

Главная задача: дать рабочий стартовый каркас, по которому можно начать писать MVP без лишнего героизма и без расползания логики во все стороны.

2. Главный принцип стартового каркаса

На старте Архивариус не должен быть “сложной платформой”.

Он должен быть:

набором понятных модулей;

с простыми связями;

с предсказуемым запуском;

с минимальной магией;

с возможностью постепенно наращивать функциональность.


Короткая формула:

сначала рабочий индексатор и поиск, потом всё остальное.

3. Минимальный сценарий запуска MVP

Пользователь должен иметь возможность выполнить такие шаги:

1. Инициализировать базу.


2. Запустить индексацию.


3. Выполнить поиск по имени.


4. Выполнить поиск по тексту.


5. Посмотреть карточку файла.


6. Посмотреть статистику.


7. При желании посмотреть карточку пакета чата.



Именно этот сценарий и должен определять стартовый каркас кода.

4. Верхнеуровневый вход в приложение

Стартовая точка запуска:

archivist.py

Его задача:

принять аргументы командной строки;

передать выполнение в src/archivist/cli.py.


Минимальный черновик идеи

archivist.py должен содержать только тонкую обёртку:

импорт main из archivist.cli

вызов main()


То есть без логики индексирования и без SQL внутри.

5. Модуль cli.py

Назначение

Главный вход в пользовательский CLI.

Что должен делать

разбирать аргументы;

регистрировать подкоманды;

загружать конфиг;

вызывать нужные функции приложений;

печатать результат в понятном виде.


Предлагаемая функция

main() -> int


Вспомогательные функции

build_parser() -> argparse.ArgumentParser

cmd_init_db(args) -> int

cmd_index(args) -> int

cmd_reindex(args) -> int

cmd_search_name(args) -> int

cmd_search_text(args) -> int

cmd_show_file(args) -> int

cmd_show_chat_package(args) -> int

cmd_stats(args) -> int


Рекомендуемые команды

init-db

index

reindex

search-name

search-text

show-file

show-chat-package

stats


6. Модуль config.py

Назначение

Загрузка и проверка конфигурации.

Предлагаемая структура данных

На старте удобно использовать dataclass.

Класс

AppConfig


Предлагаемые поля

database_path: str

roots: list[str]

exclude_dirs: list[str]

text_extensions: list[str]

max_text_file_size_bytes: int

log_level: str

fts_enabled: bool


Основные функции

load_config(config_path: str | None = None) -> AppConfig

load_default_config() -> AppConfig

validate_config(config: AppConfig) -> None

resolve_paths(config: AppConfig) -> AppConfig


Практический смысл

Конфиг должен быть отдельным слоем, чтобы не размазывать пути и настройки по всему проекту.

7. Модуль constants.py

Назначение

Хранит простые константы проекта.

Что там должно быть

список стандартных текстовых расширений;

имена файлов:

README-chat-folder.md

.wb-copy-map.tsv

chat-card.md


список дефолтных контуров;

значения scan_state;

дефолтный размер фрагмента текста.


Примеры констант

DEFAULT_TEXT_EXTENSIONS

CHAT_README_FILENAME

COPY_MAP_FILENAME

CHAT_CARD_FILENAME

DEFAULT_EXCERPT_LENGTH

SCAN_STATE_OK

SCAN_STATE_READ_ERROR


8. Модуль models.py

Назначение

Содержит простые типизированные структуры данных приложения.

На старте не надо лезть в ORM. Достаточно dataclass.

Рекомендуемые dataclass-модели

FileRecord

Поля:

full_path

relative_path

name

extension

size_bytes

modified_at

indexed_at

hash_sha256

text_excerpt

full_text

text_available

project_contour

chat_package_path

is_chat_readme

is_copy_map

is_chat_card

scan_state

error_note


ChatPackageRecord

Поля:

package_path

package_name

readme_file_path

copy_map_file_path

chat_card_file_path

last_indexed_at

file_count

note


IndexRunRecord

Поля:

started_at

finished_at

status

files_seen

files_indexed

files_updated

files_failed

chat_packages_found

note


SearchResult

Поля:

file_id

name

full_path

project_contour

chat_package_path

snippet

score


9. Модуль utils.py

Назначение

Общие небольшие вспомогательные функции.

Что сюда можно положить

безопасную нормализацию строк;

форматирование размеров;

получение текущего времени в ISO;

вычисление относительного пути;

обрезку текста;

защиту от None.


Что сюда не надо тащить

SQL-запросы;

CLI-логику;

обход дерева;

сложную бизнес-логику.


Иначе utils.py превращается в чулан, где валяется всё подряд.

10. Модуль logging_setup.py

Назначение

Настройка логирования.

Основная функция

setup_logging(level: str = "INFO") -> logging.Logger


Практическая цель

Чтобы любой модуль мог получить предсказуемый логгер и не городить свои маленькие религии логирования по углам проекта.

11. Модуль scanner.py

Назначение

Обход файловой системы и сбор базовых метаданных по файлам.

Основная идея

Этот модуль не должен читать содержимое глубоко и не должен писать в базу напрямую. Его задача:

пройтись по каталогам;

отфильтровать нужные файлы;

вернуть метаданные.


Основные функции

iter_files(roots: list[str], exclude_dirs: list[str]) -> Iterator[pathlib.Path]

build_file_record(path: pathlib.Path, project_root: str | None = None) -> FileRecord

detect_project_contour(path: pathlib.Path) -> str | None

should_skip_path(path: pathlib.Path, exclude_dirs: list[str]) -> bool

detect_file_flags(path: pathlib.Path) -> dict[str, bool]


Практические задачи

корректно переживать длинные пути;

не падать на странных именах;

не лезть в исключённые каталоги;

определять специальные файлы пакета чата.


12. Модуль text_extract.py

Назначение

Извлечение текста из поддерживаемых файлов.

Главный принцип

Максимально просто и устойчиво.

Основные функции

is_text_extension(extension: str, allowed_extensions: list[str]) -> bool

read_text_file(path: pathlib.Path, max_size_bytes: int) -> tuple[bool, str | None, str | None, str | None]

make_excerpt(text: str, max_length: int = 400) -> str

normalize_text(text: str) -> str


Возвращаемые значения

Функция чтения должна уметь честно сообщать:

удалось ли прочитать;

полный текст;

фрагмент;

ошибку или состояние.


Типовые scan_state

ok

too_large

unsupported

read_error

skipped_binary


13. Модуль db.py

Назначение

Работа с SQLite.

Основной принцип

Один модуль отвечает за:

подключение;

создание схемы;

вставку;

обновление;

простые выборки.


Ключевой класс

Database


Предлагаемые методы

connect() -> sqlite3.Connection

init_schema() -> None

upsert_file(record: FileRecord) -> int

upsert_chat_package(record: ChatPackageRecord) -> int

start_index_run() -> int

finish_index_run(run_id: int, ...) -> None

search_files_by_name(query: str, limit: int = 50) -> list[SearchResult]

search_files_by_text(query: str, limit: int = 50) -> list[SearchResult]

get_file_by_id(file_id: int) -> dict | None

get_chat_package_by_id(package_id: int) -> dict | None

get_stats() -> dict


Дополнительные методы

rebuild_fts() -> None

clear_missing_files() -> None

count_files_in_chat_package(package_path: str) -> int


14. Модуль chat_packages.py

Назначение

Распознавание и описание пакетов чатов.

Главная роль

Сделать Архивариуса понимающим твою систему работы, а не просто умеющим искать по markdown.

Основные функции

is_chat_package_dir(path: pathlib.Path) -> bool

find_chat_package_root(path: pathlib.Path) -> pathlib.Path | None

scan_chat_package(package_dir: pathlib.Path) -> ChatPackageRecord

detect_chat_support_files(package_dir: pathlib.Path) -> dict[str, str | None]

assign_chat_package_path(file_path: pathlib.Path) -> str | None


Простая эвристика MVP

Каталог внутри 00_INBOX считается пакетом чата, если в нём найден:

README-chat-folder.md или

.wb-copy-map.tsv


Позже можно усложнять. Сейчас незачем.

15. Модуль indexer.py

Назначение

Оркестратор процесса индексации.

Это сердце MVP

Именно здесь соединяются:

конфиг;

scanner;

text_extract;

db;

chat_packages.


Ключевой класс

Indexer


Поля класса

config

db

logger


Основные методы

run_full_index() -> dict

run_reindex() -> dict

_index_single_file(path: pathlib.Path) -> None

_build_file_record(path: pathlib.Path) -> FileRecord

_collect_chat_packages() -> list[ChatPackageRecord]

_refresh_chat_package_counts() -> None

_finalize_fts() -> None


Практический смысл

Indexer должен быть одним понятным местом, откуда видно, как проходит индексация от начала до конца.

16. Модуль search.py

Назначение

Отдельный слой поисковой логики.

Основные функции или класс

Либо функции, либо маленький класс SearchService.

Предпочтительно:

SearchService


Методы

search_name(query: str, limit: int = 50) -> list[SearchResult]

search_text(query: str, limit: int = 50) -> list[SearchResult]

show_file(file_id: int) -> dict | None

show_chat_package(package_id: int) -> dict | None

stats() -> dict


Почему это полезно

Поиск и база тесно связаны, но всё же лучше отделить уровень “что искать” от уровня “как именно стучаться в SQLite”.

17. Модуль presenters.py

Назначение

Оформляет результаты для CLI.

Основные функции

format_search_results(results: list[SearchResult]) -> str

format_file_card(file_data: dict) -> str

format_chat_package_card(package_data: dict) -> str

format_stats(stats: dict) -> str

format_index_summary(summary: dict) -> str


Практический смысл

Если потом появится web GUI, бизнес-логика не будет спутана с тем, как именно печатать вывод в терминал.

18. Модуль stats.py

Назначение

Сводные операции и статистика.

На старте можно упростить

Если модуль кажется лишним, статистику временно можно держать в db.py и presenters.py.

Но если хочется чистоты, то разумно вынести:

агрегации;

вычисление числа файлов по контурам;

число текстовых файлов;

число пакетов;

число проблемных записей.


Возможный класс

StatsService


19. Черновик CLI-команд и ожидаемого поведения

Команда init-db

Создаёт базу и схему.

Ожидаемый результат:

база создана;

схема создана;

пользователь видит путь к базе.


Команда index

Полная индексация.

Ожидаемый результат:

обход заданных корней;

запись файлов;

фиксация index run;

отображение краткой сводки.


Команда reindex

Повторная индексация с обновлением.

Ожидаемый результат:

обновляются изменившиеся файлы;

пересобирается FTS при необходимости.


Команда search-name "строка"

Ищет по имени.

Ожидаемый результат:

список совпадений;

id;

путь;

контур;

признак пакета чата.


Команда search-text "строка"

Ищет по содержимому.

Ожидаемый результат:

список совпадений;

краткий фрагмент текста.


Команда show-file 15

Показывает карточку файла.

Команда show-chat-package 3

Показывает карточку пакета чата.

Команда stats

Показывает:

число файлов;

число текстовых;

число пакетов;

дату последней индексации.


20. Черновик стартовой последовательности написания кода

Чтобы не тонуть, писать стоит в таком порядке.

Шаг 1

archivist.py

cli.py

config.py

constants.py


Цель: получить запускаемый CLI-каркас.

Шаг 2

models.py

db.py


Цель: уметь создать базу и сохранить первые записи.

Шаг 3

scanner.py


Цель: уметь пройти по файловой системе и собрать метаданные.

Шаг 4

text_extract.py


Цель: уметь извлекать текст.

Шаг 5

chat_packages.py


Цель: уметь определять пакеты чатов.

Шаг 6

indexer.py


Цель: уметь провести полноценную индексацию.

Шаг 7

search.py

presenters.py


Цель: получить работающий поиск и внятный вывод.

Шаг 8

logging_setup.py

stats.py

вспомогательные скрипты


Цель: довести систему до удобного рабочего состояния.

21. Черновик первых сигнатур функций

Ниже приведён упрощённый список полезных стартовых сигнатур.

archivist.py

def main() -> int


cli.py

def main() -> int

def build_parser() -> argparse.ArgumentParser

def cmd_init_db(args) -> int

def cmd_index(args) -> int

def cmd_search_name(args) -> int

def cmd_search_text(args) -> int

def cmd_show_file(args) -> int

def cmd_stats(args) -> int


config.py

def load_config(config_path: str | None = None) -> AppConfig

def validate_config(config: AppConfig) -> None


scanner.py

def iter_files(roots: list[str], exclude_dirs: list[str]) -> Iterator[Path]

def build_file_record(path: Path, ...) -> FileRecord


text_extract.py

def read_text_file(path: Path, max_size_bytes: int) -> tuple[bool, str | None, str | None, str]

def make_excerpt(text: str, max_length: int = 400) -> str


db.py

def init_schema(self) -> None

def upsert_file(self, record: FileRecord) -> int

def search_files_by_name(self, query: str, limit: int = 50) -> list[SearchResult]

def search_files_by_text(self, query: str, limit: int = 50) -> list[SearchResult]


chat_packages.py

def is_chat_package_dir(path: Path) -> bool

def assign_chat_package_path(file_path: Path) -> str | None


indexer.py

def run_full_index(self) -> dict

def _index_single_file(self, path: Path) -> None


presenters.py

def format_search_results(results: list[SearchResult]) -> str

def format_file_card(file_data: dict) -> str


22. Что сознательно не надо писать сразу

На старте не надо немедленно писать:

web GUI;

API-слой;

OCR;

PDF-парсер;

автоматическую тематическую классификацию;

сложную систему статусов;

систему автоматического перемещения файлов.


Иначе ты снова попадёшь в ту же яму, только уже не с файлами, а с кодом Архивариуса.

23. Что станет следующим самым практичным шагом

После этого черновика есть два разумных пути.

Путь А

Собрать реальный стартовый набор исходников:

archivist.py

cli.py

config.py

constants.py

models.py

db.py


Путь Б

Сначала сделать ещё один промежуточный документ: псевдокод полного прохода индексатора

Практичнее сразу идти по пути А.

24. Итог

Настоящий документ фиксирует стартовый Python-каркас Архивариуса:

какие модули нужны;

какие классы и функции стоит ввести;

как разделить ответственность;

в каком порядке писать код.