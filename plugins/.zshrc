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

source ~/.school_resources_for_peer/plugins/init_setup.sh

# -------------------------------------------------------------------------- console menu

function menu() {
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

function grind() {
	# mkdir Valgrind
	# cp ~/.school_resources_for_peer/Valgrind/Dockerfile Valgrind/Dockerfile
	# cp ~/.school_resources_for_peer/Valgrind/run.sh Valgrind/run.sh
	# cp ~/.school_resources_for_peer/Valgrind/start.sh Valgrind/start.sh

}

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

# -------------------------------------------------------------------------- END

source ~/.school_resources_for_peer/plugins/other.sh

# -------------------------------------------------------------------------- 
