alias restart="source ~/.zshrc"
alias gw="gcc -Wall -Wextra -Werror"
alias gwd="gcc -Wall -Wextra -Werror -g"
alias gdb="gcc -g"
alias dir="ls -la"
alias /="cd .."
alias //="cd -"
alias rmh="rm -rf ~/.zsh_history"
alias rc="nano ~/.zshrc && source ~/.zshrc"
alias work="cd ~/Desktop/"
alias vsc="open . -a 'Visual studio code'"
alias pushd="git push origin develop"
alias pushn="git push origin nohemife"
alias gsd="git switch develop"
alias gsn="git switch nohemife"

TAG=1.0.0

COLOR_DEF='%f'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

function comp() {
	gcc -Wall -Wextra -Werror "$1.c" -o "$1.o"
	./"$1.o"
}


function init_setup() {
	if [ ! -d "~/.school_resources_for_peer" ]
	then
		mkdir ~/.school_resources_for_peer
		mkdir ~/.school_resources_for_peer/vscode
		mkdir ~/.school_resources_for_peer/Valgrind
	fi
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.school_resources_for_peer/.zshrc
	
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clang-format > ~/.school_resources_for_peer/.clang-format

	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clean.sh > ~/.school_resources_for_peer/clean.sh
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clean.sh > ~/.school_resources_for_peer/.clean.sh
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clear.sh > ~/.school_resources_for_peer/clear.sh
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clear.sh > ~/.school_resources_for_peer/.clear.sh

	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/vscode/launch.json > ~/.school_resources_for_peer/vscode/launch.json
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/vscode/tasks.json > ~/.school_resources_for_peer/vscode/tasks.json

	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/Dockerfile > ~/.school_resources_for_peer/Valgrind/Dockerfile
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/run.sh > ~/.school_resources_for_peer/Valgrind/run.sh
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/start.sh > ~/.school_resources_for_peer/Valgrind/start.sh
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/cleandoc.sh > ~/.school_resources_for_peer/cleandoc.sh

	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/helpme.md > ~/.school_resources_for_peer/helpme.md
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/README.md > ~/.school_resources_for_peer/README.md
	reset
}

function fixformat() {
	cp ~/.school_resources_for_peer/.clang-format .clang-format
	.clang-format -i *.c *.h
	.clang-format -n *.c *.h
	# rm .clang-format
}

function vdb() {
	cp ~/.school_resources_for_peer/vscode vscode
}

function grind() {
	cp ~/.school_resources_for_peer/Valgrind Valgrind
}

function peer() {
	if [ ! -d "~/Desktop/peer_review_dir" ]; then
		mkdir ~/Desktop/peer_review_dir
	fi
	cd ~/Desktop/peer_review_dir
	if (( $2 == 1 )); then
		rm -rf *
	fi
	git clone -b develop $1
	open . -a 'Visual studio code'
}

function mem() {
      sh ~/.school_resources_for_peer/clean.sh
}

function memс() {
      sh ~/.school_resources_for_peer/clear.sh
}
function brewinstall() {
	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh
	# brew install lcov
}
function NR() {
	cURL -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.zshrc
	restart
}

function cleandoc() {
	sh ~/.school_resources_for_peer/cleandoc.sh
}

function helpme() {
	cat ~/.school_resources_for_peer/helpme.md
}

function readme() {
	open "https://github.com/nohemife/script_s21_school/tree/main"
}

function die() {
	rm -rf ~/.zshrc
	rm -rf ~/.school_resources_for_peer
}

# Add Homebrew's executable directory to the front of the PATH
export PATH="/Users/nohemife/homebrew/bin:$PATH"
