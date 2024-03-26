# -------------------------------------------------------------------------- alias

alias restart="source ~/.zshrc"
alias gw="gcc -Wall -Wextra -Werror"
alias gwd="gcc -Wall -Wextra -Werror -g"
alias gdb="gcc -g"
alias dir="ls -la"
alias /="cd .."
alias //="cd -"
alias ce="configedit"
alias ff="fixformat"
alias cc="cpp_check"
alias fs="find_sql"
alias m="menu"
alias rmh="rm -rf ~/.zsh_history"
alias rc="nano ~/.zshrc && source ~/.zshrc"
alias rcm="nano ~/.school_resources_for_peer/main.sh"
alias work="work_dir"
alias vsc="open . -a 'Visual studio code'"
alias pushd="git push origin develop"
alias pushn="git push origin $(whoami)"
alias gsd="git switch develop"
alias gsn="git switch $(whoami)"

# -------------------------------------------------------------------------- OS

OS=$(echo $(uname -s) | tr '[:upper:]' '[:lower:]') 
if [ "$OS" = "darwin" ];then
	MAC=$(echo "''")
fi

# -------------------------------------------------------------------------- TAG version

TAG=1.0.0

# -------------------------------------------------------------------------- color

# ----- VARIABLES ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
MAGENTA=$'\033[0;35m'
RESET=$'\033[0;m'

# -------------------------------------------------------------------------- omz

autoload -U compaudit compinit zrecompile

compinit -i -d "$ZSH_COMPDUMP"

# fixme - the load process here seems a bit bizarre
zmodload -i zsh/complist

WORDCHARS=''

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select

# case insensitive (all), partial-word and substring completion
if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

if [[ "$OSTYPE" = solaris* ]]; then
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm"
else
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"
fi

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

if [[ ${COMPLETION_WAITING_DOTS:-false} != false ]]; then
  expand-or-complete-with-dots() {
    # use $COMPLETION_WAITING_DOTS either as toggle or as the sequence to show
    [[ $COMPLETION_WAITING_DOTS = true ]] && COMPLETION_WAITING_DOTS="%F{red}…%f"
    # turn off line wrapping and print prompt-expanded "dot" sequence
    printf '\e[?7l%s\e[?7h' "${(%)COMPLETION_WAITING_DOTS}"
    zle expand-or-complete
    zle redisplay
  }
  zle -N expand-or-complete-with-dots
  # Set the function as the default tab completion widget
  bindkey -M emacs "^I" expand-or-complete-with-dots
  bindkey -M viins "^I" expand-or-complete-with-dots
  bindkey -M vicmd "^I" expand-or-complete-with-dots
fi

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# -------------------------------------------------------------------------- autoupdate

# {
# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt > ~/.school_resources_for_peer/update.txt
# diff -q ~/.school_resources_for_peer/date.txt ~/.school_resources_for_peer/update.txt
# } &> /dev/null
# NEW=$(echo $?)
# # reset
# if [ $NEW -eq 1 ]; then
# # printf $NEW'\n'
# i=0
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# RESET=$(tput sgr0)

# UPDATE=$(cat ~/.school_resources_for_peer/update.txt)
# while [ $i -ne 6 ]
# do
#     clear
#     sleep 0.2
#     if [ $((i % 2)) -eq 0 ]; then
#         echo "${RED}[ NEW VERSION AVAILABLE! ENTER COMMAND ${GREEN}NR${RED} TO UPDATE! ] DATE: $UPDATE${RESET}"
#         sleep 0.4
#     fi
#     i=$((i+1))  # Арифметическое выражение для инкремента переменной i
# done
# reset
# echo "$RED [ NEW VERSION AVAILABLE! ENTER COMMAND$GREEN NR$RED TO UPDATE! ] DATE: $UPDATE$RESET"
# rm -rf ~/.school_resources_for_peer/update.txt
# fi

