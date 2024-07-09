#!/bin/bash
# #!/bin/zsh

# ----- VARIABLES ----- #
GREEN=$'\033[0;32m'
RESET=$'\033[0;m'

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