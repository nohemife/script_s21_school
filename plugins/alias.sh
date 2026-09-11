#!/bin/bash

# -------------------------------------------------------------------------- alias
alias restart="source $HOME/.bashrc"

alias work="WorkDir"

alias cc="CppCheck"
alias ff="FixFormat"
alias fs="FixFormatIntensive"

alias gsd="git switch develop"
alias gsn="git switch $(whoami)"
alias rst="git checkout ."

alias info="system_libs_info"

alias s21_lint="$HOME/script_s21_school/plugins/s21_lint"
alias keepalive="$HOME/script_s21_school/plugins/keepalive"

function WorkDir() {
	cd $(echo $(git rev-parse --show-toplevel))
}

function init() {
	WORK_DIR=$(echo $(git rev-parse --show-toplevel))
	if [ -d "$WORK_DIR/src" ]; then
		cp $HOME/script_s21_school/plugins/Makefile $WORK_DIR/src/Makefile
		cd $WORK_DIR/src
	fi
}

function helpme() {
	echo "restart      - перезапуск скрипта bashrc"
	echo "info         - информация об установленных библиотеках"
	echo "getkey       - генерация ключа ssh"

	echo "work         - переход в рабочию область проекта"
	echo "staff        - при передачи этой команде репозитория, происходит его клонирование и открытие"
	echo "init         - копирование makefile в дерикторию текущего проекта"

	echo "gsd          - переключение на ветку develop"
	echo "gsn          - переключение на ветку пользователя"
	echo "rst          - восстановление проекта в исходное состояние из репозитория"

	echo "cc           - запуск утилиты cppcheck"
	echo "ff           - запуск clang-format со стилем Google-Core"
	echo "fs           - запуск clang-format со стилем Google-Intensive" 

	echo "s21_lint     - запуск утилиты s21_lint для поиска нарушений"
	echo "s21_lint -с  - запуск утилиты s21_lint для очистки комментариев"
	echo "keepalive    - запуск утилиты keepalive, предотвращающая разлогин"

	echo "vdb          - копирования файлов для дебага с вопросом"
	echo "vdb -f       - принудительно перезаписать файлов для дебага без вопросов"
	echo "clown        - запуск скрипта генерации клоунов"
	# echo "gclone     - при передачи этой команде репозитория, происходит его клонирование и открытие"
}