{
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt >~/.school_resources_for_peer/update.txt
	diff -q ~/.school_resources_for_peer/date.txt ~/.school_resources_for_peer/update.txt
} &>/dev/null
NEW=$(echo $?)
# reset
if [ $NEW -eq 1 ]; then
	# printf $NEW'\n'
	i=0
	RED=$(tput setaf 1)
	GREEN=$(tput setaf 2)
	RESET=$(tput sgr0)

	UPDATE=$(cat ~/.school_resources_for_peer/update.txt)
	while [ $i -ne 6 ]; do
		clear
		sleep 0.2
		if [ $((i % 2)) -eq 0 ]; then
			echo "${RED}[ NEW VERSION AVAILABLE! DATE: ${GREEN}$UPDATE${RED} TO UPDATE! ] ${RESET}"
			sleep 0.4
		fi
		i=$((i + 1))
	done
	reset
	echo "${RED}[ NEW VERSION AVAILABLE! DATE: ${GREEN}$UPDATE${RED} TO UPDATE! ] ${RESET}"
	rm -rf ~/.school_resources_for_peer/update.txt
	echo "Пропустить текущее обновление "ESC""
	echo "Обновить скрипт до новой версии [ y / n ]: "
	# if [ $RUN ]
	# echo $RUN
	while true; do
		zle -R
		read -k1 key
		# read key
		# read -rsn1 key
		case $key in
		"Y" | "y" | "YES" | "yes" | "YEs" | "yES" | "YeS" | "yeS" | "yEs")
			# yes
			# echo $key
			# break
			die
			echo $RED----------------- AND -----------------$RESET
			curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt >~/.school_resources_for_peer/date.txt
			curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc >~/.zshrc
			source ~/.zshrc
			init_setup
			reset
			break
			restart
			;;
		"N" | "n" | "NO" | "no" | "No" | "nO")
			# no
			# echo $key
			break
			;;
		$'\e') # Обработка клавиши Escape
			echo $key
			curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt >~/.school_resources_for_peer/date.txt
			reset
			break
			restart
			;;
		*)
			break
			;;
			# $'\r') # Обработка клавиши Enter
			# echo $key
			# # curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt > ~/.school_resources_for_peer/date.txt
			# break
			# ;;
		esac
	done
fi

# -------------------------------------------------------------------------- parse branch

IFS="= " read name theme <<< $(echo $(cat ~/.school_resources_for_peer/.zsh.conf | grep "THEME ="))
# echo $theme
# theme=$(echo $theme)

if [ $theme -eq 0 ]; then
	echo "old style " $theme
	clear
fi

if [ $theme -eq 1 ]; then
	echo "new style " $theme
	clear
	COLOR_DEF='%f'
	COLOR_DIR='%F{197}'
	COLOR_GIT='%F{39}'
	NEWLINE=$'\n'
	setopt PROMPT_SUBST
	export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

	parse_git_branch() {
		git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
	}
fi

# COLOR_DEF='%f'
# COLOR_DIR='%F{197}'
# COLOR_GIT='%F{39}'
# NEWLINE=$'\n'
# setopt PROMPT_SUBST
# export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

# parse_git_branch() {
# 	git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
# }

# function comp() {
# 	gcc -Wall -Wextra -Werror "$1.c" -o "$1.o"
# 	./"$1.o"
# }

# -------------------------------------------------------------------------- init setup

