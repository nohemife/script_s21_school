#!/bin/bash
#!/bin/zsh

# -------------------------------------------------------------------------- format google

# function fixformat() {
# 	# files_array=($(find . -type f \( -name "*.c" -o -name "*.h" \)))
# 	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
# 	# Создаем отдельный массив для обработанных файлов
# 	processed_files=()

# 	# Указываем часть директории, которую нужно удалить
# 	dir_to_remove="./"

# 	# Обходим каждый элемент в files_array, обрабатываем и добавляем в processed_files
# 	for file in "${files_array[@]}"; do
# 		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
# 		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
# 	done

# 	# # Выводим список обработанных файлов
# 	# echo "Обработанные файлы:"
# 	# for file in "${processed_files[@]}"; do
# 	# 	echo "$file"
# 	# done

# 	# # Пример использования обработанных файлов
# 	# for processed_file in "${processed_files[@]}"; do
# 	# 	if [ -f "$processed_file" ]; then
# 	#	 	echo "$processed_file существует"
# 	#	 # Здесь можно проводить дополнительные действия с каждым обработанным файлом
# 	# 	fi
# 	# done

# 	if [ ${#processed_files[@]} -ne 0 ]; then
# 		# printf '%s\n' "${processed_files[@]}"
# 		echo ---------------- CHECK ----------------
# 		# printf '\n'
# 		clang-format -style=google -n ${processed_files[@]}
# 	fi
# 	sleep 1
# 	if [ ${#processed_files[@]} -ne 0 ]; then
# 		# printf '%s\n' "${processed_files[@]}"
# 		echo ----------------- FIX -----------------
# 		# printf '\n'
# 		clang-format -style=google -i ${processed_files[@]}
# 	fi
# 	if [ ${#processed_files[@]} -ne 0 ]; then
# 		# printf '%s\n' "${processed_files[@]}"
# 		echo ---------------- CHECK ----------------
# 		# printf '\n'
# 		clang-format -style=google -n ${processed_files[@]}
# 	fi
# 	# reset
# 	# v3.0
# 	# #shopt -s nullglob  # Эта команда говорит о том, что пустые шаблоны должны раскрываться в пустой список, а не сами шаблоны
# 	# # files=(*.c *.h */*.c */*.h */*/*.c */*/*.h)  # Получаем список всех файлов с расширением .c в указанной директории
# 	# # find . -type f -name "*.c"

# 	# # Сохраняем вывод команды find в переменную files_array
# 	# files_array=($(find . -type f -name "*.c"), $(find . -type f -name "*.h"))
# 	# # Создаем массив files и копируем результаты из files_array
# 	# files=("${files_array[@]}")

# 	# # Указываем часть директории, которую нужно удалить
# 	# dir_to_remove="./"
# 	# # Цикл для обработки каждого элемента массива files
# 	# for ((i=0; i<${#files[@]}; i++)); do
# 	# # Используем подстроку для удаления части строки с путем к директории
# 	# 	files[$i]=${files[$i]#"$dir_to_remove"}
# 	# done
# 	# v2.0
# 	# clang-format -style=google -n *.c *.h
# 	# sleep 1
# 	# clang-format -style=google -i *.c *.h
# 	# clang-format -style=google -n *.c *.h
# 	# v1.0
# 	# cp ~/.school_resources_for_peer/.clang-format .clang-format
# 	# .clang-format -i *.c *.h
# 	# .clang-format -n *.c *.h
# 	# rm .clang-format
# }

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
