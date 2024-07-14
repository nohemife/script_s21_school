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


echo $GREEN"----- MEMORY STATS -----"$RESET
sleep 1
echo "Available now:"
df -h ~

# read -p "Press Enter to continue..."
# read -n 1 -s

# Ожидание нажатия клавиши с использованием dd
echo -n "Press any key to continue... "
stty raw -echo
dd bs=1 count=1 2>/dev/null
stty -raw echo
echo    # Перевод строки для визуальной ясности