function init_setup() {
	echo $RED---------------- ARISE ----------------$RESET
	if [ ! -d "~/.school_resources_for_peer" ]; then
		mkdir ~/.school_resources_for_peer
		mkdir ~/.school_resources_for_peer/.vscode
		# mkdir ~/.school_resources_for_peer/Valgrind
	fi
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.zsh.conf
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc >~/.school_resources_for_peer/.zshrc
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zcompdump >~/.school_resources_for_peer/.zcompdump
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt >~/.school_resources_for_peer/date.txt
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/main.sh >~/.school_resources_for_peer/main.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/configurator.sh >~/.school_resources_for_peer/configurator.sh
	chmod +x ~/.school_resources_for_peer/configurator.sh
	chmod +x ~/.school_resources_for_peer/main.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clang-format >~/.school_resources_for_peer/.clang-format

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clean.sh >~/.school_resources_for_peer/clean.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clear.sh >~/.school_resources_for_peer/clear.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/launch.json >~/.school_resources_for_peer/.vscode/launch.json
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/tasks.json >~/.school_resources_for_peer/.vscode/tasks.json

	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/Dockerfile > ~/.school_resources_for_peer/Valgrind/Dockerfile
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/run.sh > ~/.school_resources_for_peer/Valgrind/run.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/start.sh > ~/.school_resources_for_peer/Valgrind/start.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/linkdoc.sh > ~/.school_resources_for_peer/linkdoc.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/aptdoc.sh > ~/.school_resources_for_peer/aptdoc.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/aptdoc.txt >~/.school_resources_for_peer/aptdoc.txt

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/new.txt >~/.school_resources_for_peer/new.txt
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/helpme.md >~/.school_resources_for_peer/helpme.md
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/README.md >~/.school_resources_for_peer/README.md
	sleep 1
	echo $GREEN"Install complete! Enjoy!"$RESET
	reset
}

# -------------------------------------------------------------------------- console menu

function menu() {
	bash ~/.school_resources_for_peer/main.sh
}

# -------------------------------------------------------------------------- theme

function theme() {
	# bash ~/.school_resources_for_peer/theme.sh

show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
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

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        0) clear;
            option_picked "Option 0 Picked";
            sed -i $MAC 's/THEME = [0-9]*/THEME = 0/' ~/.school_resources_for_peer/.zsh.conf
			exit;
            # break;
        ;;
        1) clear;
            option_picked "Option 1 Picked";
            sed -i $MAC 's/THEME = [0-9]*/THEME = 1/' ~/.school_resources_for_peer/.zsh.conf
			exit;
            # break;
        ;;
        2) clear;
            option_picked "Option 2 Picked";
            sed -i $MAC 's/THEME = [0-9]*/THEME = 2/' ~/.school_resources_for_peer/.zsh.conf
            exit;
            # break;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            sed -i $MAC 's/THEME = [0-9]*/THEME = 3/' ~/.school_resources_for_peer/.zsh.conf
            # show_menu;
            # bash | restart
            break;
        ;;
        x)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done
}

# -------------------------------------------------------------------------- cppcheck

function cpp_check() {
	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
	processed_files=()
	dir_to_remove="./"
	for file in "${files_array[@]}"; do
		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
	done
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo -------------- CPP CHECK --------------
		# printf '\n'
		cppcheck --enable=all --suppress=missingIncludeSystem ${processed_files[@]}
		echo ----------------- END -----------------
	fi
}

# -------------------------------------------------------------------------- format google

