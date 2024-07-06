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
	if [ ! -d "$workdir.vscode" ]; then
		echo "Путь к исполняемому файлу: $workdir"src/"$GREEN"a.out""$RESET
		echo "Введи имя своего исполняемого файла: "
		zle -R
		read file
		mkdir $workdir.vscode
		cat ~/.school_resources_for_peer/.vscode/launch.json | sed $(echo 's|a.out|'"$file"'|') >$workdir.vscode/launch.json
		# cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
		cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
		echo "Путь к исполняемому файлу: $workdir"src/"$GREEN$file"$RESET
	else
		# prog=$(echo $GREEN vdb!)
		# printf $RED"File exists! Use command: $prog "$RESET
		echo "Файлы существуют, заменить? [ y / n ]: "
		while true; do
			zle -R
			read -k1 key
			# read key
			# read -rsn1 key
			case $key in
			"Y" | "y" | "YES" | "yes" | "YEs" | "yES" | "YeS" | "yeS" | "yEs")
				clear
				vdb!
				break
				;;
			"N" | "n" | "NO" | "no" | "No" | "nO")
				break
				;;
			$'\e') # Обработка клавиши Escape
				break
				;;
			esac
		done
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
	cat ~/.school_resources_for_peer/.vscode/launch.json | sed $(echo 's|a.out|'"$file"'|') >$workdir.vscode/launch.json
	# cp ~/.school_resources_for_peer/.vscode/launch.json $workdir.vscode/launch.json
	cp ~/.school_resources_for_peer/.vscode/tasks.json $workdir.vscode/tasks.json
	echo "Путь к исполняемому файлу: $workdir"src/"$GREEN$file"$RESET
}

# -------------------------------------------------------------------------- 
