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
		mkdir ~/.school_resources_for_peer/.vscode
		mkdir ~/.school_resources_for_peer/Valgrind
	fi
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.school_resources_for_peer/.zshrc
	
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clang-format > ~/.school_resources_for_peer/.clang-format

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clean.sh > ~/.school_resources_for_peer/clean.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clean.sh > ~/.school_resources_for_peer/.clean.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clear.sh > ~/.school_resources_for_peer/clear.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clear.sh > ~/.school_resources_for_peer/.clear.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/launch.json > ~/.school_resources_for_peer/.vscode/launch.json
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/tasks.json > ~/.school_resources_for_peer/.vscode/tasks.json

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/Dockerfile > ~/.school_resources_for_peer/Valgrind/Dockerfile
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/run.sh > ~/.school_resources_for_peer/Valgrind/run.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/start.sh > ~/.school_resources_for_peer/Valgrind/start.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/cleandoc.sh > ~/.school_resources_for_peer/cleandoc.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/helpme.md > ~/.school_resources_for_peer/helpme.md
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/README.md > ~/.school_resources_for_peer/README.md
	reset

}

function fixformat() {
	clang-format -style=google -i test_s21/*.c *.c *.h
	clang-format -style=google -n test_s21/*.c *.c *.h
	# cp ~/.school_resources_for_peer/.clang-format .clang-format
	# .clang-format -i *.c *.h
	# .clang-format -n *.c *.h
	# rm .clang-format
}

function vdb() {
	mkdir .vscode
	cp ~/.school_resources_for_peer/.vscode/launch.json .vscode/launch.json
	cp ~/.school_resources_for_peer/.vscode/tasks.json .vscode/tasks.json
}

function grind() {
	mkdir Valgrind
	cp ~/.school_resources_for_peer/Valgrind/Dockerfile Valgrind/Dockerfile
	cp ~/.school_resources_for_peer/Valgrind/run.sh Valgrind/run.sh
	cp ~/.school_resources_for_peer/Valgrind/start.sh Valgrind/start.sh
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
	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
	reset | bash
	brew tap LouisBrunner/valgrind | bash
	brew install --HEAD LouisBrunner/valgrind/valgrind | bash
	# curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh
	# brew install lcov
	# brew install check
}
function NR() {
	die
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.zshrc ; source ~/.zshrc ;  init_setup
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

# Load Homebrew config script
source $HOME/.brewconfig.zsh
