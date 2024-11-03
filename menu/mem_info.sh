#!/bin/bash
# #!/bin/zsh


# ----- VARIABLES ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
MAGENTA=$'\033[0;35m'
RESET=$'\033[0;m'
# --------------------- #


echo $GREEN"\n----- MEMORY STATS -----\n"$RESET
sleep 1
echo $GREEN"Available now:"$RESET
# df -h ~
# df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"
df -h ~ | awk '{print $1,$2,$3,$4,$5,$9}' | column -t -s ' ' | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"


echo "${YELLOW}\nHome folder:${RESET}"
du -hd1 ~ | sort -h | grep --color=always "[0-9]*\.*[0-9]*M\t\|[0-9]*\.*[0-9]*G\t\|$" | sed 's|\(/Users/[a-z]\{8\}\)|.|'

# read -p "Press Enter to continue..."
# read -n 1 -s

# Ожидание нажатия клавиши с использованием dd
# echo -n "Press any key to continue... "
# stty raw -echo
# dd bs=1 count=1 2>/dev/null
# stty -raw echo
# echo    # Перевод строки для визуальной ясности