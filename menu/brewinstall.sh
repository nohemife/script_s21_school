#!/bin/bash
#!/bin/zsh

    
BRW=$(echo $(brew --version)) 

if [ ! "$BRW" ];then
    curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
fi

killall iTerm2 Terminal
# restart && reset

