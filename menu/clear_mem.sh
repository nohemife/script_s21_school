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

echo $RED"----- CLEARING THE SPACE -----"$RESET
sleep 1
# Avoid boring prefix in du/df/etc
cd $HOME
initial_used_space=$(df -h $HOME | grep -v 'Filesystem' | awk '{ printf("%f", $3) }')
# Show current used space
initial_df=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$")
before=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$")
echo $RED"Current space:\n"$RESET${initial_df}$RESET
echo $RED"\nHome folder:"$RESET

echo ""
echo '----------------------'
echo 'Size    Used    Avail'
echo '----------------------'
df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
# rm -rf ~/Library/ApplicationSupport/CrashReporter/*
# rm -rf ~/Library/Application\ Support/Code/*
# rm -rf ~/Library/Group\ Containers/*
rm -rf ~/Library/Caches/CloudKit
rm -rf ~/Library/Caches/com.apple.akd
rm -rf ~/Library/Caches/com.apple.ap.adprivacyd
rm -rf ~/Library/Caches/com.apple.appstore
rm -rf ~/Library/Caches/com.apple.appstoreagent
rm -rf ~/Library/Caches/com.apple.cache_delete
rm -rf ~/Library/Caches/com.apple.commerce
rm -rf ~/Library/Caches/com.apple.iCloudHelper
rm -rf ~/Library/Caches/com.apple.imfoundation.IMRemoteURLConnectionAgent
rm -rf ~/Library/Caches/com.apple.keyboardservicesd
rm -rf ~/Library/Caches/com.apple.nbagent
rm -rf ~/Library/Caches/com.apple.nsservicescache.plist
rm -rf ~/Library/Caches/com.apple.nsurlsessiond
rm -rf ~/Library/Caches/storeassetd
rm -rf ~/Library/Caches/com.microsoft.VSCode.ShipIt
rm -rf ~/Library/Caches/com.microsoft.VSCode
rm -rf ~/Library/Caches/com.google.SoftwareUpdate
rm -rf ~/Library/Caches/com.google.Keystone
rm -rf ~/Library/Caches/com.apple.touristd
rm -rf ~/Library/Caches/com.apple.tiswitcher.cache
rm -rf ~/Library/Caches/com.apple.preferencepanes.usercache
rm -rf ~/Library/Caches/com.apple.preferencepanes.searchindexcache
rm -rf ~/Library/Caches/com.apple.parsecd
rm -rf ~/Library/Caches/
rm -rf ~/.Trash/*
rm -rf ~/.kube/cache/*
rm -rf ~/Library/Containers/com.docker.docker/Data/vms/*
rm -rf ~/Library/Application\ Support/Firefox/Profiles/hdsrd79k.default-release/storage
rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage
rm -rf ~//Library/Application\ Support/Spotify/PersistentCache
rm -rf ~/Library/Application\ Support/Telegram\ Desktop/tdata/user_data
rm -rf ~/Library/Application\ Support/Telegram\ Desktop/tdata/emoji
rm -rf ~/Library/Application\ Support/Code/Cache/Library/Application\ Support/Code/Cachei
rm -rf ~/Library/Application\ Support/Code/CacheData
rm -rf ~/Library/Application\ Support/Code/Cache
rm -rf ~/Library/Application\ Support/Code/CacheData
rm -rf ~Library/Application\ Support/Code/Crashpad/completed
rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage
rm -rf ~/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/Service\ Worker/CacheStorage/
df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
echo '----------------------'
echo $GREEN"Clean Success"$RESET

rm -rf ~/Desktop/Presentation.pdf
# rm -rf ~/Documents/*
# rm -rf ~/Downloads/*
rm -rf ~/Movies/*
rm -rf ~/Music/*
rm -rf ~/Pictures/*
rm -rf ~/.Trash/*
cp ~/Library/Icon? ~/.Trash
​
#!/bin/bash
rm -rfv ~/Library/Caches/*
rm -rfv ~/Library/Application\ Support/Slack/Cache/*
rm -rfv ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/*
rm -rfv ~/Library/Group\ Containers/6N38VWS5BX.ru.keepcoder.Telegram/account-570841890615083515/postbox/*
rm -rfv ~/Library/Caches
rm -rfv ~/Library/Application\ Support/Code/Cache
rm -rfv ~/Library/Application\ Support/Code/CachedData
rm -rfv ~/Library/Application\ Support/Code/CachedExtension
rm -rfv ~/Library/Application\ Support/Code/CachedExtensions
rm -rfv ~/Library/Application\ Support/Code/CachedExtensionVSIXs
rm -rfv ~/Library/Application\ Support/Code/Code\ Cache
rm -rfv ~/Library/Application\ Support/Slack/Cache
rm -rfv ~/Library/Application\ Support/Slack/Code\ Cache
rm -rfv ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage
rm -rfv ~/Library/Application\ Support/Code/User/workspaceStorage
echo -en "\033[31mSpace for the space!\n\033[0m"
free_space=$(df -h | grep 'lallison' | awk '{print $4}')
echo -en "\033[32m${free_space} are available now\n\033[0m"
free_space=$(df -h | grep 'agidget' | awk '{print $4}')
echo -en "\033[32m${free_space} are available now\n\033[0m"
df -h ~
​
echo '----------------------'
echo '\033[37;1;41mSize    Used    Avail\033[0m'
echo '----------------------'
df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
#df -h | awk 'NR == 8{print $2 " = " $3 " + "  $4}'
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/* -y
rm -rf ~/Library/Application\ Support/Slack/Cache/* -y
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* -y
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/*
rm -rf ~/Library/Application\ Support/Google/Chrome/Crashpad/completed/*
rm -rf ~/Library/Caches/* -y
rm -rf ~/.Trash/* -y
rm -rf ~/Library/Safari/* -y
rm -rf ~/.kube/cache/* -y
rm -rf ~/Library/Application\ Support/Code/CachedData/* -y
rm -rf ~/Library/Application\ Support/Code/Crashpad/completed/* -y
rm -rf ~/Library/Application\ Support/Code/User/workspaceStoratge/* -y
rm -rf ~/Library/Containers/com.docker.docker/Data/vms/* -y
rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/* -y
rm -rf ~/Library/Containers/org.telegram.desktop/Data/Library/Application\ Support/Telegram\ Desktop/tdata/emoji/* -y
df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
#df -h | awk 'NR == 8{print $2 " = " $3 " + "  $4}'
echo '----------------------'

echo "${blue}Current space:\n${reset}${initial_df}${reset}"
echo "${blue}\nHome folder:${reset}"
du -hd1 . 2>/dev/null | sort -h | grep --color=always "[0-9]*\.*[0-9]*M\t\|[0-9]*\.*[0-9]*G\t\|$"
echo ""
​
echo '----------------------'
echo 'Size    Used    Avail'
echo '----------------------'

clear
echo $RED"----- CLEARING THE SPACE -----"$RESET
sleep 1
echo $RED"before:\n"$RESET${before}$RESET
df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
sleep 1
echo $GREEN DONE $RESET

# read -p "Press Enter to continue..."
# read -n 1 -s

# Ожидание нажатия клавиши с использованием dd
echo -n "Press any key to continue... "
stty raw -echo
dd bs=1 count=1 2>/dev/null
stty -raw echo
echo    # Перевод строки для визуальной ясности