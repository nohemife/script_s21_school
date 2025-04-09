#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- alias

alias restart="source ~/.zshrc"

alias gw="gcc -Wall -Wextra -Werror"
alias gw+="g++ -Wall -Wextra -Werror"

alias gwd="gcc -Wall -Wextra -Werror -g"
alias gwd+="g++ -Wall -Wextra -Werror -g"

alias gdb="gcc -g"
alias gdb+="g++ -g"

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

alias pushd="git status; git add .; git status; git commit -m 'autocommit alias zshrc'; git push origin develop"
alias pushn="git status; git add .; git status; git commit -m 'autocommit alias zshrc'; git push origin $(whoami)"

alias gsd="git switch develop"
alias gsn="git switch $(whoami)"

USERNAME=whoami
if [ $USERNAME = "nohemife" ]; then
# echo $USERNAME
alias docker="/Applications/Docker.app/Contents/Resources/bin/docker"
fi

# -------------------------------------------------------------------------- color

# ----- VARIABLES ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
MAGENTA=$'\033[0;35m'
RESET=$'\033[0;m'
# --------------------- #

# -------------------------------------------------------------------------- 

function work_dir() {
	cd $(echo $(git rev-parse --show-toplevel))
}

# -------------------------------------------------------------------------- compilation

function comp() {
	gcc -Wall -Wextra -Werror "$1.c" -o "$1.o"
	./"$1.o"
}

# -------------------------------------------------------------------------- mem

function mem() {
	sh ~/.school_resources_for_peer/menu/clear_mem.sh
}

# -------------------------------------------------------------------------- link docker

function lndoc() {
	sh ~/.school_resources_for_peer/linkdoc.sh
}

# -------------------------------------------------------------------------- apt docker

function aptdoc() {
	cat ~/.school_resources_for_peer/aptdoc.txt | pbcopy
}

# -------------------------------------------------------------------------- 
function fm() {
    ((du -s * | sort -nr | cut -f 2-) && (du -s .* | sort -nr | cut -f 2-)) |\
    while read a; do
        du -hs "$a"
    done
}

function fm0() {
	du -s *|sort -nr|cut -f 2-|while read a;do du -hs $a;done
}
function fm1() {
	du -s .*|sort -nr|cut -f 2-|while read a;do du -hs $a;done
}
function fm2() {
	du -s * .*|sort -nr|cut -f 2-|while read a;do du -hs $a;done
}
# -------------------------------------------------------------------------- 
