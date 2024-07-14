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

# -------------------------------------------------------------------------- parse branch

IFS="= " read name theme <<< $(echo $(cat ~/.zsh.conf | grep "THEME ="))
# echo $theme
# theme=$(echo $theme)

if [ $theme -eq 0 ]; then
	# echo "old style " $theme
	clear
fi

if [ $theme -eq 1 ]; then
	# echo "new style " $theme
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

# -------------------------------------------------------------------------- 
