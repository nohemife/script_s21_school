#!/bin/bash

CONFIG_FILE="$HOME/.zsh.conf"

read_config() {
    if [[ -f $CONFIG_FILE ]]; then
        while IFS='= ' read -r key value; do
            eval "$key=$((value))"
        done <"$CONFIG_FILE"
    else
        echo "Файл конфигурации не найден."
        exit 1
    fi
    echo read_config
    echo $AUTOUPDATE
    echo $THEME
    echo $update
    echo $date

}

save_config() {
    sed -i $MAC 's/AUTOUPDATE = [0-9]*/AUTOUPDATE = '$AUTOUPDATE'/' $CONFIG_FILE
    sed -i $MAC 's/THEME = [0-9]*/THEME = '$THEME'/' $CONFIG_FILE
    sed -i $MAC 's/update = [0-9]*/update = '$update'/' $CONFIG_FILE
    sed -i $MAC 's/date = [0-9]*/date = '$date'/' $CONFIG_FILE
    echo "Конфигурация сохранена."
}

display_menu() {

    date_t=OFF
    AUTOUPDATE_t=OFF
    THEME_t=OFF
    update_t=OFF

    if [ $AUTOUPDATE -eq 1 ]; then
        AUTOUPDATE_t=ON
    fi
    if [ $THEME -eq 1 ]; then
        THEME_t=ON
    fi
    if [ $update -eq 1 ]; then
        update_t=ON
    fi
    if [ $date -eq 1 ]; then
        date_t=ON
    fi

    local choice=$(dialog --checklist \
        "Выберите параметры:" 20 60 4 \
        "AUTOUPDATE" "AUTOUPDATE" $AUTOUPDATE_t \
        "THEME" "THEME" $THEME_t \
        "update" "Update" $update_t \
        "date" "Date" $date_t \
        3>&1 1>&2 2>&3 3>&-)

    AUTOUPDATE=0
    THEME=0
    update=0
    date=0
    for param in $choice; do
        case $param in
        AUTOUPDATE)
            AUTOUPDATE=$((1 - AUTOUPDATE))
            ;;
        THEME)
            THEME=$((1 - THEME))
            ;;
        update)
            update=$((1 - update))
            ;;
        date)
            date=$((1 - date))
            ;;
        esac
    done
}

read_config
display_menu
save_config
clear
