#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- init setup

function init_setup() {
	echo $RED---------------- ARISE ----------------$RESET
	if [ ! -d "~/.school_resources_for_peer" ]; then
		mkdir ~/.school_resources_for_peer
		mkdir -p ~/.school_resources_for_peer/.vscode
		mkdir -p ~/.school_resources_for_peer/menu
		mkdir -p ~/.school_resources_for_peer/plugins
		# mkdir ~/.school_resources_for_peer/Valgrind
	fi

	# menu

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zsh.conf >~/.school_resources_for_peer/.zsh.conf.bak



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

# -------------------------------------------------------------------------- 
