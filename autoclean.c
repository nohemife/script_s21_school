#include <stdio.h>
#include <string.h>
#include <stdlib.h> 
#include <stdbool.h>
#include <time.h>
#include <unistd.h>

#define USED_MEM "df -h ~/ | awk 'END{print $5}'"
#define MEM_LIM 95
#define CLEAR_MEM "rm -rf ~/Library/Caches/CloudKit \
rm -rf ~/Library/Caches/com.apple.akd \
rm -rf ~/Library/Caches/com.apple.ap.adprivacyd \
rm -rf ~/Library/Caches/com.apple.appstore \
rm -rf ~/Library/Caches/com.apple.appstoreagent \
rm -rf ~/Library/Caches/com.apple.cache_delete \
rm -rf ~/Library/Caches/com.apple.commerce \
rm -rf ~/Library/Caches/com.apple.iCloudHelper \
rm -rf ~/Library/Caches/com.apple.imfoundation.IMRemoteURLConnectionAgent \
rm -rf ~/Library/Caches/com.apple.keyboardservicesd \
rm -rf ~/Library/Caches/com.apple.nbagent \
rm -rf ~/Library/Caches/com.apple.nsservicescache.plist \
rm -rf ~/Library/Caches/com.apple.nsurlsessiond \
rm -rf ~/Library/Caches/storeassetd \
rm -rf ~/Library/Caches/com.microsoft.VSCode.ShipIt \
rm -rf ~/Library/Caches/com.microsoft.VSCode \
rm -rf ~/Library/Caches/com.google.SoftwareUpdate \
rm -rf ~/Library/Caches/com.google.Keystone \
rm -rf ~/Library/Caches/com.apple.touristd \
rm -rf ~/Library/Caches/com.apple.tiswitcher.cache \
rm -rf ~/Library/Caches/com.apple.preferencepanes.usercache \
rm -rf ~/Library/Caches/com.apple.preferencepanes.searchindexcache \
rm -rf ~/Library/Caches/com.apple.parsecd \
rm -rf ~/Library/Caches/* \
rm -rf ~/.Trash/* \
rm -rf ~/Library/Containers/com.docker.docker/Data/vms/* \
rm -rf ~/Library/Application\\ Support/Firefox/Profiles/hdsrd79k.default-release/storage \
rm -rf ~/Library/Application\\ Support/Code/User/workspaceStorage \
rm -rf ~//Library/Application\\ Support/Spotify/PersistentCache \
rm -rf ~/Library/Application\\ Support/Telegram\\ Desktop/tdata/user_data \
rm -rf ~/Library/Application\\ Support/Telegram\\ Desktop/tdata/emoji \
rm -rf ~/Library/Application\\ Support/Code/Cache/Library/Application\\ Support/Code/Cachei \
rm -rf ~/Library/Application\\ Support/Code/CacheData \
rm -rf ~/Library/Application\\ Support/Code/Cache \
rm -rf ~/Library/Application\\ Support/Code/CacheData \
rm -rf ~Library/Application\\ Support/Code/Crashpad/completed \
rm -rf ~/Library/Application\\ Support/Code/Service\\ Worker/CacheStorage \
rm -rf ~/Library/Application\\ Support/BraveSoftware/Brave-Browser/Default/Service\\ Worker/CacheStorage/ \
rm -rf ~/Desktop/Presentation.pdf \
rm -rf ~/Movies/* \
rm -rf ~/Music/* \
rm -rf ~/Pictures/* \
rm -rf ~/.Trash/* \
rm -rfv ~/Library/Caches/* \
rm -rfv ~/Library/Application\\ Support/Slack/Cache/* \
rm -rfv ~/Library/Application\\ Support/Slack/Service\\ Worker/CacheStorage/* \
rm -rfv ~/Library/Group\\ Containers/6N38VWS5BX.ru.keepcoder.Telegram/account-570841890615083515/postbox/* \
rm -rfv ~/Library/Caches \
rm -rfv ~/Library/Application\\ Support/Code/Cache \
rm -rfv ~/Library/Application\\ Support/Code/CachedData \
rm -rfv ~/Library/Application\\ Support/Code/CachedExtension \
rm -rfv ~/Library/Application\\ Support/Code/CachedExtensions \
rm -rfv ~/Library/Application\\ Support/Code/CachedExtensionVSIXs \
rm -rfv ~/Library/Application\\ Support/Code/Code\\ Cache \
rm -rfv ~/Library/Application\\ Support/Slack/Cache \
rm -rfv ~/Library/Application\\ Support/Slack/Code\\ Cache \
rm -rfv ~/Library/Application\\ Support/Slack/Service\\ Worker/CacheStorage \
rm -rfv ~/Library/Application\\ Support/Code/User/workspaceStorage \
 \
rm -rf ~/Library/Application\\ Support/Slack/Code\\ Cache/* -y \
rm -rf ~/Library/Application\\ Support/Slack/Cache/* -y \
rm -rf ~/Library/Application\\ Support/Slack/Service\\ Worker/CacheStorage/* -y \
rm -rf ~/Library/Application\\ Support/Google/Chrome/Default/Service\\ Worker/CacheStorage/* \
rm -rf ~/Library/Application\\ Support/Google/Chrome/Crashpad/completed/* \
rm -rf ~/Library/Caches/* -y \
rm -rf ~/.Trash/* -y \
rm -rf ~/Library/Safari/* -y \
rm -rf ~/.kube/cache/* -y \
rm -rf ~/Library/Application\\ Support/Code/CachedData/* -y \
rm -rf ~/Library/Application\\ Support/Code/Crashpad/completed/* -y \
rm -rf ~/Library/Application\\ Support/Code/User/workspaceStoratge/* -y \
rm -rf ~/Library/Containers/com.docker.docker/Data/vms/* -y \
rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/* -y \
rm -rf ~/Library/Containers/org.telegram.desktop/Data/Library/Application\\ Support/Telegram\\ Desktop/tdata/emoji/* -y"

#define TIME 60 // 60 sec
void IRQ_TimeOut();

int main() {
    double elapsed_time = 0.0;
    clock_t start = clock();
    //------------------------------------------------- time start
    while(true) {
        if(elapsed_time > TIME) {
            printf("elapsed_time = %lf\r\n", elapsed_time);
            IRQ_TimeOut(); 
            elapsed_time = 0.0;
            start = clock();
        }

        // ------------------------------------------------- time finish
        clock_t finish = clock();
        elapsed_time = ((double)(finish - start)) / CLOCKS_PER_SEC;
    }
    return 0;
}

void IRQ_TimeOut() {
    char line_buffer[512] = {0};
    char line[512] = {0};
    // char df_answer[8] = {0};
    // char df_mem[8] = {0};
    FILE *df_answer = popen(USED_MEM, "r");

    if (df_answer) {
        while (fgets(line_buffer, sizeof(line_buffer), df_answer) != NULL) {
            if (strlen(line) <= sizeof(line_buffer)) strcat(line, line_buffer);
        }
        pclose(df_answer);

        for(long unsigned int i = 0; i < sizeof(line) && (line[i] != '\0'); i++) {
            if(line[i] == '%') line[i] = '\0';
        }

        int df_mem = atoi(line);  
        if(df_mem >= MEM_LIM) {
            FILE * clear_mem = popen(CLEAR_MEM, "r");
            if(clear_mem) pclose(clear_mem);
        }
    }
}