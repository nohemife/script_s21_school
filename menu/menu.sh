#!/bin/bash
#!/bin/zsh

# ----- VARIABLES ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
MAGENTA=$'\033[0;35m'
RESET=$'\033[0;m'
# --------------------- #

Memory() {

    items=(0 "Memory space information"
        1 "Clear the memory"
        2 "[ CLEAR ALL CASHE ]"
        3 "Back to menu"
    )

    while item=$(dialog --title "$TITLE" \
        --menu "Memory:" 20 40 10 "${items[@]}" \
        2>&1 >/dev/tty); do
        case "$item" in
        "${items[0]}")
            # echo "${items[1]}"
            # sleep 3
            sh ~/.school_resources_for_peer/menu/mem_info.sh
            exit
            ;;
        "${items[2]}")
            # echo "${items[3]}"
            # sleep 3
            # chmod -x ~/.school_resources_for_peer/menu/clear_mem.sh
            sh ~/.school_resources_for_peer/menu/clear_mem.sh
            # sh ~/.school_resources_for_peer/menu/mem_info.sh
            exit
            ;;
        "${items[4]}")
            # echo "${items[5]}"
            # sleep 3
            # chmod -x ~/.school_resources_for_peer/menu/clear_cashe.sh
            sh ~/.school_resources_for_peer/menu/clear_cashe.sh
            # sh ~/.school_resources_for_peer/menu/mem_info.sh
            exit
            ;;
        "${items[6]}")
            # echo "${items[7]}"
            # sleep 3
            menu
            exit
            ;;
        *)
            echo "Ooops! Invalid option."
            echo "${items[*]}"
            sleep 2
            exit
            ;;
        esac
    done
    clear # clear after user pressed Cancel
}

Install_libs() {

    items=(1 "install brew and all test libs"
        2 "install only brew"
        3 "install only test libs"
        4 "install googletest"
        5 "Back to menu"
    )

    while item=$(dialog --title "$TITLE" \
        --menu "Install libs:" 20 40 10 "${items[@]}" \
        2>&1 >/dev/tty); do
        case "$item" in
        "${items[0]}")
            # echo "${items[1]}"
            # sleep 3

            bash ~/.school_resources_for_peer/menu/brewinstall.sh
            bash ~/.school_resources_for_peer/menu/brewinstall_libs.sh

            # BRW=$(echo $(brew --version))

            # if [ ! "$BRW" ];then
            #     curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
            # fi
            # restart && reset
            # osascript -e 'tell app "Terminal" to do script "brew install pkg-config && \
            #                                                 brew install lmdb && \
            #                                                 brew install lcov && \
            #                                                 brew install gcovr && \
            #                                                 brew install googletest && \
            #                                                 brew install cppcheck && \
            #                                                 killall iTerm2 Terminal"'
            exit
            ;;
        "${items[2]}")
            # echo "${items[3]}"
            # sleep 3

            bash ~/.school_resources_for_peer/menu/brewinstall.sh
            # bash ~/.school_resources_for_peer/menu/brewinstall_libs.sh

            # BRW=$(echo $(brew --version))

            # if [ ! "$BRW" ];then
            #     curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
            # fi
            # restart && reset
            exit
            ;;
        "${items[4]}")
            # echo "${items[5]}"
            # sleep 3

            # bash ~/.school_resources_for_peer/menu/brewinstall.sh
            bash ~/.school_resources_for_peer/menu/brewinstall_libs.sh

            # restart && reset
            # osascript -e 'tell app "Terminal" to do script "brew install pkg-config && \
            #                                                 brew install lmdb && \
            #                                                 brew install lcov && \
            #                                                 brew install gcovr && \
            #                                                 brew install googletest && \
            #                                                 brew install cppcheck && \
            #                                                 killall iTerm2 Terminal"'
            exit
            ;;
        "${items[6]}")
            # echo "${items[5]}"
            # sleep 3

            bash ~/.school_resources_for_peer/menu/install_googletest.sh

            # osascript -e 'tell app "Terminal" to do script "cd && git clone https://github.com/google/googletest.git && \
            #                                                 cd googletest && mkdir build && cd build && \
            #                                                 cmake -DCMAKE_CXX_COMPILER:STRING="/usr/local/bin/g++" .. && \
            #                                                 make install && cd && rm -rf googletest"'
            exit
            ;;
        "${items[8]}")
            # echo "${items[7]}"
            # sleep 3
            menu
            exit
            ;;
        *) echo "Ooops! Invalid option." ;;
        esac
    done
    clear # clear after user pressed Cancel
}

