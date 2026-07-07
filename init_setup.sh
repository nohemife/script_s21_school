#!/bin/bash

# Автоматический выход при любой ошибке
set -e

# ----- ПЕРЕМЕННЫЕ ----- #
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
RESET=$'\033[0;m'

REPO_URL="https://github.com/nohemife/script_s21_school.git"
BRANCH="staff"
INSTALL_DIR="$HOME/script_s21_school"
TEMP_CLONE_DIR="$HOME/.script_s21_school_temp_$$"
BACKUP_DIR="$HOME/.bashrc_backup_$(date +%Y%m%d_%H%M%S)"
IMAGE_PATH="file://$INSTALL_DIR/gendalf_kek.jpeg"
# --------------------- #

# Функция отката при ошибке
cleanup_on_error() {
    echo ""
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${RED}❌ ОШИБКА УСТАНОВКИ! Выполняется откат...${RESET}"
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    
    # Удаляем временную директорию клона
    if [ -d "$TEMP_CLONE_DIR" ]; then
        rm -rf "$TEMP_CLONE_DIR"
        echo -e "${GREEN}✅ Временная директория удалена${RESET}"
    fi
    
    # Восстанавливаем .bashrc из бэкапа
    if [ -f "$BACKUP_DIR/.bashrc" ]; then
        cp "$BACKUP_DIR/.bashrc" "$HOME/.bashrc"
        echo -e "${GREEN}✅ .bashrc восстановлен из резервной копии${RESET}"
    fi
    
    # Удаляем частично установленные файлы
    if [ -d "$INSTALL_DIR" ]; then
        rm -rf "$INSTALL_DIR"
        echo -e "${GREEN}✅ Директория $INSTALL_DIR удалена${RESET}"
    fi
    
    # Удаляем скопированные бинарники
    [ -f "$HOME/s21_lint" ] && rm -f "$HOME/s21_lint"
    [ -f "$HOME/keepalive" ] && rm -f "$HOME/keepalive"
    
    echo ""
    echo -e "${YELLOW}💡 Резервная копия сохранена в: $BACKUP_DIR${RESET}"
    exit 1
}

# Проверка наличия git
check_git() {
    if ! command -v git &> /dev/null; then
        echo -e "${RED}❌ Git не установлен! Установите git и повторите попытку.${RESET}"
        exit 1
    fi
}

