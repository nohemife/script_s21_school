# -------------------------------------------------------------------------- alias

source ~/.school_resources_for_peer/plugins/alias.sh

# -------------------------------------------------------------------------- OS

OS=$(echo $(uname -s) | tr '[:upper:]' '[:lower:]') 
if [ "$OS" = "darwin" ];then
	MAC=$(echo "''")
fi

# -------------------------------------------------------------------------- config

CONFIG_FILE="$HOME/.zsh.conf"

# -------------------------------------------------------------------------- TAG version

TAG=1.0.0

# -------------------------------------------------------------------------- omz

source ~/.school_resources_for_peer/plugins/zcompdump.sh

# -------------------------------------------------------------------------- autoupdate

source ~/.school_resources_for_peer/plugins/autoupdate.sh

# -------------------------------------------------------------------------- parse branch

source ~/.school_resources_for_peer/plugins/parse_branch.sh

# -------------------------------------------------------------------------- init setup

# source ~/.school_resources_for_peer/plugins/init_setup.sh

function init_setup() {
	echo $RED---------------- ARISE ----------------$RESET
	if [ ! -d "~/.school_resources_for_peer" ]; then
		mkdir -p ~/.school_resources_for_peer
		mkdir -p ~/.school_resources_for_peer/.vscode
		mkdir -p ~/.school_resources_for_peer/menu
		mkdir -p ~/.school_resources_for_peer/plugins
		# mkdir ~/.school_resources_for_peer/Valgrind
	fi

	if [ -f "~/.zsh.conf" ]; then
		curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf > ~/.zsh.conf
	fi

	# menu
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/brewinstall_libs.sh >~/.school_resources_for_peer/menu/brewinstall_libs.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/brewinstall.sh >~/.school_resources_for_peer/menu/brewinstall.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/clear_cashe.sh >~/.school_resources_for_peer/menu/clear_cashe.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/clear_mem.sh >~/.school_resources_for_peer/menu/clear_mem.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/docker_copy_apt.sh >~/.school_resources_for_peer/menu/docker_copy_apt.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/docker_link.sh >~/.school_resources_for_peer/menu/docker_link.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/install_googletest.sh >~/.school_resources_for_peer/menu/install_googletest.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/mem_info.sh >~/.school_resources_for_peer/menu/mem_info.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/menu/menu.sh >~/.school_resources_for_peer/menu/menu.sh


	# plugins
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/.zshrc >~/.school_resources_for_peer/plugins/.zshrc
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/alias.sh >~/.school_resources_for_peer/plugins/alias.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/autoupdate.sh >~/.school_resources_for_peer/plugins/autoupdate.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/brew_libs.sh >~/.school_resources_for_peer/plugins/brew_libs.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/cppcheck.sh >~/.school_resources_for_peer/plugins/cppcheck.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/format_style.sh >~/.school_resources_for_peer/plugins/format_style.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/git.sh >~/.school_resources_for_peer/plugins/git.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/init_setup.sh >~/.school_resources_for_peer/plugins/init_setup.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/other.sh >~/.school_resources_for_peer/plugins/other.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/parse_branch.sh >~/.school_resources_for_peer/plugins/parse_branch.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/s21_lint.sh >~/.school_resources_for_peer/plugins/s21_lint.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/sql.sh >~/.school_resources_for_peer/plugins/sql.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/theme.sh >~/.school_resources_for_peer/plugins/theme.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/VS_debug.sh >~/.school_resources_for_peer/plugins/VS_debug.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/zcompdump.sh >~/.school_resources_for_peer/plugins/zcompdump.sh


	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.zsh.conf
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc >~/.school_resources_for_peer/.zshrc
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zcompdump >~/.school_resources_for_peer/.zcompdump
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt >~/.school_resources_for_peer/date.txt
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/main.sh >~/.school_resources_for_peer/main.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/configurator.sh >~/.school_resources_for_peer/configurator.sh
	chmod +x ~/.school_resources_for_peer/configurator.sh
	chmod +x ~/.school_resources_for_peer/main.sh
	chmod +x ~/.school_resources_for_peer/menu/menu.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clang-format >~/.school_resources_for_peer/.clang-format

	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clean.sh >~/.school_resources_for_peer/clean.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clear.sh >~/.school_resources_for_peer/clear.sh

	# VScode debug
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

function install_dialog() {
# function id() {
BRW=$(echo $(brew --version)) 

DIALOG=$(echo $(dialog --version)) 
if [ ! "$DIALOG" ];then
	if [ "$OS" = "darwin" ];then
		if [ ! "$BRW" ];then
			curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
		fi
		osascript -e 'tell app "Terminal" to do script "brew install dialog && killall iTerm2 Terminal"'
	else
		sudo apt update -y
		sudo apt install dialog -y
	fi
fi
restart && reset
}

function menu() {
	install_dialog
	bash ~/.school_resources_for_peer/menu/menu.sh
}
function main() {
	bash ~/.school_resources_for_peer/main.sh
}
# -------------------------------------------------------------------------- theme

source ~/.school_resources_for_peer/plugins/theme.sh

# -------------------------------------------------------------------------- cppcheck

source ~/.school_resources_for_peer/plugins/cppcheck.sh

# -------------------------------------------------------------------------- format google

source ~/.school_resources_for_peer/plugins/format_style.sh

# -------------------------------------------------------------------------- VS debug

source ~/.school_resources_for_peer/plugins/VS_debug.sh

# -------------------------------------------------------------------------- old valgrind

# function grind() {
	# mkdir Valgrind
	# cp ~/.school_resources_for_peer/Valgrind/Dockerfile Valgrind/Dockerfile
	# cp ~/.school_resources_for_peer/Valgrind/run.sh Valgrind/run.sh
	# cp ~/.school_resources_for_peer/Valgrind/start.sh Valgrind/start.sh

# }

# -------------------------------------------------------------------------- sql

source ~/.school_resources_for_peer/plugins/sql.sh

# -------------------------------------------------------------------------- git clone
# -------------------------------------------------------------------------- peer review

source ~/.school_resources_for_peer/plugins/git.sh

# -------------------------------------------------------------------------- s21_lint

source ~/.school_resources_for_peer/plugins/s21_lint.sh

# -------------------------------------------------------------------------- brew \ libs

source ~/.school_resources_for_peer/plugins/brew_libs.sh

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

# -------------------------------------------------------------------------- link

# Load Homebrew config script
source $HOME/.brewconfig.zsh

# # bun completions
# [ -s "/Users/nohemife/.bun/_bun" ] && source "/Users/nohemife/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/usr/local/Qt-6.6.2/bin:$PATH"

# -------------------------------------------------------------------------- END

source ~/.school_resources_for_peer/plugins/other.sh

# -------------------------------------------------------------------------- 

# python3 -m venv /Users/nohemife/.venv 
# source /Users/nohemife/.venv/bin/activate
# cd .gcovr-6.0
# pip install .

# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/.zshrc > ~/.zshrc ; source ~/.zshrc ;  init_setup