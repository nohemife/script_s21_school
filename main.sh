#!/bin/bash
# Source: https://github.com/Lifailon/Console-Menu
# ©2023 Lifailon
# Apache License 2.0

# ----- VARIABLES ----- #
  RED=$'\033[0;31m'
  GREEN=$'\033[0;32m'
  YELLOW=$'\033[0;33m'
  BLUE=$'\033[0;34m'
  MAGENTA=$'\033[0;35m'
  RESET=$'\033[0;m'

menu=(
"Update script"
# "Process Stats"
"Memory space information"
"Clear the memory"
"[ CLEAR ALL CASHE ]"
"install brew+lcov+check"
"Docker link"
"Docker copy apt"
"Docker link + copy apt"
"README"
"parrot.live"
"Exit"
)

TAG=$(cat ~/.school_resources_for_peer/.zshrc | grep TAG)
# ASCII Art generated: https://patorjk.com/software/taag/#p=display&f=Ivrit&t=Console%20-%20Menu
logo=(
"                                                                       $TAG"
"   ____                      _                __  __                   "
"  / ___|___  _ __  ___  ___ | | ___          |  \/  | ___ _ __  _   _  "
" | |   / _ \| '_ \/ __|/ _ \| |/ _ \  _____  | |\/| |/ _ \ '_ \| | | | "
" | |__| (_) | | | \__ \ (_) | |  __/ |_____| | |  | |  __/ | | | |_| | "
"  \____\___/|_| |_|___/\___/|_|\___|         |_|  |_|\___|_| |_|\__,_| "
"                                                                       "
)

# Off and on cursor
tput civis
trap ctrl_c INT
function ctrl_c() {
    tput cnorm
    clear
    exit 0
}

clear
selected=0