function fixformat() {
	# files_array=($(find . -type f \( -name "*.c" -o -name "*.h" \)))
	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
	# Создаем отдельный массив для обработанных файлов
	processed_files=()

	# Указываем часть директории, которую нужно удалить
	dir_to_remove="./"

	# Обходим каждый элемент в files_array, обрабатываем и добавляем в processed_files
	for file in "${files_array[@]}"; do
		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
	done

	# # Выводим список обработанных файлов
	# echo "Обработанные файлы:"
	# for file in "${processed_files[@]}"; do
	# 	echo "$file"
	# done

	# # Пример использования обработанных файлов
	# for processed_file in "${processed_files[@]}"; do
	# 	if [ -f "$processed_file" ]; then
	#	 	echo "$processed_file существует"
	#	 # Здесь можно проводить дополнительные действия с каждым обработанным файлом
	# 	fi
	# done

	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo ---------------- CHECK ----------------
		# printf '\n'
		clang-format -style=google -n ${processed_files[@]}
	fi
	sleep 1
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo ----------------- FIX -----------------
		# printf '\n'
		clang-format -style=google -i ${processed_files[@]}
	fi
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo ---------------- CHECK ----------------
		# printf '\n'
		clang-format -style=google -n ${processed_files[@]}
	fi
	# reset
	# v3.0
	# #shopt -s nullglob  # Эта команда говорит о том, что пустые шаблоны должны раскрываться в пустой список, а не сами шаблоны
	# # files=(*.c *.h */*.c */*.h */*/*.c */*/*.h)  # Получаем список всех файлов с расширением .c в указанной директории
	# # find . -type f -name "*.c"

	# # Сохраняем вывод команды find в переменную files_array
	# files_array=($(find . -type f -name "*.c"), $(find . -type f -name "*.h"))
	# # Создаем массив files и копируем результаты из files_array
	# files=("${files_array[@]}")

	# # Указываем часть директории, которую нужно удалить
	# dir_to_remove="./"
	# # Цикл для обработки каждого элемента массива files
	# for ((i=0; i<${#files[@]}; i++)); do
	# # Используем подстроку для удаления части строки с путем к директории
	# 	files[$i]=${files[$i]#"$dir_to_remove"}
	# done
	# v2.0
	# clang-format -style=google -n *.c *.h
	# sleep 1
	# clang-format -style=google -i *.c *.h
	# clang-format -style=google -n *.c *.h
	# v1.0
	# cp ~/.school_resources_for_peer/.clang-format .clang-format
	# .clang-format -i *.c *.h
	# .clang-format -n *.c *.h
	# rm .clang-format
}

# -------------------------------------------------------------------------- VS debug

# function vdb() {
# 	workdir=$(git rev-parse --show-toplevel)/
#   	# printf $(git rev-parse --show-toplevel)/
# 	if [ ! -d "$workdir.vscode" ]
# 	then
# 	mkdir $workdir.vscode
# 	cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
# 	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
# 	else
# 	prog=$(echo $GREEN vdb!)
# 	printf $RED"File exists! Use command: $prog "$RESET
# 	fi
# }

function vdb() {
	workdir=$(git rev-parse --show-toplevel)/
	# printf $(git rev-parse --show-toplevel)
	# echo $(git -c alias.root='!pwd' root)
	# echo $(git rev-parse --show-cdup)
	if [ ! -d "$workdir.vscode" ]; then
		echo "Путь к исполняемому файлу: $workdir"src/"$GREEN"a.out""$RESET
		echo "Введи имя своего исполняемого файла: "
		zle -R
		read file
		mkdir $workdir.vscode
		cat ~/.school_resources_for_peer/.vscode/launch.json | sed $(echo 's|a.out|'"$file"'|') >$workdir.vscode/launch.json
		# cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
		cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
		echo "Путь к исполняемому файлу: $workdir"src/"$GREEN$file"$RESET
	else
		# prog=$(echo $GREEN vdb!)
		# printf $RED"File exists! Use command: $prog "$RESET
		echo "Файлы существуют, заменить? [ y / n ]: "
		while true; do
			zle -R
			read -k1 key
			# read key
			# read -rsn1 key
			case $key in
			"Y" | "y" | "YES" | "yes" | "YEs" | "yES" | "YeS" | "yeS" | "yEs")
				clear
				vdb!
				break
				;;
			"N" | "n" | "NO" | "no" | "No" | "nO")
				break
				;;
			$'\e') # Обработка клавиши Escape
				break
				;;
			esac
		done
	fi
}

# function vdb!() {
# 	workdir=$(git rev-parse --show-toplevel)/
# 	# printf $(git rev-parse --show-toplevel)
# 	# echo $(git -c alias.root='!pwd' root)
# 	# echo $(git rev-parse --show-cdup)
# 	rm -rf $workdir.vscode
# 	mkdir $workdir.vscode
# 	cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
# 	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
# }

function vdb!() {
	workdir=$(git rev-parse --show-toplevel)/
	# printf $(git rev-parse --show-toplevel)
	# echo $(git -c alias.root='!pwd' root)
	# echo $(git rev-parse --show-cdup)
	rm -rf $workdir.vscode
	echo "Путь к исполняемому файлу: $workdir"src/"$GREEN"a.out""$RESET
	echo "Введи имя своего исполняемого файла: "
	zle -R
	read file
	mkdir $workdir.vscode
	cat ~/.school_resources_for_peer/.vscode/launch.json | sed $(echo 's|a.out|'"$file"'|') >$workdir.vscode/launch.json
	# cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
	echo "Путь к исполняемому файлу: $workdir"src/"$GREEN$file"$RESET
}