Docker() {

    items=(1 "Docker link + copy apt"
        2 "Docker link"
        3 "Docker copy apt"
        4 "Docker copy lint"
        5 "Back to menu"
    )

    while item=$(dialog --title "$TITLE" \
        --menu "Docker:" 20 40 10 "${items[@]}" \
        2>&1 >/dev/tty); do
        case "$item" in
        "${items[0]}")
            # bash ~/.school_resources_for_peer/menu/docker_link.sh
            # bash ~/.school_resources_for_peer/menu/docker_copy_apt.sh
            bash ~/.school_resources_for_peer/menu/docker_link.sh
            bash ~/.school_resources_for_peer/menu/docker_copy_apt.sh
            exit
            ;;
        "${items[2]}")
            # bash ~/.school_resources_for_peer/menu/docker_link.sh
            bash ~/.school_resources_for_peer/menu/docker_link.sh
            exit
            ;;
        "${items[4]}")
            # bash ~/.school_resources_for_peer/menu/docker_copy_apt.sh
            bash ~/.school_resources_for_peer/menu/docker_copy_apt.sh
            exit
            ;;
        "${items[6]}")
            # bash ~/.school_resources_for_peer/menu/docker_copy_apt.sh
            bash ~/.school_resources_for_peer/menu/docker_copy_lint.sh
            exit
            ;;
        "${items[8]}")
            menu
            exit
            ;;
        *) echo "Ooops! Invalid option." ;;
        esac
    done
    clear # clear after user pressed Cancel
}

submenu4() {

    items=(1 "SubMenu4 Item 1"
        2 "SubMenu4 Item 2"
        3 "SubMenu4 Item 3"
        4 "Back to menu"
    )

    while item=$(dialog --title "$TITLE" \
        --menu "SubMenu4 Please select" 20 40 10 "${items[@]}" \
        2>&1 >/dev/tty); do
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
            menu
            exit
            # echo "Selected $item, item #4"
            ;;
        *) echo "Ooops! Invalid option." ;;
        esac
    done
    clear # clear after user pressed Cancel
}

menu() {
    items=(1 "Memory"
        2 "Install libs"
        3 "Docker"
        4 "submenu4"
        5 "Exit"
    )
    # items=(1 "Item 1" 2 "Item 2" 3 "Item 3")

    while item=$(dialog --title "$TITLE" \
        --menu "Please select" 20 40 10 "${items[@]}" \
        2>&1 >/dev/tty); do
        case "$item" in
        # "${items[0]}")
        1)
            Memory
            exit
            # echo "Selected $item, item #1"
            ;;
        # "${items[1]}")
        2)
            Install_libs
            exit
            # echo "Selected $item, item #2"
            ;;
        # "${items[2]}")
        3)
            Docker
            exit
            # echo "Selected $item, item #3"
            ;;
        4)
            submenu4
            exit
            # echo "Selected $item, item #3"
            ;;
        5)
            exit
            # echo "Selected $item, item #3"
            ;;
        *)
            echo "Ooops! Invalid option."
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

# menu2() {
# cmd=(dialog --keep-tite --menu "Select options:" 22 76 16)
# options=(1 "Option 1"
#          2 "Option 2"
#          3 "Option 3"
#          4 "Option 4")
# choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
# for choice in $choices
# do
#     case $choice in
#         1)
#             echo "First Option"
#             ;;
#         2)
#             echo "Second Option"
#             ;;
#         3)
#             echo "Third Option"
#             ;;
#         4)
#             echo "Fourth Option"
#             ;;
#     esac
# done
# }

menu
