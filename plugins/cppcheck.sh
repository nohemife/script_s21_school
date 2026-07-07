#!/bin/bash

# -------------------------------------------------------------------------- cppcheck

function CppCheck() {
	FIND_FILE=($(find . -type f \( -name "*.c" -o -name "*.h" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n'))
	echo "--------------- CPPCHECK ---------------"
	cppcheck --enable=all --suppress=missingIncludeSystem $FIND_FILE
	echo "----------------- END -----------------"
}

# --------------------------------------------------------------------------
