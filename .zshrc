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
		# mkdir ~/.school_resources_for_peer/Valgrind
	fi
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.school_resources_for_peer/.zshrc
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/main.sh > ~/.school_resources_for_peer/main.sh
	chmod +x ~/.school_resources_for_peer/main.sh
	
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clang-format > ~/.school_resources_for_peer/.clang-format

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clean.sh > ~/.school_resources_for_peer/clean.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clear.sh > ~/.school_resources_for_peer/clear.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/launch.json > ~/.school_resources_for_peer/.vscode/launch.json
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/tasks.json > ~/.school_resources_for_peer/.vscode/tasks.json

	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/Dockerfile > ~/.school_resources_for_peer/Valgrind/Dockerfile
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/run.sh > ~/.school_resources_for_peer/Valgrind/run.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/start.sh > ~/.school_resources_for_peer/Valgrind/start.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/linkdoc.sh > ~/.school_resources_for_peer/linkdoc.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/aptdoc.sh > ~/.school_resources_for_peer/aptdoc.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/aptdoc.txt > ~/.school_resources_for_peer/aptdoc.txt

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/helpme.md > ~/.school_resources_for_peer/helpme.md
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/README.md > ~/.school_resources_for_peer/README.md
	reset

}

function menu() {
	bash ~/.school_resources_for_peer/main.sh
}

function fixformat() {
	if [ -f *.c ]; then
		clang-format -style=google -n *.c
	fi
	if [ -f *.h ]; then
		clang-format -style=google -n *.h
	fi
	sleep 1
	if [ -f *.c ]; then
		clang-format -style=google -i *.c
	fi
	if [ -f *.h ]; then
		clang-format -style=google -i *.h
	fi
	if [ -f *.c ]; then
		clang-format -style=google -n *.c
	fi
	if [ -f *.h ]; then
		clang-format -style=google -n *.h
	fi
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
		# rm -rf *
		mv $2 $2_$(date +"%Y-%m-%d")
	fi
	git clone -b develop $1
	open . -a 'Visual studio code'
}

function mem() {
      sh ~/.school_resources_for_peer/clean.sh
}

function brewinstall() {
	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
	reset
	brew install lcov
	brew install check
	sleep 1
	reset
}

function NR() {
	die
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.zshrc ; source ~/.zshrc ;  init_setup
	restart
}

function lndoc() {
	sh ~/.school_resources_for_peer/linkdoc.sh
}

function aptdoc() {
	cat ~/.school_resources_for_peer/aptdoc.txt | pbcopy
	# cat aptdoc.txt | pbcopy
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
