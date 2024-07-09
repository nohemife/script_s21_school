#!/bin/bash
# #!/bin/zsh

# CONFIG_FILE="$HOME/zsh.conf"

# # Функция для чтения файла конфигурации
# read_config() {
#     if [[ -f $CONFIG_FILE ]]; then
#         while IFS='=' read -r key value; do
#             # Убедитесь, что значение интерпретируется как число
#             eval "$key=$((value))"
#         done < "$CONFIG_FILE"
#     else
#         echo "Файл конфигурации не найден."
#         exit 1
#     fi
#     echo read_config
#     echo $build
#     echo $theme
#     echo $update
#     echo $date

# }

# # Функция для сохранения конфигурации
# save_config() {
#     echo "build=$build" > "$CONFIG_FILE"
#     echo "theme=$theme" >> "$CONFIG_FILE"
#     echo "update=$update" >> "$CONFIG_FILE"
#     echo "date=$date" >> "$CONFIG_FILE"
#     echo "Конфигурация сохранена."
# }

# # Функция для отображения меню и обработки выбора пользователя
# display_menu() {
#     # echo display_menu
#     # echo $build
#     # echo $theme
#     # echo $update
#     # echo $date
#     # echo ---------------
#     date_t=OFF
#     build_t=OFF
#     theme_t=OFF
#     update_t=OFF

#     # echo $build_t
#     # echo $theme_t
#     # echo $update_t
#     # echo $date_t

#     # echo ---------------
#     # var_build=$build
#     # var_theme=$theme
#     # var_update=$update
#     # var_date=$date
#     # echo ---------------var
#     # echo $var_build
#     # echo $var_theme
#     # echo $var_update
#     # echo $var_date
#     # echo ---------------var
#     if [ $build -eq 1 ];then
#     build_t=ON
#     fi
#     if [ $theme -eq 1 ];then
#     theme_t=ON
#     fi
#     if [ $update -eq 1 ];then
#     update_t=ON
#     fi
#     if [ $date -eq 1 ];then
#     date_t=ON
#     fi
#     # echo $build_t
#     # echo $theme_t
#     # echo $update_t
#     # echo $date_t

#     local choice=$(dialog --checklist \
#         "Выберите параметры:" 20 60 4 \
#         "build" "Build" $build_t \
#         "theme" "Theme" $theme_t \
#         "update" "Update" $update_t \
#         "date" "Date" $date_t \
#         3>&1 1>&2 2>&3 3>&-)

#     # local choice=$(whiptail --checklist \
#     #     "Выберите параметры:" 15 60 4 \
#     #     "build" "Build" $build_t \
#     #     "theme" "Theme" $theme_t \
#     #     "update" "Update" $update_t \
#     #     "date" "Date" $date_t \
#     #     3>&1 1>&2 2>&3 3>&-)

#     # local choice=$(whiptail --checklist \
#     #     "Выберите параметры:" 15 60 4 \
#     #     "build" "Build" $build \
#     #     "theme" "Theme" $theme \
#     #     "update" "Update" $update \
#     #     "date" "Date" $date \
#     #     3>&1 1>&2 2>&3 3>&-)

#     # echo local_choice
#     # echo $build_t
#     # echo $theme_t
#     # echo $update_t
#     # echo $date_t
#     # echo ---------------

#     # echo $choice
#     # choice=$(echo $choice | sed 's/"//g')
#     # echo $choice
#     # echo ---------------

#     # fullmenu=$(echo "build theme update date")

#     # if [ ! "$choice" ]; then
#     # echo empety
#     build=0
#     theme=0
#     update=0
#     date=0
#     # echo $build
#     # echo $theme
#     # echo $update
#     # echo $date
#     # fi
#         for param in $choice; do
#             case $param in
#                 build)
#                     # echo build
#                     # echo $build
#                     build=$((1 - build))
#                     # echo $build
#                     ;;
#                 theme)
#                     # echo theme
#                     # echo $theme
#                     theme=$((1 - theme))
#                     # echo $theme
#                     ;;
#                 update)
#                     # echo update
#                     # echo $update
#                     update=$((1 - update))
#                     # echo $update
#                     ;;
#                 date)
#                     # echo date
#                     # echo $date
#                     date=$((1 - date))
#                     # echo $date
#                     ;;
#             esac
#         done
# }

# # brew inastall dialog
# # brew install newt

# # brew install binutils


# # Основной скрипт
# read_config
# display_menu
# save_config
# clear

# ----- VARIABLES ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
MAGENTA=$'\033[0;35m'
RESET=$'\033[0;m'

