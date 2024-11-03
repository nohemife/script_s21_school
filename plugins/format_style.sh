#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- format google

function fixformat() {
	FIND_FILE=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.cc" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n'))
	echo "---------------- CHECK ----------------"
	clang-format -style=google -n $FIND_FILE
	sleep 1
	reset
	echo "----------------- FIX -----------------"
	clang-format -style=google -i $FIND_FILE
	echo "---------------- CHECK ----------------"
	clang-format -style=google -n $FIND_FILE
	echo "----------------- END -----------------"

}

# --------------------------------------------------------------------------
