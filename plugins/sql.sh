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

# -------------------------------------------------------------------------- sql

function sql() {

	dir=$(echo $(git rev-parse --show-toplevel))
	# sql=$(echo $dir | grep -io sql)
	# if [[ $sql =~ ^[Ss][Qq][Ll]$ ]]; then
	# if [$dir]; then
	sql=$(echo $dir | grep -ic SQL_beginner)
	day=$(echo $dir | grep -ic day)
	# team=$(echo $dir | grep -iс team)
	echo $dir
	echo $day
	if [ $day -ne 0 ]; then
		day=$(echo day)
	else
		day=$(echo team)
	fi
	if [[ $sql -eq 1 ]]; then
		echo $GREEN"Find SQL project: $dir"$RESET '\n'
		# Пример исполнения скрипта: sql 5 12
		# 5 - day / день
		# 12 - exercise / количество заданий
		echo "Введи номер дня: "
		zle -R
		read 1
		echo "Введи количество заданий: "
		zle -R
		read 2
		# echo $1
		if [ $1 -ne 0 ]; then
			echo ops
			1=$(echo $1 | awk '$0*=1') # удаление нулей у дня
		fi
		# echo $2
		2=$(echo $2 | awk '$0*=1') # удаление нулей у заданий
		if [ ! -d "$dir/src" ]; then
			mkdir $dir/src
		fi
		cd $dir/src

		# if [ ! -d "$dir/src/ex" ]; then
		i=0
		while [ $i -le $2 ]; do
			if [[ $1 -lt 10 ]]; then
				null=$(echo 0)
			else
				null=""
			fi
			# echo $null

			if [[ $i -lt 10 ]]; then
				# echo ex0$i
				if [ ! -d "ex0$i" ]; then
					mkdir ex0$i
					echo $GREEN"Directory ex0$i create!"$RESET
				else
					echo $RED"Directory ex0$i exists!"$RESET
				fi
				if [ ! -f "ex0$i/$day$null$1_ex0$i.sql" ]; then
					touch ex0$i/$day$null$1_ex0$i.sql
					echo $GREEN"File ex0$i/$day$null$1_ex0$i.sql create!"$RESET
				else
					echo $RED"File ex0$i/$day$null$1_ex0$i.sql exists!"$RESET
				fi
			else
				# echo ex$i
				if [ ! -d "ex$i" ]; then
					mkdir ex$i
					echo $GREEN"Directory ex$i create!"$RESET
				else
					echo $RED"Directory ex$i exists!"$RESET
				fi
				if [ ! -f "ex$i/day$null$1_ex$i.sql" ]; then
					touch ex$i/day$null$1_ex$i.sql
					echo $GREEN"File ex$i/$day$null$1_ex$i.sql create!"$RESET
				else
					echo $RED"File ex$i/$day$null$1_ex$i.sql exists!"$RESET
				fi
			fi
			((i++))
		done
		echo '\n'
		echo $GREEN"Create dir and file: src/ex[0-$2]/$day$null$1_ex[0-$2].sql"$RESET
	# fi
	else
		echo $RED"No SQL project"$RESET
	fi
}

function find_sql() {
	dir=$(echo $(git rev-parse --show-toplevel))
	sql=$(echo $dir | grep -ic SQL_beginner)
	if [[ $sql -eq 1 ]]; then
		cd $dir/src
		if [ -f "All_Exercise.sql" ]; then
			rm -rf All_Exercise.sql
		fi
		files_array=($(find . -type f \( -name "*.sql" \)))
		processed_files=()
		dir_to_remove="./"

		echo -------------- FIND FILE -------------- >All_Exercise.sql
		printf '%s\n' "${files_array[@]}" >>All_Exercise.sql
		echo ---------------- START ---------------- >>All_Exercise.sql

		for file in "${files_array[@]}"; do
			processed_file="${file/$dir_to_remove/}"
			printf '------------------------------------------ %s\n' "$processed_file" >>All_Exercise.sql
			cat $processed_file >>All_Exercise.sql
			echo '\n' >>All_Exercise.sql
		done
		# echo '\n' >> All_Exercise.sql
		echo ----------------- END ----------------- >>All_Exercise.sql
	else
		echo $RED"No SQL project"$RESET
	fi
}

# --------------------------------------------------------------------------
