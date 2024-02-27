# -------------------------------------------------------------------------- alias

alias restart="source ~/.zshrc"
alias gw="gcc -Wall -Wextra -Werror"
alias gwd="gcc -Wall -Wextra -Werror -g"
alias gdb="gcc -g"
alias dir="ls -la"
alias /="cd .."
alias //="cd -"
alias ff="fixformat"
alias rmh="rm -rf ~/.zsh_history"
alias rc="nano ~/.zshrc && source ~/.zshrc"
alias rcm="nano ~/.school_resources_for_peer/main.sh"
# alias work="cd echo $(git rev-parse --show-toplevel)"
alias vsc="open . -a 'Visual studio code'"
alias pushd="git push origin develop"
alias pushn="git push origin nohemife"
alias gsd="git switch develop"
alias gsn="git switch nohemife"

# -------------------------------------------------------------------------- TAG version

TAG=1.0.0

# -------------------------------------------------------------------------- color

# ----- VARIABLES ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
MAGENTA=$'\033[0;35m'
RESET=$'\033[0;m'

# -------------------------------------------------------------------------- autoupdate

{
curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt > ~/.school_resources_for_peer/update.txt 
diff -q ~/.school_resources_for_peer/date.txt ~/.school_resources_for_peer/update.txt 
} &> /dev/null
NEW=$(echo $?)
# reset
if [ $NEW -eq 1 ]; then
# printf $NEW'\n'
i=0
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

UPDATE=$(cat ~/.school_resources_for_peer/update.txt)
while [ $i -ne 6 ]
do
    clear
    sleep 0.2
    if [ $((i % 2)) -eq 0 ]; then
        echo "${RED}[ NEW VERSION AVAILABLE! ENTER COMMAND ${GREEN}NR${RED} TO UPDATE! ] DATE: $UPDATE${RESET}" 
        sleep 0.4
    fi
    i=$((i+1))  # Арифметическое выражение для инкремента переменной i
done
reset
echo "$RED [ NEW VERSION AVAILABLE! ENTER COMMAND$GREEN NR$RED TO UPDATE! ] DATE: $UPDATE$RESET" 
rm -rf ~/.school_resources_for_peer/update.txt 
fi

# -------------------------------------------------------------------------- parse branch

COLOR_DEF='%f'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