# -------------------------------------------------------------------------- old valgrind

function grind() {
	mkdir Valgrind
	cp ~/.school_resources_for_peer/Valgrind/Dockerfile Valgrind/Dockerfile
	cp ~/.school_resources_for_peer/Valgrind/run.sh Valgrind/run.sh
	cp ~/.school_resources_for_peer/Valgrind/start.sh Valgrind/start.sh
}

# -------------------------------------------------------------------------- sql

function sql() {

	dir=$(echo $(git rev-parse --show-toplevel))
	# sql=$(echo $dir | grep -io sql)
	# if [[ $sql =~ ^[Ss][Qq][Ll]$ ]]; then
	# if [$dir]; then
	sql=$(echo $dir | grep -ic SQL_beginner)
	day=$(echo $dir | grep -ic day)
	# team=$(echo $dir | grep -iс team)
	echo $dir
	echo $day
	if [ $day -ne 0 ]; then
		day=$(echo day)
	else
		day=$(echo team)
	fi
	if [[ $sql -eq 1 ]]; then
		echo $GREEN"Find SQL project: $dir"$RESET '\n'
		# Пример исполнения скрипта: sql 5 12
		# 5 - day / день
		# 12 - exercise / количество заданий
		echo "Введи номер дня: "
		zle -R
		read 1
		echo "Введи количество заданий: "
		zle -R
		read 2
		# echo $1
		if [ $1 -ne 0 ]; then
		echo ops
			1=$(echo $1 | awk '$0*=1') # удаление нулей у дня
		fi
		# echo $2
		2=$(echo $2 | awk '$0*=1') # удаление нулей у заданий
		if [ ! -d "$dir/src" ]; then
			mkdir $dir/src
		fi
		cd $dir/src

		# if [ ! -d "$dir/src/ex" ]; then
		i=0
		while [ $i -le $2 ]; do
			if [[ $1 -lt 10 ]]; then
				null=$(echo 0)
			else
				null=""
			fi
			# echo $null

			if [[ $i -lt 10 ]]; then
				# echo ex0$i
				if [ ! -d "ex0$i" ]; then
					mkdir ex0$i
					echo $GREEN"Directory ex0$i create!"$RESET
				else
					echo $RED"Directory ex0$i exists!"$RESET
				fi
				if [ ! -f "ex0$i/$day$null$1_ex0$i.sql" ]; then
					touch ex0$i/$day$null$1_ex0$i.sql
					echo $GREEN"File ex0$i/$day$null$1_ex0$i.sql create!"$RESET
				else
					echo $RED"File ex0$i/$day$null$1_ex0$i.sql exists!"$RESET
				fi
			else
				# echo ex$i
				if [ ! -d "ex$i" ]; then
					mkdir ex$i
					echo $GREEN"Directory ex$i create!"$RESET
				else
					echo $RED"Directory ex$i exists!"$RESET
				fi
				if [ ! -f "ex$i/day$null$1_ex$i.sql" ]; then
					touch ex$i/day$null$1_ex$i.sql
					echo $GREEN"File ex$i/$day$null$1_ex$i.sql create!"$RESET
				else
					echo $RED"File ex$i/$day$null$1_ex$i.sql exists!"$RESET
				fi
			fi
			((i++))
		done
		echo '\n'
		echo $GREEN"Create dir and file: src/ex[0-$2]/$day$null$1_ex[0-$2].sql"$RESET
	# fi
	else
		echo $RED"No SQL project"$RESET
	fi
}

