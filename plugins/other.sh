# -------------------------------------------------------------------------- other

function up() {
	sed -i $MAC '/^DATE_BUILD/d' ~/.school_resources_for_peer/.zsh.conf

# # IFS="= " read name value <<< $(echo $(cat ~/.school_resources_for_peer/.zsh.conf | grep "DATE ="))
# value=$(echo $(cat ~/.school_resources_for_peer/.zsh.conf | grep -c "DATE_BUILD = 20"))
# # echo $value
# os=$(uname -s) # Получаем имя операционной системы
# os=$(echo "$os" | tr '[:upper:]' '[:lower:]') # Преобразуем в нижний регистр
# # echo $os
# while [ $value -ne 0 ]; do
#     # if [ $value -eq 1 ]; then
#         if [[ "$os" == "linux" ]]; then
#             sed -i -e '$ d' ~/.school_resources_for_peer/.zsh.conf
#         fi
#         if [[ "$os" == "darwin" ]]; then
#             sed -i '' -e '$ d' ~/.school_resources_for_peer/.zsh.conf
#         fi
#     # fi
#     ((value--))
# done
}

function add() {
	date=$(cat ~/.school_resources_for_peer/date.txt)
	echo "DATE_BUILD = $date" >> ~/.school_resources_for_peer/.zsh.conf
	# rm -rf ~/.school_resources_for_peer/date.txt
}

function co() {
IFS="= " read name date <<< $(echo $(cat ~/.school_resources_for_peer/.zsh.conf | grep "DATE_BUILD = "))
update=$(cat ~/.school_resources_for_peer/date.txt)
echo $date
echo $update
if [ "$date" != "$update" ]; then
    echo "Даты различаются"
else
    echo "Даты равны"
fi
}


function configedit() {
	chmod +x ~/.school_resources_for_peer/configurator.sh
	bash ~/.school_resources_for_peer/configurator.sh
}

function id() {
DIALOG=$(echo $(dialog --version)) 
if [ ! "$DIALOG" ];then
	if [ "$OS" = "darwin" ];then
		curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
		osascript -e 'tell app "Terminal" to do script "brew install dialog && killall iTerm2 Terminal"'
	else
		sudo apt update -y
		sudo apt install dialog -y
	fi
fi
}


# FIND_FILE =$(shell find . -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.cc" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n')

# format: reset $(FIND_FILE)
# 	@echo "---------------- CHECK ----------------"
# 	clang-format -style=google -n $^
# 	sleep 1
# 	reset
# 	@echo "----------------- FIX -----------------"
# 	clang-format -style=google -i $^
# 	@echo "---------------- CHECK ----------------"
# 	clang-format -style=google -n $^
# 	@echo "----------------- END -----------------"

# cpp: reset $(FIND_FILE)
# 	@echo "--------------- CPPCHECK ---------------"
# 	cppcheck --enable=all --suppress=missingIncludeSystem $^
# 	@echo "----------------- END -----------------"

# -------------------------------------------------------------------------- 
