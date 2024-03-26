#!/bin/bash
# #!/bin/zsh

CONFIG_FILE="$HOME/zsh.conf"

# Функция для чтения файла конфигурации
read_config() {
    if [[ -f $CONFIG_FILE ]]; then
        while IFS='=' read -r key value; do
            # Убедитесь, что значение интерпретируется как число
            eval "$key=$((value))"
        done < "$CONFIG_FILE"
    else
        echo "Файл конфигурации не найден."
        exit 1
    fi
    echo read_config
    echo $build
    echo $theme
    echo $update
    echo $date

}

# Функция для сохранения конфигурации
save_config() {
    echo "build=$build" > "$CONFIG_FILE"
    echo "theme=$theme" >> "$CONFIG_FILE"
    echo "update=$update" >> "$CONFIG_FILE"
    echo "date=$date" >> "$CONFIG_FILE"
    echo "Конфигурация сохранена."
}

# Функция для отображения меню и обработки выбора пользователя
display_menu() {
    # echo display_menu
    # echo $build
    # echo $theme
    # echo $update
    # echo $date
    # echo ---------------
    date_t=OFF
    build_t=OFF
    theme_t=OFF
    update_t=OFF

    # echo $build_t
    # echo $theme_t
    # echo $update_t
    # echo $date_t

    # echo ---------------
    # var_build=$build
    # var_theme=$theme
    # var_update=$update
    # var_date=$date
    # echo ---------------var
    # echo $var_build
    # echo $var_theme
    # echo $var_update
    # echo $var_date
    # echo ---------------var
    if [ $build -eq 1 ];then
    build_t=ON
    fi
    if [ $theme -eq 1 ];then
    theme_t=ON
    fi
    if [ $update -eq 1 ];then
    update_t=ON
    fi
    if [ $date -eq 1 ];then
    date_t=ON
    fi
    # echo $build_t
    # echo $theme_t
    # echo $update_t
    # echo $date_t

    local choice=$(dialog --checklist \
        "Выберите параметры:" 20 60 4 \
        "build" "Build" $build_t \
        "theme" "Theme" $theme_t \
        "update" "Update" $update_t \
        "date" "Date" $date_t \
        3>&1 1>&2 2>&3 3>&-)

    # local choice=$(whiptail --checklist \
    #     "Выберите параметры:" 15 60 4 \
    #     "build" "Build" $build_t \
    #     "theme" "Theme" $theme_t \
    #     "update" "Update" $update_t \
    #     "date" "Date" $date_t \
    #     3>&1 1>&2 2>&3 3>&-)

    # local choice=$(whiptail --checklist \
    #     "Выберите параметры:" 15 60 4 \
    #     "build" "Build" $build \
    #     "theme" "Theme" $theme \
    #     "update" "Update" $update \
    #     "date" "Date" $date \
    #     3>&1 1>&2 2>&3 3>&-)

    # echo local_choice
    # echo $build_t
    # echo $theme_t
    # echo $update_t
    # echo $date_t
    # echo ---------------

    # echo $choice
    # choice=$(echo $choice | sed 's/"//g')
    # echo $choice
    # echo ---------------

    # fullmenu=$(echo "build theme update date")

    # if [ ! "$choice" ]; then
    # echo empety
    build=0
    theme=0
    update=0
    date=0
    # echo $build
    # echo $theme
    # echo $update
    # echo $date
    # fi
        for param in $choice; do
            case $param in
                build)
                    # echo build
                    # echo $build
                    build=$((1 - build))
                    # echo $build
                    ;;
                theme)
                    # echo theme
                    # echo $theme
                    theme=$((1 - theme))
                    # echo $theme
                    ;;
                update)
                    # echo update
                    # echo $update
                    update=$((1 - update))
                    # echo $update
                    ;;
                date)
                    # echo date
                    # echo $date
                    date=$((1 - date))
                    # echo $date
                    ;;
            esac
        done
}

# brew inastall dialog
# brew install newt

# brew install binutils


# Основной скрипт
read_config
display_menu
save_config
clear


# items=("Item 1" "Item 2" "Item 3")

# while item=$(zenity --title="$title" --text="$prompt" --list \
#                --column="Options" "${items[@]}")
# do
#     case "$item" in
#         "${items[0]}") echo "Selected $item, item #1";;
#         "${items[1]}") echo "Selected $item, item #2";;
#         "${items[2]}") echo "Selected $item, item #3";;
#         *) echo "Ooops! Invalid option.";;
#     esac
# done