function init_setup() {
    echo -e "${RED}━━━━━━━━━━━━━━━━ ARISE ━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    
    # Шаг 0: Проверка git
    check_git
    
    # Шаг 1: Создание резервной копии текущего .bashrc
    if [ -f "$HOME/.bashrc" ]; then
        mkdir -p "$BACKUP_DIR"
        cp "$HOME/.bashrc" "$BACKUP_DIR/"
        echo -e "${GREEN}💾 Создан бэкап: $BACKUP_DIR/.bashrc${RESET}"
    else
        echo -e "${YELLOW}⚠️  Файл .bashrc не найден, бэкап не создан${RESET}"
    fi
    echo ""
    
    # Шаг 2: Клонирование репозитория
    echo -e "${BLUE}📥 Клонирование репозитория...${RESET}"
    if ! git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$TEMP_CLONE_DIR"; then
        echo -e "${RED}❌ Ошибка клонирования репозитория${RESET}"
        cleanup_on_error
    fi
    echo -e "${GREEN}✅ Репозиторий клонирован${RESET}"
    echo ""
    
    # Шаг 3: Создание директорий
    echo -e "${BLUE}📁 Создание директорий...${RESET}"
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$INSTALL_DIR/.vscode"
    mkdir -p "$INSTALL_DIR/plugins"
    echo -e "${GREEN}✅ Директории созданы${RESET}"
    echo ""
    
    # Шаг 4: Копирование .bashrc
    echo -e "${BLUE}⚙️  Копирование конфигурации...${RESET}"
    if [ ! -f "$TEMP_CLONE_DIR/.bashrc" ]; then
        echo -e "${RED}❌ Файл .bashrc не найден в репозитории${RESET}"
        cleanup_on_error
    fi
    cp "$TEMP_CLONE_DIR/.bashrc" "$HOME/.bashrc"
    cp "$TEMP_CLONE_DIR/.bashrc" "$INSTALL_DIR/.bashrc"
    echo -e "${GREEN}✅ .bashrc скопирован${RESET}"
    echo ""
    
    # Шаг 5: Копирование плагинов
    echo -e "${BLUE}🔌 Копирование плагинов...${RESET}"
    if [ ! -d "$TEMP_CLONE_DIR/plugins" ]; then
        echo -e "${RED}❌ Директория plugins не найдена в репозитории${RESET}"
        cleanup_on_error
    fi
    
    cp "$TEMP_CLONE_DIR/plugins/"*.sh "$INSTALL_DIR/plugins/" 2>/dev/null || true
    cp "$TEMP_CLONE_DIR/plugins/Makefile" "$INSTALL_DIR/plugins/" 2>/dev/null || true
    cp "$TEMP_CLONE_DIR/plugins/keepalive" "$INSTALL_DIR/plugins/" 2>/dev/null || true
    cp "$TEMP_CLONE_DIR/plugins/s21_lint" "$INSTALL_DIR/plugins/" 2>/dev/null || true
    cp "$TEMP_CLONE_DIR/plugins/.clang-format" "$INSTALL_DIR/plugins/" 2>/dev/null || true

    echo -e "${GREEN}✅ Плагины скопированы${RESET}"
    echo ""
    
    # # Шаг 6: Копирование бинарных файлов
    # echo -e "${BLUE}🔧 Копирование утилит...${RESET}"
    # if [ -f "$TEMP_CLONE_DIR/plugins/s21_lint" ]; then
    #     cp "$TEMP_CLONE_DIR/plugins/s21_lint" "$HOME/s21_lint"
    #     chmod +x "$HOME/s21_lint"
    #     chmod +x "$INSTALL_DIR/plugins/s21_lint"
    #     echo -e "${GREEN}✅ s21_lint скопирован${RESET}"
    # fi
    
    # if [ -f "$TEMP_CLONE_DIR/plugins/keepalive" ]; then
    #     cp "$TEMP_CLONE_DIR/plugins/keepalive" "$HOME/keepalive"
    #     chmod +x "$HOME/keepalive"
    #     echo -e "${GREEN}✅ keepalive скопирован${RESET}"
    # fi
    # echo ""
    
    # Шаг 7: Копирование конфигурации VS Code
    echo -e "${BLUE}🎨 Копирование конфигурации VS Code...${RESET}"
    if [ -d "$TEMP_CLONE_DIR/.vscode" ]; then
        cp "$TEMP_CLONE_DIR/.vscode/launch.json" "$INSTALL_DIR/.vscode/" 2>/dev/null || true
        cp "$TEMP_CLONE_DIR/.vscode/tasks.json" "$INSTALL_DIR/.vscode/" 2>/dev/null || true
        echo -e "${GREEN}✅ Конфигурация VS Code скопирована${RESET}"
    fi
    echo ""
    
    # Шаг 8: Установка прав на выполнение для всех скриптов
    echo -e "${BLUE}🔐 Установка прав доступа...${RESET}"
    chmod +x "$INSTALL_DIR/plugins/"*.sh 2>/dev/null || true
    chmod +x "$INSTALL_DIR/plugins/"s21_lint 2>/dev/null || true
    chmod +x "$INSTALL_DIR/plugins/"keepalive 2>/dev/null || true
    echo -e "${GREEN}✅ Права установлены${RESET}"
    echo ""
    
    cp "$TEMP_CLONE_DIR/gendalf_kek.jpeg" "$INSTALL_DIR/" 2>/dev/null || true
    kwriteconfig5 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image "$IMAGE_PATH"
    qdbus org.kde.KWin /KWin reconfigure 2>/dev/null || true
    killall kscreenlocker_greet 2>/dev/null || true
    plasma-apply-wallpaperimage "$INSTALL_DIR/gendalf_kek.jpeg"

    # Шаг 9: Удаление временной директории
    echo -e "${BLUE}🧹 Очистка...${RESET}"
    rm -rf "$TEMP_CLONE_DIR"
    echo -e "${GREEN}✅ Временные файлы удалены${RESET}"
    echo ""
    
    # Завершение
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${GREEN}✅ Установка завершена успешно!${RESET}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    echo -e "${YELLOW}💡 Выполните: source ~/.bashrc${RESET}"
    echo ""
    
    sleep 1
    source ~/.bashrc
}

# Автоматический запуск при выполнении скрипта напрямую
if [[ "${BASH_SOURCE[0]}" == "${0}" ]] || [[ "${ZSH_VERSION}" != "" && "$ZSH_EVAL_CONTEXT" == "toplevel" ]]; then
    init_setup
fi


# git clone --depth 1 --branch staff https://github.com/nohemife/script_s21_school.git /tmp/script_s21_school && bash /tmp/script_s21_school/init_setup.sh && rm -rf /tmp/script_s21_school && source ~/.bashrc
# curl -f -L https://raw.githubusercontent.com/nohemife/script_s21_school/refs/heads/staff/init_setup.sh > ~/.bashrc ; source ~/.bashrc ; init_setup ; source ~/.bashrc