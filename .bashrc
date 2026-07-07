source $HOME/script_s21_school/plugins/alias.sh
source $HOME/script_s21_school/plugins/git.sh
source $HOME/script_s21_school/plugins/clown.sh
source $HOME/script_s21_school/plugins/cppcheck.sh
source $HOME/script_s21_school/plugins/format_style.sh
source $HOME/script_s21_school/plugins/system_libs_info.sh
source $HOME/script_s21_school/plugins/VS_debug.sh

# === Цвета (ANSI escape sequences) ===
# \[ и \] сообщают bash, что это непечатаемые символы
COLOR_RESET='\[\e[0m\]'
COLOR_RED='\[\e[0;91m\]'
COLOR_GREEN='\[\e[0;92m\]'
COLOR_BLUE='\[\e[0;94m\]'
COLOR_YELLOW='\[\e[0;93m\]'


if ! pgrep -x "keepalive" > /dev/null; then
    nohup $HOME/script_s21_school/plugins/keepalive > /tmp/keepalive.log 2>&1 &
    disown   # "отвязываем" процесс от текущего shell
fi
# === Функция для git-ветки ===
parse_git_branch() {
    if [[ -d .git ]] || git rev-parse --git-dir >/dev/null 2>&1; then
        local branch
        branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
        branch=$(git rev-parse --short HEAD 2>/dev/null)
        if [[ -n "$branch" ]]; then
            printf "%s" "$branch"
        fi
    fi
}

# === Промпт (PS1) ===
export PS1="${COLOR_RED}[ \u ] [ STAFF MODE ] : [ \h ]${COLOR_RESET}${COLOR_RED} : [ \w ]${COLOR_RESET}${COLOR_BLUE} [ \$(parse_git_branch) ]${COLOR_RESET}\n\$ "

function die() {
    rm -rf $HOME/script_s21_school
    rm -rf $HOME/.bashrc*
    rm -rf $HOME/.bashrc
}