parse_git_branch() {
	git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# function comp() {
# 	gcc -Wall -Wextra -Werror "$1.c" -o "$1.o"
# 	./"$1.o"
# }

# -------------------------------------------------------------------------- init setup

function init_setup() {
 	echo $RED---------------- ARISE ----------------$RESET
	if [ ! -d "~/.school_resources_for_peer" ]
	then
		mkdir ~/.school_resources_for_peer
		mkdir ~/.school_resources_for_peer/.vscode
		# mkdir ~/.school_resources_for_peer/Valgrind
	fi
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.school_resources_for_peer/.zshrc
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/date.txt > ~/.school_resources_for_peer/date.txt
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/main.sh > ~/.school_resources_for_peer/main.sh
	chmod +x ~/.school_resources_for_peer/main.sh
	
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.clang-format > ~/.school_resources_for_peer/.clang-format

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clean.sh > ~/.school_resources_for_peer/clean.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/clear.sh > ~/.school_resources_for_peer/clear.sh

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/launch.json > ~/.school_resources_for_peer/.vscode/launch.json
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.vscode/tasks.json > ~/.school_resources_for_peer/.vscode/tasks.json

	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/Dockerfile > ~/.school_resources_for_peer/Valgrind/Dockerfile
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/run.sh > ~/.school_resources_for_peer/Valgrind/run.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/Valgrind/start.sh > ~/.school_resources_for_peer/Valgrind/start.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/linkdoc.sh > ~/.school_resources_for_peer/linkdoc.sh
	# curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/aptdoc.sh > ~/.school_resources_for_peer/aptdoc.sh
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/aptdoc.txt > ~/.school_resources_for_peer/aptdoc.txt

	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/helpme.md > ~/.school_resources_for_peer/helpme.md
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/README.md > ~/.school_resources_for_peer/README.md
	sleep 1
	echo $GREEN"Install complete! Enjoy!"$RESET
	reset
}

# -------------------------------------------------------------------------- console menu

function menu() {
	bash ~/.school_resources_for_peer/main.sh
}

# -------------------------------------------------------------------------- format google

	# cppcheck --enable=all --suppress=missingIncludeSystem ./*.c *.h ./test_s21/*.c ./test_s21/*.h
function fixformat() {
	# files_array=($(find . -type f \( -name "*.c" -o -name "*.h" \)))
	files_array=($(find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" \)))
	# Создаем отдельный массив для обработанных файлов
	processed_files=()

	# Указываем часть директории, которую нужно удалить
	dir_to_remove="./"

	# Обходим каждый элемент в files_array, обрабатываем и добавляем в processed_files
	for file in "${files_array[@]}"; do
		processed_file="${file/$dir_to_remove/}"  # Удаляем часть директории из пути
		processed_files+=("$processed_file")  # Добавляем обработанный файл в массив
	done

	# # Выводим список обработанных файлов
	# echo "Обработанные файлы:"
	# for file in "${processed_files[@]}"; do
	# 	echo "$file"
	# done

	# # Пример использования обработанных файлов
	# for processed_file in "${processed_files[@]}"; do
	# 	if [ -f "$processed_file" ]; then
	#	 	echo "$processed_file существует"
	#	 # Здесь можно проводить дополнительные действия с каждым обработанным файлом
	# 	fi
	# done
	
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo ---------------- CHECK ----------------
		# printf '\n'
		clang-format -style=google -n ${processed_files[@]}
	fi
	sleep 1
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo ----------------- FIX -----------------
		# printf '\n'
		clang-format -style=google -i ${processed_files[@]}
	fi
	if [ ${#processed_files[@]} -ne 0 ]; then
		# printf '%s\n' "${processed_files[@]}"
		echo ---------------- CHECK ----------------
		# printf '\n'
		clang-format -style=google -n ${processed_files[@]}
	fi
	# reset
	# v3.0
	# #shopt -s nullglob  # Эта команда говорит о том, что пустые шаблоны должны раскрываться в пустой список, а не сами шаблоны
	# # files=(*.c *.h */*.c */*.h */*/*.c */*/*.h)  # Получаем список всех файлов с расширением .c в указанной директории
	# # find . -type f -name "*.c"

	# # Сохраняем вывод команды find в переменную files_array
	# files_array=($(find . -type f -name "*.c"), $(find . -type f -name "*.h"))
	# # Создаем массив files и копируем результаты из files_array
	# files=("${files_array[@]}")

	# # Указываем часть директории, которую нужно удалить
	# dir_to_remove="./"
	# # Цикл для обработки каждого элемента массива files
	# for ((i=0; i<${#files[@]}; i++)); do
	# # Используем подстроку для удаления части строки с путем к директории
	# 	files[$i]=${files[$i]#"$dir_to_remove"}
	# done
	# v2.0
	# clang-format -style=google -n *.c *.h
	# sleep 1
	# clang-format -style=google -i *.c *.h
	# clang-format -style=google -n *.c *.h
	# v1.0
	# cp ~/.school_resources_for_peer/.clang-format .clang-format
	# .clang-format -i *.c *.h
	# .clang-format -n *.c *.h
	# rm .clang-format
}

# -------------------------------------------------------------------------- VS debug

# function vdb() {
# 	workdir=$(git rev-parse --show-toplevel)/
#   	# printf $(git rev-parse --show-toplevel)/
# 	if [ ! -d "$workdir.vscode" ]
# 	then
# 	mkdir $workdir.vscode
# 	cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
# 	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
# 	else
# 	prog=$(echo $GREEN vdb!)
# 	printf $RED"File exists! Use command: $prog "$RESET
# 	fi
# }

function vdb() {
	workdir=$(git rev-parse --show-toplevel)/
	# printf $(git rev-parse --show-toplevel)
	# echo $(git -c alias.root='!pwd' root)
	# echo $(git rev-parse --show-cdup)
	if [ ! -d "$workdir.vscode" ]
	then
	echo "Путь к исполняемому файлу: $workdir"src/"$GREEN"a.out""$RESET
	echo "Введи имя своего исполняемого файла: "
	zle -R 
	read file
	mkdir $workdir.vscode
	cat ~/.school_resources_for_peer/.vscode/launch.json | sed $(echo 's|a.out|'"$file"'|') > $workdir.vscode/launch.json 
	# cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
	echo "Путь к исполняемому файлу: $workdir"src/"$GREEN$file"$RESET
	else
	prog=$(echo $GREEN vdb!)
	printf $RED"File exists! Use command: $prog "$RESET
	fi
}

# function vdb!() {
# 	workdir=$(git rev-parse --show-toplevel)/
# 	# printf $(git rev-parse --show-toplevel)
# 	# echo $(git -c alias.root='!pwd' root)
# 	# echo $(git rev-parse --show-cdup)
# 	rm -rf $workdir.vscode
# 	mkdir $workdir.vscode
# 	cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
# 	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
# }

function vdb!() {
	workdir=$(git rev-parse --show-toplevel)/
	# printf $(git rev-parse --show-toplevel)
	# echo $(git -c alias.root='!pwd' root)
	# echo $(git rev-parse --show-cdup)
	rm -rf $workdir.vscode
	echo "Путь к исполняемому файлу: $workdir"src/"$GREEN"a.out""$RESET
	echo "Введи имя своего исполняемого файла: "
	zle -R 
	read file
	mkdir $workdir.vscode
	cat ~/.school_resources_for_peer/.vscode/launch.json | sed $(echo 's|a.out|'"$file"'|') > $workdir.vscode/launch.json 
	# cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
	echo "Путь к исполняемому файлу: $workdir"src/"$GREEN$file"$RESET
}

# -------------------------------------------------------------------------- old valgrind

function grind() {
	mkdir Valgrind
	cp ~/.school_resources_for_peer/Valgrind/Dockerfile Valgrind/Dockerfile
	cp ~/.school_resources_for_peer/Valgrind/run.sh Valgrind/run.sh
	cp ~/.school_resources_for_peer/Valgrind/start.sh Valgrind/start.sh
}

# -------------------------------------------------------------------------- sql

function sql() {

dir=$(echo $(git rev-parse --show-toplevel))
# sql=$(echo $dir | grep -io sql)
# if [[ $sql =~ ^[Ss][Qq][Ll]$ ]]; then
# if [$dir]; then
sql=$(echo $dir | grep -ic sql_)
if [[ $sql -eq 1 ]]; then
echo $GREEN"Find $sql project: $dir"$RESET '\n'
# Пример исполнения скрипта: sql 5 12
# 5 - day / день
# 12 - exercise / количество заданий
echo "Enter day: "
zle -R 
read 1
echo "Enter exercise: "
zle -R
read 2
# echo $1
# echo $2
if [ ! -d "$dir/src" ]; then
	mkdir $dir/src
fi
cd $dir/src

# if [ ! -d "$dir/src/ex" ]; then
i=0
while [ $i -le $2 ]
do
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
	if [ ! -f "ex0$i/day$null$1_ex0$i.sql" ]; then
		touch ex0$i/day$null$1_ex0$i.sql
		echo $GREEN"File ex0$i/day$null$1_ex0$i.sql create!"$RESET
	else
		echo $RED"File ex0$i/day$null$1_ex0$i.sql exists!"$RESET
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
		echo $GREEN"File ex$i/day$null$1_ex$i.sql create!"$RESET
	else
		echo $RED"File ex$i/day$null$1_ex$i.sql exists!"$RESET
	fi
  fi
  ((i++))
done
echo '\n'
echo $GREEN"Create dir and file: src/ex[0-$2]/day$null$1_ex[0-$2].sql"$RESET
# fi
else
	echo $RED"No SQL project"$RESET
fi
}

# -------------------------------------------------------------------------- git clone

function gclone() {
	cd ~/
	git clone $1
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	cd $project_name
	git checkout -b develop
	open . -a 'Visual studio code'
}

# -------------------------------------------------------------------------- peer review

function peer() {
	if [ ! -d "~/Desktop/peer_review_dir" ]; then
		mkdir ~/Desktop/peer_review_dir
	fi
	cd ~/Desktop/peer_review_dir
	git clone -b develop $1
	# git clone $1 
	project_name=$(echo "$1" | sed 's/^.*\///; s/\.git$//')
	# printf $project_name
	# printf '\n'
	new_file_name="$project_name$(date +"_%Y-%m-%d_%H-%M-%S")"
	# printf $new_file_name
	# printf '\n'
	mv $project_name $new_file_name
	# printf $new_file_name
	cd $new_file_name
	open . -a 'Visual studio code'
}

# -------------------------------------------------------------------------- mem

function mem() {
	  sh ~/.school_resources_for_peer/clean.sh
}

# -------------------------------------------------------------------------- brew \ libs

function brewinstall() {
	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
	# restart && reset
	osascript -e 'tell app "Terminal" to do script "brew install check && brew install lcov && brew install gcovr && brew install googletest && killall Terminal"'
	# brew install check
	# brew install lcov
	# brew install gcovr
	# brew install googletest
	# echo $TERM

	# killall Terminal 
	# killall iTerm2
	# pkill -a -f Terminal
	# pkill -a -f iTerm2
	# killall Terminal && killall iTerm2
	# ps -o 'ppid=' -p $$
	# ps -p $$ -o comm=
	# w -h | grep $(whoami) | awk '{ print $1 " at " $2 " from " $3; }'
	# kill -9 $(echo $$)
	sleep 3
	exit
	# reset
}

# -------------------------------------------------------------------------- NEW RELISE

function NR() {
	die
	echo $RED----------------- AND -----------------$RESET
	curl -l https://raw.githubusercontent.com/nohemife/script_s21_school/main/.zshrc > ~/.zshrc ; source ~/.zshrc ;  init_setup
	restart
}

# -------------------------------------------------------------------------- link docker

function lndoc() {
	sh ~/.school_resources_for_peer/linkdoc.sh
}

# -------------------------------------------------------------------------- apt docker

function aptdoc() {
	cat ~/.school_resources_for_peer/aptdoc.txt | pbcopy
}

# -------------------------------------------------------------------------- helpme

function helpme() {
	cat ~/.school_resources_for_peer/helpme.md
}

# -------------------------------------------------------------------------- readme

function readme() {
	open "https://github.com/nohemife/script_s21_school/tree/main"
}

# -------------------------------------------------------------------------- die

function die() {
	echo $RED----------------- DIE -----------------$RESET
	rm -rf ~/.zshrc
	rm -rf ~/.school_resources_for_peer
}

# -------------------------------------------------------------------------- brew link

# Load Homebrew config script
source $HOME/.brewconfig.zsh

# -------------------------------------------------------------------------- END
