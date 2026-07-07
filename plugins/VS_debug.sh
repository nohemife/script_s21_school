#!/bin/bash

# ----- VARIABLES ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
MAGENTA=$'\033[0;35m'
RESET=$'\033[0;m'
# --------------------- #

# -------------------------------------------------------------------------- VS debug

# vdb — обычный запуск с вопросом
# vdb -f — принудительно перезаписать без вопросов

function vdb() {
    workdir=$(git rev-parse --show-toplevel 2>/dev/null) || {
        echo "Ошибка: не git-репозиторий"; return 1
    }
    workdir="$workdir/"

    file="a.out"

    # Если НЕ передан флаг -f/--force — работаем в интерактивном режиме
    if [ "$1" != "-f" ] && [ "$1" != "--force" ]; then
        if [ -d "${workdir}.vscode" ]; then
            echo "Папка .vscode уже есть. Заменить? [y/n]: "
            read -n1 key; echo
            case "$key" in
                [yY]) rm -rf "${workdir}.vscode" ;;
                *) return 0 ;;
            esac
        fi

        echo "Введи имя исполняемого файла (по умолчанию a.out): "
        read -r file
        file=${file:-a.out}
    else
        # Режим -f: удаляем без вопросов
        rm -rf "${workdir}.vscode"
        file=${file:-a.out}
    fi

    mkdir -p "${workdir}.vscode"
    sed "s|a.out|${file}|g" "$HOME/script_s21_school/.vscode/launch.json" > "${workdir}.vscode/launch.json"
    cp "$HOME/script_s21_school/.vscode/tasks.json" "${workdir}.vscode/tasks.json"

    echo "Готово: ${workdir}src/${GREEN}${file}${RESET}"
}

# --------------------------------------------------------------------------
