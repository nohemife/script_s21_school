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

# --------------------------------------------------------------------------
# -------------------------------------------------------------------------- die

function die() {
	echo $RED----------------- DIE -----------------$RESET
	rm -rf ~/.zshrc
	rm -rf ~/.school_resources_for_peer
}

# --------------------------------------------------------------------------
# -------------------------------------------------------------------------- NEW RELISE

function NR() {
	die
	echo $RED----------------- AND -----------------$RESET
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc >~/.zshrc
	source ~/.zshrc
	init_setup
	restart
}

# --------------------------------------------------------------------------
