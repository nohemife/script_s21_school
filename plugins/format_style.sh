#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- format google

# git checkout <имя_ветки> -- <путь/к/файлу>
# git checkout master -- materials/linter/.clang-format
# clang-format --style=file:../materials/linter/.clang-format <путь_к_файлу.cpp>

function FixFormat() {
	clang-format --version
	FIND_FILE=($(find . -type f \( -name "*.c" -o -name "*.h" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n'))
	echo "---------------- FILE -----------------"
	echo $FIND_FILE
	echo "------------ style=Google -------------"
	echo "---------------- CHECK ----------------"
	clang-format -style=Google -n $FIND_FILE
	sleep 10
	reset
	echo "----------------- FIX -----------------"
	clang-format -style=Google -i $FIND_FILE
	echo "---------------- CHECK ----------------"
	clang-format -style=Google -n $FIND_FILE
	echo "----------------- END -----------------"

}

function FixFormatIntensive() {
	FILE=$(echo "$HOME/script_s21_school/plugins/.clang-format")
	cat $FILE
	echo "-------------- intensive --------------"
	clang-format --version
	FIND_FILE=($(find . -type f \( -name "*.c" -o -name "*.h" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n'))
	echo "---------------- FILE -----------------"
	echo $FIND_FILE
	echo "---------------- CHECK ----------------"
	clang-format -style="file:$FILE" -n $FIND_FILE
	# sleep 10
	# reset
	# echo "----------------- FIX -----------------"
	# clang-format -style=Google -i $FIND_FILE
	# echo "---------------- CHECK ----------------"
	# clang-format -style=Google -n $FIND_FILE
	echo "----------------- END -----------------"

}

# --------------------------------------------------------------------------
