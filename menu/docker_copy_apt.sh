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

cat ~/.school_resources_for_peer/aptdoc.txt | pbcopy
echo $GREEN"Copy Success"$RESET

# Linux
# sudo apt-get install -y xclip
# alias pbcopy="xclip -sel clip"
# pbcopy < ~/.ssh/id_rsa.pub
# alias cpkey="pbcopy < ~/.ssh/id_rsa.pub"
