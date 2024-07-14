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

echo $RED"----- CLEARING CASHE -----"$RESET
echo $RED"------ DESTROY  ALL ------"$RESET
find ~/ -name ".DS_Store" -print -delete 2>/dev/null
find ~/ -name "**.42_cache_bak**" -print -delete 2>/dev/null
rm -rf ~/.zcompdump*
rm -rf .Trash/*
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
rm -rf ~/Library/Caches/*
rm -rf ~/Library/42_cache
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Caches/*
rm -rf ~/Library/42_cache
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Developer/CoreSimulator/Caches/
rm -rf ~/Library/Developer/CoreSimulator/Devices/
rm -rf ~/Library/Logs/
rm -rf ~/Library/Google/GoogleSoftwareUpdate/
rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/
rm -rf ~/Library/Application\ Support/Code/CachedData/
rm -rf ~/Library/Application\ Support/Slack/logs
rm -rf ~/Library/Application\ Support/zoom.us/AutoUpdater
rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics/.
rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics-spare.pma
rm -rf ~/Library/Application\ Support/Google/Chrome/GrShaderCache/GPUCache/
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Local\ Extension Settings/cjpalhdlnbpafiamejdnhcphjbkeiagm/lost
rm -rf ~/Library/Application\ Support/Code/Cache/
rm -rf ~/Library/Application\ Support/Code/CachedExtensionVSIXs/
rm -rf ~/Library/Application\ Support/Code/Code\ Cache/
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/ScriptCache/
rm -rf ~/Library/Application\ Support/Google/Chrome/ShaderCache/GPUCache/
rm -rf ~/Library/Application\ Support/Code/CachedExtensions/
rm -rf ~/Library/Application\ Support/Code/logs/
rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage/
rm -rf ~/Library/Application\ Support/Code/Service\ Worker/ScriptCache/
rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/
rm -rf ~/.Trash/
#brew cleanup && echo "clean complete"
echo $GREEN"Clean complete"$RESET