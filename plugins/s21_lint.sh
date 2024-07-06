# -------------------------------------------------------------------------- s21_lint

# function lint() {
# 	curl -fsSL https://bun.sh/install | bash
# 	restart
# 	bun add --global github:s21toolkit/s21lint
# }

# function s21() {
# 	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
# 	processed_files=()
# 	dir_to_remove="./"
# 	for file in "${files_array[@]}"; do
# 		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
# 		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
# 	done
# 	if [ ${#processed_files[@]} -ne 0 ]; then
# 		# printf '%s\n' "${processed_files[@]}"
# 		echo -------------- s21lint --------------
# 		# printf '\n'
# 		s21lint ${processed_files[@]}
# 		echo ----------------- END -----------------
# 	fi
# }

# function install_bun_lint() {
# 	curl -fsSL https://bun.sh/install | bash
# 	restart
# 	bun add --global github:s21toolkit/s21lint
# }

# function lint() {
#   buna=$(echo bash | bun -v)
#   if [ $buna ];then
# #   echo $buna 
# 	s21_lint
#   else
# #   echo "no bun"
# 	install_bun_lint
#   fi
# }

function install_npm_lint() {
	brewinstall
	brew install npm
	restart
	npm install --global @s21toolkit/lint
}

function s21_lint() {
	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
	processed_files=()
	dir_to_remove="./"
	for file in "${files_array[@]}"; do
		processed_file="${file/$dir_to_remove/}" # Удаляем часть директории из пути
		processed_files+=("$processed_file")     # Добавляем обработанный файл в массив
	done
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo -------------- s21lint --------------
		# printf '\n'
		s21lint ${processed_files[@]}
		echo ----------------- END -----------------
	fi
}

function lint() {
  npm=$(echo bash | npm -v)
  if [ $npm ];then
#   echo $npm 
	s21_lint
  else
#   echo "no bun"
	install_npm_lint
  fi
}

# -------------------------------------------------------------------------- 
