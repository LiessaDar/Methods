@ECHO OFF

IF "%1"=="ic" GOTO INCOMMAND
IF "%1"=="oc" GOTO OUTCOMMAND

GOTO EXIT

:INCOMMAND
ECHO Внутренние команды
ECHO Работа с каталогами
ECHO CD, CDDIR - смена каталога
ECHO MD, MDDIR - создание каталога
ECHO RD, RDDIR - удаление каталога
ECHO DIR       - просмотр содержимого каталога
ECHO Работа с файлами
ECHO TYPE      - просмотр файла
ECHO DEL, ERASE- удаление файла
ECHO REN       - перенос, переименование файла
ECHO COPY      - копирование файла
ECHO Работа с датой и временем
ECHO DATE      - вывод, изменение текущей даты
ECHO TIME      - вывод, изменение текущего времени
ECHO Работа экраном
ECHO CLS       - очистка экрана
ECHO PROMPT    - изменение приглашения

GOTO EXIT

:OUTCOMMAND
ECHO Внешние команды
ECHO ATTRIB	- установка атиьутов файла
ECHO XCOPY	- расширенная команда копирования
ECHO SYS	- установка MS DOS на указанный диск
ECHO FORMAT	- форматирование диска
ECHO FDISK      - утилита разбиения диска
ECHO FIND	- команда поиска в файле последовательности символов
ECHO MORE	- программа постраничного вывода информации
ECHO MOVE       - расширенная команда перемещения файлов и каталогов
ECHO SORT	- сортировка данных
ECHO CHOICE	- организация диалога с пользователем

GOTO EXIT

:RUN
example_01.bat %1

:EXIT
IF "%2"=="R" GOTO :RUN