function find_sql() {
	dir=$(echo $(git rev-parse --show-toplevel))
	sql=$(echo $dir | grep -ic SQL_beginner)
	if [[ $sql -eq 1 ]]; then
		cd $dir/src
		if [ -f "All_Exercise.sql" ]; then
			rm -rf All_Exercise.sql
		fi
		files_array=($(find . -type f \( -name "*.sql" \)))
		processed_files=()
		dir_to_remove="./"

		echo -------------- FIND FILE -------------- >All_Exercise.sql
		printf '%s\n' "${files_array[@]}" >>All_Exercise.sql
		echo ---------------- START ---------------- >>All_Exercise.sql

		for file in "${files_array[@]}"; do
			processed_file="${file/$dir_to_remove/}"
			printf '------------------------------------------ %s\n' "$processed_file" >>All_Exercise.sql
			cat $processed_file >>All_Exercise.sql
			echo '\n' >>All_Exercise.sql
		done
		# echo '\n' >> All_Exercise.sql
		echo ----------------- END ----------------- >>All_Exercise.sql
	else
		echo $RED"No SQL project"$RESET
	fi
}

# -------------------------------------------------------------------------- git clone

function gclone() {
	cd ~/
	git clone $1
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	cd $project_name
	git checkout -b develop
	open . -a 'Visual studio code'
}

# -------------------------------------------------------------------------- peer review

function peer() {
	if [ ! -d "~/Desktop/peer_review_dir" ]; then
		mkdir ~/Desktop/peer_review_dir
	fi
	cd ~/Desktop/peer_review_dir
	git clone -b develop $1
	# git clone $1
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	# printf $project_name
	# printf '\n'
	new_file_name="$project_name$(date +"_%Y-%m-%d_%H-%M-%S")"
	# printf $new_file_name
	# printf '\n'
	mv $project_name $new_file_name
	# printf $new_file_name
	cd $new_file_name
	open . -a 'Visual studio code'
}

# -------------------------------------------------------------------------- s21_lint

# function lint() {
# 	curl -fsSL https://bun.sh/install | bash
# 	restart
# 	bun add --global github:s21toolkit/s21lint
# }

# function s21() {
# 	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
# 	processed_files=()
# 	dir_to_remove="./"
# 	for file in "${files_array[@]}"; do
# 		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
# 		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
# 	done
# 	if [ ${#processed_files[@]} -ne 0 ]; then
# 		# printf '%s\n' "${processed_files[@]}"
# 		echo -------------- s21lint --------------
# 		# printf '\n'
# 		s21lint ${processed_files[@]}
# 		echo ----------------- END -----------------
# 	fi
# }

function install_bun_lint() {
	curl -fsSL https://bun.sh/install | bash
	restart
	bun add --global github:s21toolkit/s21lint
}

function s21_lint() {
	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
	processed_files=()
	dir_to_remove="./"
	for file in "${files_array[@]}"; do
		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
	done
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo -------------- s21lint --------------
		# printf '\n'
		s21lint ${processed_files[@]}
		echo ----------------- END -----------------
	fi
}

function lint() {
  buna=$(echo bash | bun -v)
  if [ $buna ];then
#   echo $buna 
	s21_lint
  else
#   echo "no bun"
	install_bun_lint
  fi
}

# -------------------------------------------------------------------------- mem

function work_dir() {
	cd $(echo $(git rev-parse --show-toplevel))
}

# -------------------------------------------------------------------------- mem

function mem() {
	sh ~/.school_resources_for_peer/clean.sh
}

# -------------------------------------------------------------------------- brew \ libs