Memory() {

items=(0 "Memory space information"
       1 "Clear the memory"
       2 "[ CLEAR ALL CASHE ]"
       3 "Exit"
)
while item=$(dialog --title "$TITLE" \
                 --menu "Memory:" 20 40 10 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case "$item" in
        "${items[0]}") 
            # chmod -x ~/script_s21_school/menu/mem_info.sh
            # sh ~/script_s21_school/menu/mem_info.sh
            echo "${items[1]}"
            sleep 3
            ;;
        "${items[2]}") 
            # chmod -x ~/script_s21_school/menu/clear_mem.sh
            # sh ~/script_s21_school/menu/clear_mem.sh
            # sh ~/script_s21_school/menu/mem_info.sh
            # echo "1"
            echo "${items[3]}"
            sleep 3
            # exit 0
            # echo "Selected $item, item #2"
            ;;
        "${items[4]}") 
            echo "${items[5]}"
            sleep 3
            # exit 
            # echo "Selected $item, item #3"
            ;;
        "${items[6]}") 
            echo "${items[7]}"
            sleep 3
            exit 
            # echo "Selected $item, item #4"
            ;;
        # "${items[8]}") 
        #     # echo "4"
        #     echo "${items[9]}"
        #     sleep 3
        #     # exit 
        #     # echo "Selected $item, item #4"
        #     ;;
        *) echo "Ooops! Invalid option."
            echo "${items[*]}"
            sleep 2
            ;;
    esac
done
clear # clear after user pressed Cancel
}

submenu2() {

items=(1 "SubMenu2 Item 1" 2 "SubMenu2 Item 2" 3 "SubMenu2 Item 3" 4 "SubMenu2 Item 4")

while item=$(dialog --title "$TITLE" \
                 --menu "SubMenu2 Please select" 20 40 10 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case "$item" in
        "${items[0]}") 
            exit 
            # echo "Selected $item, item #1"
            ;;
        "${items[1]}") 
            exit 
            # echo "Selected $item, item #2"
            ;;
        "${items[2]}") 
            exit 
            # echo "Selected $item, item #3"
            ;;
        "${items[3]}") 
            exit 
            # echo "Selected $item, item #4"
            ;;
        *) echo "Ooops! Invalid option.";;
    esac
done
clear # clear after user pressed Cancel
}

submenu3() {

items=(1 "SubMenu3 Item 1" 2 "SubMenu3 Item 2" 3 "SubMenu3 Item 3" 4 "SubMenu3 Item 4")

while item=$(dialog --title "$TITLE" \
                 --menu "SubMenu3 Please select" 20 40 10 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case "$item" in
        "${items[0]}") 
            exit 
            # echo "Selected $item, item #1"
            ;;
        "${items[1]}") 
            exit 
            # echo "Selected $item, item #2"
            ;;
        "${items[2]}") 
            exit 
            # echo "Selected $item, item #3"
            ;;
        "${items[3]}") 
            exit 
            # echo "Selected $item, item #4"
            ;;
        *) echo "Ooops! Invalid option.";;
    esac
done
clear # clear after user pressed Cancel
}

submenu4() {

items=(1 "SubMenu4 Item 1" 2 "SubMenu4 Item 2" 3 "SubMenu4 Item 3" 4 "SubMenu4 Item 4")

while item=$(dialog --title "$TITLE" \
                 --menu "SubMenu4 Please select" 20 40 10 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case "$item" in
        "${items[0]}") 
            exit 
            # echo "Selected $item, item #1"
            ;;
        "${items[1]}") 
            exit 
            # echo "Selected $item, item #2"
            ;;
        "${items[2]}") 
            exit 
            # echo "Selected $item, item #3"
            ;;
        "${items[3]}") 
            exit 
            # echo "Selected $item, item #4"
            ;;
        *) echo "Ooops! Invalid option.";;
    esac
done
clear # clear after user pressed Cancel
}

menu() {
items=(1 "Memory" 2 "Install libs" 3 "Docker" 4 "Docker" 5 "exit")
# items=(1 "Item 1" 2 "Item 2" 3 "Item 3")

while item=$(dialog --title "$TITLE" \
                 --menu "Please select" 20 40 10 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case "$item" in
        # "${items[0]}") 
        1)
            Memory
            exit 
            # echo "Selected $item, item #1"
            ;;
        # "${items[1]}") 
        2)
            submenu2
            exit 
            # echo "Selected $item, item #2"
            ;;
        # "${items[2]}") 
        3)
            submenu3
            # echo "Selected $item, item #3"
            ;;
        4)
            submenu3
            # echo "Selected $item, item #3"
            ;;
        5)
            exit
            # echo "Selected $item, item #3"
            ;;            
        *) 
            # submenu4
            # echo "Ooops! Invalid option."
            ;;
    esac
done
clear # clear after user pressed Cancel
}

# items=(1 "Item 1"
#        2 "Item 2")

# while choice=$(dialog --title "$TITLE" \
#                  --menu "Please select" 20 40 10 "${items[@]}" \
#                  2>&1 >/dev/tty)
#     do
#     case $choice in
#         1) ;; # some action on 1
#         2) ;; # some action on 2
#         *) ;; # some action on other
#     esac
# done
# clear # clear after user pressed Cancel

menu2() {
cmd=(dialog --keep-tite --menu "Select options:" 22 76 16)
options=(1 "Option 1"
         2 "Option 2"
         3 "Option 3"
         4 "Option 4")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
for choice in $choices
do
    case $choice in
        1)
            echo "First Option"
            ;;
        2)
            echo "Second Option"
            ;;
        3)
            echo "Third Option"
            ;;
        4)
            echo "Fourth Option"
            ;;
    esac
done
}

menu
menu2
Memory
submenu2
submenu3
submenu4