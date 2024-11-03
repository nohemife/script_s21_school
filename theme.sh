#!/bin/sh
show_menu() {
    normal=$(echo "\033[m")
    menu=$(echo "\033[36m")   #Blue
    number=$(echo "\033[33m") #yellow
    bgred=$(echo "\033[41m")
    fgred=$(echo "\033[31m")
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 0)${menu} theme 0 ${normal}\n"
    printf "${menu}**${number} 1)${menu} theme 1 ${normal}\n"
    printf "${menu}**${number} 2)${menu} theme 2 ${normal}\n"
    printf "${menu}**${number} 3)${menu} theme 3 ${normal}\n"
    # printf "${menu}**${number} 5)${menu} theme 4 ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked() {
    msgcolor=$(echo "\033[01;31m") # bold red
    normal=$(echo "\033[00;00m")   # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]; do
    if [ $opt = '' ]; then
        exit
    else
        case $opt in
        0)
            clear
            option_picked "Option 0 Picked"
            sed -i 's/THEME = [0-9]*/THEME = 0/' ~/.school_resources_for_peer/zsh.conf
            # show_menu;
            bash | restart
            break
            ;;
        1)
            clear
            option_picked "Option 1 Picked"
            sed -i 's/THEME = [0-9]*/THEME = 1/' ~/.school_resources_for_peer/zsh.conf
            # show_menu;
            bash | restart
            break
            ;;
        2)
            clear
            option_picked "Option 2 Picked"
            sed -i 's/THEME = [0-9]*/THEME = 2/' ~/.school_resources_for_peer/zsh.conf
            # show_menu;
            bash | restart
            break
            ;;
        3)
            clear
            option_picked "Option 3 Picked"
            sed -i 's/THEME = [0-9]*/THEME = 3/' ~/.school_resources_for_peer/zsh.conf
            # show_menu;
            bash | restart
            break
            ;;
        x)
            exit
            ;;
        *)
            clear
            option_picked "Pick an option from the menu"
            show_menu
            ;;
        esac
    fi
done
