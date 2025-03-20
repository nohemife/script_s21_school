#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- format google

function fixformat() {
	clang-format --version
	FIND_FILE=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.cc" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n'))
	echo "---------------- FILE -----------------"
	echo $FIND_FILE
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

# --------------------------------------------------------------------------
