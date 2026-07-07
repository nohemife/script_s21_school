#!/bin/bash

# -------------------------------------------------------------------------- alias
alias restart="source $HOME/.bashrc"

alias work="WorkDir"

alias cc="CppCheck"
alias ff="FixFormat"
alias fs="FixFormatIntensive"

alias gsd="git switch develop"
alias gsn="git switch $(whoami)"

alias info="system_libs_info"

alias s21_lint="$HOME/script_s21_school/plugins/s21_lint"
alias keepalive="$HOME/script_s21_school/plugins/keepalive"

function WorkDir() {
	cd $(echo $(git rev-parse --show-toplevel))
}

function init() {
	WORK_DIR=$(echo $(git rev-parse --show-toplevel))
	if [ -d "$WORK_DIR/src" ]; then
		cp $HOME/script_s21_school/plugins/Makefile $WORK_DIR/src/Makefile
		cd $WORK_DIR/src
	fi
}