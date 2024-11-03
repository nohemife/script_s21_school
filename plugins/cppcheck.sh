#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- cppcheck

# function cpp_check() {
# 	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
# 	processed_files=()
# 	dir_to_remove="./"
# 	for file in "${files_array[@]}"; do
# 		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
# 		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
# 	done
# 	if [ ${#processed_files[@]} -ne 0 ]; then
# 		# printf '%s\n' "${processed_files[@]}"
# 		echo -------------- CPP CHECK --------------
# 		# printf '\n'
# 		cppcheck --enable=all --suppress=missingIncludeSystem ${processed_files[@]}
# 		echo ----------------- END -----------------
# 	fi
# }

function cpp_check() {
	FIND_FILE=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.cc" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n'))
	echo "--------------- CPPCHECK ---------------"
	cppcheck --enable=all --suppress=missingIncludeSystem $FIND_FILE
	echo "----------------- END -----------------"
}

# --------------------------------------------------------------------------
