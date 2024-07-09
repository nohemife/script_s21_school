#!/bin/bash
# #!/bin/zsh

function docker_copy_apt {
    cat ~/.school_resources_for_peer/aptdoc.txt | pbcopy
    echo $GREEN"Copy Success"$RESET
    break
}