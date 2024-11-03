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

echo Ooops...

echo del com.docker.docker
rm -rf ~/Library/Containers/com.docker.docker
sleep 1
echo mkdir
mkdir -p ~/goinfre/Docker/Data
sleep 1
echo link com.docker.docker
ln -s ~/goinfre/Docker ~/Library/Containers/com.docker.docker
sleep 1
reset
echo $GREEN"Link Success"$RESET
