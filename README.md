# Как установить
## ОТКРОЙТЕ ТЕРМИНАЛ И НАПИШИ КОМАНДУ
### cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.zshrc
## ЗАТЕМ НАПИШИТЕ ТАКЖЕ КОМАНДУ
### source ~/.zshrc
## P.S. Также при каждом новом обновлении прописывайте команду NR
#

-------------
# alias:
-------------
## restart
### ``перезагрузка скрипта``<br>
-------------
## gw
### ``вызов компилятора "gcc" с флагами "-Wall -Wextra -Werror"``<br>
-------------
## gwd
### ``вызов компилятора "gcc" с флагами "-Wall -Wextra -Werror -g". Флаг "-g" дебаг.``<br>
-------------
## gdb
### ``вызов компилятора "gcc" с флагом "-g". Флаг "-g" дебаг.``<br>
-------------
## dir
### ``сокращенный вызов "ls -la" - показать файлы в текущей директории, показывает скрытые файлы.``<br>
-------------
## /
### ``сокращенный вызов "cd .."``<br>
-------------
## //
### ``сокращенный вызов "cd -"``<br>
-------------
## work
### ``делает рабочий стол активной папкой "cd ~/Desktop/"``<br>
-------------
## rmh
### ``удаление истории терминала "rm -rf ~/.zsh_history"``<br>
-------------
## rc
### ``редактирование скрипта "nano ~/.zshrc && source ~/.zshrc"``<br>
-------------
## vsc
### ``открывает текущую папку в Visual Studio Code``<br>
-------------
## pushd
### ``сокращенная команда "git push origin develop"``<br>
-------------
## pushn
### ``сокращенная команда "git push origin nohemife"``<br>
-------------
## gsd
### ``сокращенная команда "git switch develop"``<br>
-------------
## gsn
### ``сокращенная команда "git switch nohemife"``<br>
-------------
# Функции скрипта:
-------------
## init_setup
### ``копирует ресурсы с репозитория``<br>
-------------
## comp
### ``делает файл исполняемым для macOS и сразу запускает его, если нет ошибок компиляции (есть sort.c, мы пишем  comp sort. это компилирует sort.c и создает исполняемый файл sort.o)``<br>
-------------
## fixformat
### ``копирует .clang-format в рабочую дирректорию и правит формат файлов с расширением *.c *.h``<br>
-------------
## vdb
### ``копирует json для дебага в VScode``<br>
-------------
## peer
### ``очищает текущую папку и клонирует определенный git-проект с активной веткой develop``<br>
-------------
## mem
### ``вызывает скрипт очистки памяти``<br>
-------------
## memс
### ``вызывает скрипт удаления кэша``<br>
-------------
## brewinstall
### ``установка homebrew``<br>
-------------
## NR
### ``обновление скрипта``<br>
-------------
## readme
### ``описание работы скрипта``<br>
-------------
## die
### ``удаление скрипта терминала и всех файлов``<br>
