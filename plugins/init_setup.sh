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

function init_setup() {
	echo $RED---------------- ARISE ----------------$RESET
	if [ ! -d "~/.school_resources_for_peer" ]; then
		mkdir -p ~/.school_resources_for_peer
		mkdir -p ~/.school_resources_for_peer/.vscode
		mkdir -p ~/.school_resources_for_peer/menu
		mkdir -p ~/.school_resources_for_peer/plugins
	fi

	if [ -f "~/.zsh.conf" ]; then
		curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.zsh.conf
	fi

	rm -rf ~/.zshrc
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/.zshrc >~/.zshrc

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

	# del
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/main.sh >~/.school_resources_for_peer/main.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.zsh.conf
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clang-format >~/.school_resources_for_peer/.clang-format
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zcompdump >~/.school_resources_for_peer/.zcompdump
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt >~/.school_resources_for_peer/date.txt
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/configurator.sh >~/.school_resources_for_peer/configurator.sh
	chmod +x ~/.school_resources_for_peer/configurator.sh
	chmod +x ~/.school_resources_for_peer/main.sh
	chmod +x ~/.school_resources_for_peer/menu/menu.sh

	# VScode debug
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/launch.json >~/.school_resources_for_peer/.vscode/launch.json
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/tasks.json >~/.school_resources_for_peer/.vscode/tasks.json

	# APPs Docker
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/aptdoc.txt >~/.school_resources_for_peer/aptdoc.txt

	# README
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/new.txt >~/.school_resources_for_peer/new.txt
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/helpme.md >~/.school_resources_for_peer/helpme.md
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/README.md >~/.school_resources_for_peer/README.md

	sleep 1
	echo $GREEN"Install complete! Enjoy!"$RESET
	reset
}

# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/plugins/init_setup.sh > ~/.zshrc ; source ~/.zshrc ;  init_setup ; source ~/.zshrc

# --------------------------------------------------------------------------
