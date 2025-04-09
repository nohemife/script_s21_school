# Как установить
## ОТКРОЙТЕ ТЕРМИНАЛ И НАПИШИ КОМАНДУ
```
curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/init_setup.sh > ~/.zshrc ; source ~/.zshrc ;  init_setup ; source ~/.zshrc

```
## P.S. Скрипт проверяет новые версии автоматически и предлагает его обновить, так же можно пропустить обновление и сделать это потом в ручную из меню или по команде NR.
#

-------------
# alias:
-------------
##  restart
### перезагрузка скрипта
-------------
## gw
###  вызов компилятора "gcc" с флагами "-Wall -Wextra -Werror"
-------------
## gw+
###  вызов компилятора "g++" с флагами "-Wall -Wextra -Werror"
-------------
## gwd
###  вызов компилятора "gcc" с флагами "-Wall -Wextra -Werror -g". Флаг "-g" дебаг.
-------------
## gwd+
###  вызов компилятора "g++" с флагами "-Wall -Wextra -Werror -g". Флаг "-g" дебаг.
-------------
## gdb
###  вызов компилятора "gcc" с флагом "-g". Флаг "-g" дебаг.
-------------
## gdb+
###  вызов компилятора "g++" с флагом "-g". Флаг "-g" дебаг.
-------------
## dir
###  сокращенный вызов "ls -la" - показать файлы в текущей директории, показывает скрытые файлы.
-------------
## /
###  сокращенный вызов "cd .."
-------------
## //
###  сокращенный вызов "cd -"
-------------
## ff
###  вызов функции fixformat, происходит проверка и исправление стилистики во всех вложенных папках текущей директории для файлов "*.c, *.h, *.cpp, *.cc"
-------------
## cc
###  вызов функции cppcheck, происходит анализ кода во всех вложенных папках для файлов "*.c, *.h, *.cpp, *.cc"
-------------
## fs
###  происходит вызов функции find_sql, которая находит все файлы в рабочей директории и собирает в один файл для проверки
-------------
## m
###  сокращенная команда вызова меню
-------------
## rmh
###  удаление истории терминала "rm -rf ~/.zsh_history"
-------------
## rc
###  редактирование скрипта ".zshrc"
-------------
## rcm
###  редактирование скрипта "menu"
-------------
## vsc
###  открывает текущую папку в Visual Studio Code
-------------
## pushd
###  коммитит и отправляет текущие изменения в ветку develop репозитория
-------------
## pushn
###  коммитит и отправляет текущие изменения в ветку "username"(имя определяется автоматически)" репозитория 
-------------
## gsd
###  сокращенная команда "git switch develop"
-------------
## gsn
###  сокращенная команда "git switch "username"(имя определяется автоматически)"
-------------
# Функции скрипта:
-------------
## init_setup
###  копирует ресурсы с репозитория
-------------
## menu
###  вызывает меню
-------------
## comp
###  делает файл исполняемым для macOS и сразу запускает его, если нет ошибок компиляции (есть файл test.c, мы пишем  comp test - это компилирует test.c и создает исполняемый файл test.o)
-------------
## fixformat
###  происходит проверка и исправление стилистики во всех вложенных папках текущей директории для файлов "*.c, *.h, *.cpp, *.cc"
-------------
## cpp_check
###  происходит анализ кода во всех вложенных папках текущей директории для файлов "*.c, *.h, *.cpp, *.cc"
-------------
## vdb
###  копирует json для дебага в VScode, с возможностью выбора исполняемого файла для теста. если файл уже существует, то можно заменить на новый с полной перезаписью старого
-------------
## sql
###  определяет текущий проект на принадлежность с бассейну SQL и если это так, то предлагает автоматически создать папки и файлы в директории src, с номером нужного дня и количеством заданий в проекте
-------------
## find_sql
###  определяет текущий проект на принадлежность с бассейну SQL и если это так, то находит все файлы в рабочей директории и собирает в один файл для проверки в папке src
-------------
## peer
###  создает папку peer_review_dir и клонирует проверяемый git-проект с активной веткой develop, к имени файла автоматически добавляется дата и время
-------------
## gclone
###  клонирует твой git-проект в корень твоего пространства, с автоматическим переключением в ветку develop
-------------
## mem
###  вызывает скрипт очистки памяти
-------------
## brewinstall
###  установка homebrew + тестовых библиотек
-------------
## NR
###  обновление скрипта
-------------
## readme
###  описание работы скрипта
-------------
## new
###  что нового в обновлении
-------------
## die
###  удаление скрипта терминала и всех файлов
-------------

# Пункты Menu:
-------------
## Memory - Информация о свободном месте и очистка памяти
- Memory space information - Информация о свободной памяти
- Clear the memory - очистка памяти
- [ CLEAR ALL CASHE ] - глубокая очистка памяти, если не помогла первая
- Back to menu - Возвращение в меню
-------------
## Install Libs - Установка необходимых библиотек
- install brew and all test libs - Установка brew и необходимых библиотек для тестов
- install only brew - Установка только brew 
- install only test libs - Установка только необходимых библиотек для тестов
- install googletest - Установка GTest
- Back to menu - Возвращение в меню
-------------
## Docker - Линковка и копирование нужных приложений для установки
- Docker link + copy apt - Линковка и копирование в буффер обмена списка приложений
- Docker link - Линковка
- Docker copy apt - Копирование в буффер обмена списка приложений
- Docker copy lint - Копирование в буффер обмена скрипта для установки s21lint
- Back to menu - Возвращение в меню
-------------

-------------
## Есть предложение, пиши в рокет @nohemife
###  