function show-menu {
    rows=$(tput lines)
    cols=$(tput cols)
    menu_length=${#menu[@]}
    current_row=$((rows / 4 - menu_length / 2))
    index=2

    # logo
    for i in "${!logo[@]}"; do
        tput cup $current_row $((cols / index - ${#logo[$i]} / 2))
        echo "${logo[$i]}"
        ((current_row++))
    done
    # printf $TAG

    # Menu
    for i in "${!menu[@]}"; do
        if [[ $i -eq $selected ]]; then
            tput cup $current_row $((cols / index - ${#menu[$i]} / 2))
            echo "-> ${menu[$i]}"
        else
            tput cup $current_row $((cols / index - ${#menu[$i]} / 2))
            echo "   ${menu[$i]}"
        fi
        ((current_row++))
    done
}

function docker_link {
    echo Ooops...
    #!/bin/bash
    echo del com.docker.docker
    rm -rf ~/Library/Containers/com.docker.docker
    sleep 1
    echo mkdir
    mkdir -p ~/goinfre/Docker/Data
    sleep 1
    echo link com.docker.docker
    ln -s ~/goinfre/Docker ~/Library/Containers/com.docker.docker
    sleep 1
    reset
    echo $GREEN"Link Success"$RESET

}

function docker_copy_apt {
    cat ~/.school_resources_for_peer/aptdoc.txt | pbcopy
    echo $GREEN"Copy Success"$RESET
    break
}

function clear_mem {
echo $RED"----- CLEARING THE SPACE -----"$RESET
    sleep 1
    # Avoid boring prefix in du/df/etc
    cd $HOME
    initial_used_space=$(df -h $HOME | grep -v 'Filesystem' | awk '{ printf("%f", $3) }')
    # Show current used space
    initial_df=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$")
    before=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$")
    echo $RED"Current space:\n"$RESET${initial_df}$RESET
    echo $RED"\nHome folder:"$RESET

    echo ""
    echo '----------------------'
    echo 'Size    Used    Avail'
    echo '----------------------'
    df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
    # rm -rf ~/Library/ApplicationSupport/CrashReporter/*
    # rm -rf ~/Library/Application\ Support/Code/*
    # rm -rf ~/Library/Group\ Containers/*
    rm -rf ~/Library/Caches/CloudKit
    rm -rf ~/Library/Caches/com.apple.akd
    rm -rf ~/Library/Caches/com.apple.ap.adprivacyd
    rm -rf ~/Library/Caches/com.apple.appstore
    rm -rf ~/Library/Caches/com.apple.appstoreagent
    rm -rf ~/Library/Caches/com.apple.cache_delete
    rm -rf ~/Library/Caches/com.apple.commerce
    rm -rf ~/Library/Caches/com.apple.iCloudHelper
    rm -rf ~/Library/Caches/com.apple.imfoundation.IMRemoteURLConnectionAgent
    rm -rf ~/Library/Caches/com.apple.keyboardservicesd
    rm -rf ~/Library/Caches/com.apple.nbagent
    rm -rf ~/Library/Caches/com.apple.nsservicescache.plist
    rm -rf ~/Library/Caches/com.apple.nsurlsessiond
    rm -rf ~/Library/Caches/storeassetd
    rm -rf ~/Library/Caches/com.microsoft.VSCode.ShipIt
    rm -rf ~/Library/Caches/com.microsoft.VSCode
    rm -rf ~/Library/Caches/com.google.SoftwareUpdate
    rm -rf ~/Library/Caches/com.google.Keystone
    rm -rf ~/Library/Caches/com.apple.touristd
    rm -rf ~/Library/Caches/com.apple.tiswitcher.cache
    rm -rf ~/Library/Caches/com.apple.preferencepanes.usercache
    rm -rf ~/Library/Caches/com.apple.preferencepanes.searchindexcache
    rm -rf ~/Library/Caches/com.apple.parsecd
    rm -rf ~/Library/Caches/
    rm -rf ~/.Trash/*
    rm -rf ~/.kube/cache/*
    rm -rf ~/Library/Containers/com.docker.docker/Data/vms/*
    rm -rf ~/Library/Application\ Support/Firefox/Profiles/hdsrd79k.default-release/storage
    rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage
    rm -rf ~//Library/Application\ Support/Spotify/PersistentCache
    rm -rf ~/Library/Application\ Support/Telegram\ Desktop/tdata/user_data
    rm -rf ~/Library/Application\ Support/Telegram\ Desktop/tdata/emoji
    rm -rf ~/Library/Application\ Support/Code/Cache/Library/Application\ Support/Code/Cachei
    rm -rf ~/Library/Application\ Support/Code/CacheData
    rm -rf ~/Library/Application\ Support/Code/Cache
    rm -rf ~/Library/Application\ Support/Code/CacheData
    rm -rf ~Library/Application\ Support/Code/Crashpad/completed
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage
    rm -rf ~/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/Service\ Worker/CacheStorage/
    df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
    echo '----------------------'
    echo "Clean Success"

    rm -rf ~/Desktop/Presentation.pdf
    # rm -rf ~/Documents/*
    # rm -rf ~/Downloads/*
    rm -rf ~/Movies/*
    rm -rf ~/Music/*
    rm -rf ~/Pictures/*
    rm -rf ~/.Trash/*
    cp ~/Library/Icon? ~/.Trash
    ​
    #!/bin/bash
    rm -rfv ~/Library/Caches/*
    rm -rfv ~/Library/Application\ Support/Slack/Cache/*
    rm -rfv ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/*
    rm -rfv ~/Library/Group\ Containers/6N38VWS5BX.ru.keepcoder.Telegram/account-570841890615083515/postbox/*
    rm -rfv ~/Library/Caches
    rm -rfv ~/Library/Application\ Support/Code/Cache
    rm -rfv ~/Library/Application\ Support/Code/CachedData
    rm -rfv ~/Library/Application\ Support/Code/CachedExtension
    rm -rfv ~/Library/Application\ Support/Code/CachedExtensions
    rm -rfv ~/Library/Application\ Support/Code/CachedExtensionVSIXs
    rm -rfv ~/Library/Application\ Support/Code/Code\ Cache
    rm -rfv ~/Library/Application\ Support/Slack/Cache
    rm -rfv ~/Library/Application\ Support/Slack/Code\ Cache
    rm -rfv ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage
    rm -rfv ~/Library/Application\ Support/Code/User/workspaceStorage
    echo -en "\033[31mSpace for the space!\n\033[0m"
    free_space=$(df -h | grep 'lallison' | awk '{print $4}')
    echo -en "\033[32m${free_space} are available now\n\033[0m"
    free_space=$(df -h | grep 'agidget' | awk '{print $4}')
    echo -en "\033[32m${free_space} are available now\n\033[0m"
    df -h ~
    ​
    echo '----------------------'
    echo '\033[37;1;41mSize    Used    Avail\033[0m'
    echo '----------------------'
    df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
    #df -h | awk 'NR == 8{print $2 " = " $3 " + "  $4}'
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/* -y
    rm -rf ~/Library/Application\ Support/Slack/Cache/* -y
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* -y
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/*
    rm -rf ~/Library/Application\ Support/Google/Chrome/Crashpad/completed/*
    rm -rf ~/Library/Caches/* -y
    rm -rf ~/.Trash/* -y
    rm -rf ~/Library/Safari/* -y
    rm -rf ~/.kube/cache/* -y
    rm -rf ~/Library/Application\ Support/Code/CachedData/* -y
    rm -rf ~/Library/Application\ Support/Code/Crashpad/completed/* -y
    rm -rf ~/Library/Application\ Support/Code/User/workspaceStoratge/* -y
    rm -rf ~/Library/Containers/com.docker.docker/Data/vms/* -y
    rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/* -y
    rm -rf ~/Library/Containers/org.telegram.desktop/Data/Library/Application\ Support/Telegram\ Desktop/tdata/emoji/* -y
    df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
    #df -h | awk 'NR == 8{print $2 " = " $3 " + "  $4}'
    echo '----------------------'
    
    echo "${blue}Current space:\n${reset}${initial_df}${reset}"
    echo "${blue}\nHome folder:${reset}"
    du -hd1 . 2>/dev/null | sort -h | grep --color=always "[0-9]*\.*[0-9]*M\t\|[0-9]*\.*[0-9]*G\t\|$"
    echo ""
    ​
    echo '----------------------'
    echo 'Size    Used    Avail'
    echo '----------------------'
    
    clear
    echo $RED"----- CLEARING THE SPACE -----"$RESET
    sleep 1
    echo $RED"before:\n"$RESET${before}$RESET
    df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
    sleep 1
    echo DONE
}

function clear_cashe {
    echo $RED"----- CLEARING CASHE -----"$RESET
    find ~/ -name ".DS_Store" -print -delete 2> /dev/null
    find ~/ -name "**.42_cache_bak**" -print -delete 2> /dev/null
    rm -rf ~/.zcompdump*
    rm -rf .Trash/*
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
    rm -rf ~/Library/Caches/*
    rm -rf ~/Library/42_cache
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
    rm -rf ~/Library/Application\ Support/Slack/Cache/
    rm -rf ~/Library/Caches/*
    rm -rf ~/Library/42_cache
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
    rm -rf ~/Library/Application\ Support/Slack/Cache/
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
    rm -rf ~/Library/Application\ Support/Slack/Cache/
    rm -rf ~/Library/Developer/CoreSimulator/Caches/
    rm -rf ~/Library/Developer/CoreSimulator/Devices/
    rm -rf ~/Library/Logs/
    rm -rf ~/Library/Google/GoogleSoftwareUpdate/
    rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/
    rm -rf ~/Library/Application\ Support/Code/CachedData/
    rm -rf ~/Library/Application\ Support/Slack/logs
    rm -rf ~/Library/Application\ Support/zoom.us/AutoUpdater
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics/.
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics-spare.pma
    rm -rf ~/Library/Application\ Support/Google/Chrome/GrShaderCache/GPUCache/
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Local\ Extension Settings/cjpalhdlnbpafiamejdnhcphjbkeiagm/lost
    rm -rf ~/Library/Application\ Support/Code/Cache/
    rm -rf ~/Library/Application\ Support/Code/CachedExtensionVSIXs/
    rm -rf ~/Library/Application\ Support/Code/Code\ Cache/
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/
    rm -rf  ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/ScriptCache/
    rm -rf ~/Library/Application\ Support/Google/Chrome/ShaderCache/GPUCache/
    rm -rf ~/Library/Application\ Support/Code/CachedExtensions/
    rm -rf ~/Library/Application\ Support/Code/logs/
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage/
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/ScriptCache/
    rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/
    rm -rf ~/.Trash/
    #brew cleanup && echo "clean complete"
    echo $GREEN"clean complete"$RESET
}

function brewinstall {
	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
	# reset
	brew install lcov
	# brew install gcovr
	brew install check
	sleep 1
	reset
}

function die() {
	echo $RED----------------- DIE -----------------$RESET
	rm -rf ~/.zshrc
	rm -rf ~/.school_resources_for_peer
}

function helpme {
	cat ~/.school_resources_for_peer/helpme.md
}

while true; do
    show-menu
    read -rsn1 key
    case $key in
        "")
            clear
            if [[ $selected -eq $(( ${#menu[@]} - 1 )) ]]; then # Exit
                tput cnorm
                break
            else
                line=${menu[$selected]}
                # Main Code
                if [ "$line" == "Update script" ]
                    then
                    die
                	echo $RED----------------- AND -----------------$RESET
	                curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.zshrc ; source ~/.zshrc ;  init_setup
                    break
                # elif [ "$line" == "Process Stats" ]
                #     then
                #     ps=$(ps -Ao comm,user,cputime,pcpu,pmem,sz,rss,vsz,nlwp,psr,pri,ni)
                #     printf "%s\n" "${ps[@]}" | head -n 1
                #     printf "%s\n" "${ps[@]}" | sort -r -nk4 | head -n 20
                elif [ "$line" == "Memory space information" ]
                    then
                    echo $GREEN"----- MEMORY STATS -----"$RESET
                    sleep 1
                    echo "Available now:"
                    df -h ~
                elif [ "$line" == "Clear the memory" ]
                    then
                    clear_mem
                elif [ "$line" == "[ CLEAR ALL CASHE ]" ]
                    then
                    clear_cashe
				elif [ "$line" == "install brew+lcov+check" ]
                    then
                    brewinstall
					break
                elif [ "$line" == "Docker link" ]
                    then
                    docker_link
                elif [ "$line" == "Docker copy apt" ]
                    then
                    docker_copy_apt
                elif [ "$line" == "Docker link + copy apt" ]
                    then
                    docker_link
                    docker_copy_apt
				elif [ "$line" == "README" ]
                    then
                    cat ~/.school_resources_for_peer/helpme.md
                elif [ "$line" == "parrot.live" ]
                    then
                    echo $YELLOW"----- PREPARE FOR THE SHOW -----"$RESET
                    sleep 1
                    curl parrot.live
                fi
                read -p "Press Enter to continue..."
            fi
            clear
        ;;
        # up
        "A"|"a")
            if [[ $selected -gt 0 ]]; then
                selected=$((selected-1))
            fi
        ;;
        "B"|"b")
         # down
            if [[ $selected -lt $(( ${#menu[@]} - 1 )) ]]; then
                selected=$((selected+1))
            fi
        ;;
        "Q"|"q")
         # exit
            reset
            exit
        ;;
    esac
done