function brewinstall() {
	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
	# restart && reset
	osascript -e 'tell app "Terminal" to do script "brew install pkg-config && brew install lmdb && brew install lcov && brew install gcovr && brew install googletest && brew install cppcheck && killall iTerm2 Terminal"'
	# osascript -e 'tell app "Terminal" to do script "brew install pkg-config && brew install llvm && brew install lmdb && brew install lcov && brew install gcovr && brew install googletest && brew install cppcheck && killall iTerm2 Terminal"'

	# osascript -e 'tell app "Terminal" to do script "brew install check && brew install lcov && brew install gcovr && brew install googletest && brew install cppcheck && killall iTerm2 Terminal"'
	# brew install check
	# brew install lcov
	# brew install gcovr
	# brew install googletest
	# echo $TERM

	# killall Terminal
	# killall iTerm2
	# pkill -a -f Terminal
	# pkill -a -f iTerm2
	# killall Terminal && killall iTerm2
	# ps -o 'ppid=' -p $$
	# ps -p $$ -o comm=
	# w -h | grep $(whoami) | awk '{ print $1 " at " $2 " from " $3; }'
	# kill -9 $(echo $$)
	sleep 3
	exit
	# reset
}

# -------------------------------------------------------------------------- compilation

function comp() {
	gcc -Wall -Wextra -Werror "$1.c" -o "$1.o"
	./"$1.o"
}

# -------------------------------------------------------------------------- NEW RELISE

function NR() {
	die
	echo $RED----------------- AND -----------------$RESET
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc >~/.zshrc
	source ~/.zshrc
	init_setup
	restart
}

# -------------------------------------------------------------------------- link docker

function lndoc() {
	sh ~/.school_resources_for_peer/linkdoc.sh
}

# -------------------------------------------------------------------------- apt docker

function aptdoc() {
	cat ~/.school_resources_for_peer/aptdoc.txt | pbcopy
}

# -------------------------------------------------------------------------- helpme

function helpme() {
	cat ~/.school_resources_for_peer/helpme.md
}

# -------------------------------------------------------------------------- readme

function readme() {
	open "https://github.com/nohemife/script_s21_school/tree/main"
}

# -------------------------------------------------------------------------- new

function new() {
	cat ~/.school_resources_for_peer/new.txt
}

# -------------------------------------------------------------------------- die

function die() {
	echo $RED----------------- DIE -----------------$RESET
	rm -rf ~/.zshrc
	rm -rf ~/.school_resources_for_peer
}

# -------------------------------------------------------------------------- link

# Load Homebrew config script
source $HOME/.brewconfig.zsh

# # bun completions
# [ -s "/Users/nohemife/.bun/_bun" ] && source "/Users/nohemife/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# -------------------------------------------------------------------------- END

function up() {
	sed -i $MAC '/^DATE_BUILD/d' ~/.school_resources_for_peer/.zsh.conf

# # IFS="= " read name value <<< $(echo $(cat ~/.school_resources_for_peer/.zsh.conf | grep "DATE ="))
# value=$(echo $(cat ~/.school_resources_for_peer/.zsh.conf | grep -c "DATE_BUILD = 20"))
# # echo $value
# os=$(uname -s) # Получаем имя операционной системы
# os=$(echo "$os" | tr '[:upper:]' '[:lower:]') # Преобразуем в нижний регистр
# # echo $os
# while [ $value -ne 0 ]; do
#     # if [ $value -eq 1 ]; then
#         if [[ "$os" == "linux" ]]; then
#             sed -i -e '$ d' ~/.school_resources_for_peer/.zsh.conf
#         fi
#         if [[ "$os" == "darwin" ]]; then
#             sed -i '' -e '$ d' ~/.school_resources_for_peer/.zsh.conf
#         fi
#     # fi
#     ((value--))
# done
}

function add() {
	date=$(cat ~/.school_resources_for_peer/date.txt)
	echo "DATE_BUILD = $date" >> ~/.school_resources_for_peer/.zsh.conf
	# rm -rf ~/.school_resources_for_peer/date.txt
}

function co() {
IFS="= " read name date <<< $(echo $(cat ~/.school_resources_for_peer/.zsh.conf | grep "DATE_BUILD = "))
update=$(cat ~/.school_resources_for_peer/date.txt)
echo $date
echo $update
if [ "$date" != "$update" ]; then
    echo "Даты различаются"
else
    echo "Даты равны"
fi
}


function configedit() {
	chmod +x ~/.school_resources_for_peer/configurator.sh
	bash ~/.school_resources_for_peer/configurator.sh
}