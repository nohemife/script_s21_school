
# ---------------------------------------------------------------- compilator
CC=gcc

# ---------------------------------------------------------------- flags
FLAGS=-Wall -Wextra -Werror 
STD=-std=c11
MATH=-lm
P=-pedantic
DB=-g -O0
ADD_FLAGS = 

# ---------------------------------------------------------------- find src
FIND_FILE=$(shell find . -type f \( -name "*.c" -o -name "*.h" \) -print0 | xargs -0 -n 1 | sed 's|./| |' | tr -d '\n')

FIND_FILES:=$(shell find . -type f \( -name "*.c" -o -name "*.h" \) -print0 | xargs -0 -n 1 | sed 's|./| |')

L_ASAN=$(shell grep -c libsanitizer run_*)
# ---------------------------------------------------------------- output file
# PROJECT = 
# TEST = 
# ---------------------------------------------------------------- 
OS=$(shell uname)

all: test_memory

menu:
	@echo "0 -> PONG"
	@echo "1 -> PONG_INT"
	@echo "2 -> GoL"

build_project: menu
	$(shell bash -c 'read -r -p "Enter number project: " answer; \
	if [ "$$answer" = "0" ]; then \
	echo "make pong"; \
	elif [ "$$answer" = "1" ]; then \
	echo "make pong_int"; \
	elif [ "$$answer" = "2" ]; then \
	echo "make gol"; \
	fi')

build_project_fsan: menu
	$(shell bash -c 'read -r -p "Enter number project: " answer; \
	if [ "$$answer" = "0" ]; then \
	echo "make pong ADD_FLAGS+=-fsanitize=address"; \
	elif [ "$$answer" = "1" ]; then \
	echo "make pong_int ADD_FLAGS+=-fsanitize=address"; \
	elif [ "$$answer" = "2" ]; then \
	echo "make gol ADD_FLAGS+=-fsanitize=address"; \
	fi')

menu_memory:
	@echo "0 -> Valgrind"
	@echo "1 -> AddressSanitizer"

test_memory: menu_memory
	$(shell bash -c 'read -r -p "Enter number of program for test memory: " answer; \
	if [ "$$answer" = "0" ]; then \
	echo "make build_project"; \
	elif [ "$$answer" = "1" ]; then \
	echo "make build_project_fsan"; \
	fi')

# ---------------------------------------------------------------- add_flag

add_db_flag:
	$(eval FLAGS += $(DB))

add_curses:
	$(eval FLAGS += -lncurses)

# add_fsan:
# 	$(eval ADD_FLAGS += -fsanitize=address)

pong: clean add_db_flag 
	$(CC) $(FLAGS) pong.c -o run_pong $(MATH) $(ADD_FLAGS)
	make mem
#	./run_pong

pong_int: clean add_curses add_db_flag
	$(CC) $(FLAGS) pong_interactive.c -o run_pong_int $(MATH) $(ADD_FLAGS)
	make mem
#	./run_pong_int

gol: clean add_curses add_db_flag
	$(CC) $(FLAGS) game_of_life.c -o run_GoL $(MATH) $(ADD_FLAGS)
	make mem
#	./run_GoL

# ---------------------------------------------------------------- style
format: reset style
format_old: reset copy style_old

copy:
	rm -rf .clang-format
	cp ../materials/linters/.clang-format ../src/.clang-format

style_old: 
	@echo "---------------- CHECK STYLE ----------------"
	clang-format -n $(FIND_FILE)
	@echo "-------------------- END --------------------"
	rm -rf .clang-format

style:
	rm -rf ../materials/linters/.clang-format
	git checkout master -- ../materials/linters/.clang-format
	@echo "---------------- CHECK STYLE ----------------"
	clang-format --style=file:../materials/linters/.clang-format -n $(FIND_FILE)
	@echo "-------------------- END --------------------"

cpp: reset
	@echo "--------------- CPPCHECK ---------------"
	cppcheck --enable=all --suppress=missingIncludeSystem $(FIND_FILE)
	@echo "----------------- END -----------------"

# ---------------------------------------------------------------- memory

mem: 
ifeq ($(L_ASAN), 0)
	valgrind -s --trace-children=yes --track-fds=yes --track-origins=yes --leak-check=full --show-leak-kinds=all ./run_*
else
	./run_*
endif

# ---------------------------------------------------------------- other

clean:
	find . -type d \( -name "*.dSYM" -prune -o -type f -name "*.dSYM" \) -print | xargs rm -rf \;
	find . -type f \( -name "*.out" -o -name "*.o" -o -name "*.a" \) -exec rm -rf {} \;
	find . -type f \( -name "run_*" \) -exec rm -rf {} \;
	rm -rf run_pong run_pong_int run_GoL

reset:
	reset | bash

# ---------------------------------------------------------------- 

clear: clear_lint

clear_lint: $(FIND_FILES)
	s21_lint -c $(FIND_FILES)

clear_bash: $(FIND_FILES)
	mkdir -p original
	mkdir -p clear
	for file in $(FIND_FILES); do \
		cp "$$file" original/"$$file"; \
		gcc -fpreprocessed -dD -E original/$$file > clear/$$file; \
		sed '1d' clear/$$file > $$file; \
	done
	rm -rf clear

# ---------------------------------------------------------------- help

?: help
help:
	@unset KRB5CCNAME
	@clang-format --version
	@cppcheck --version
	@valgrind --version
	@echo "		make          - запуск выбора проекта и сборки"
	@echo "		make pong     - сборка и запуск проекта Pong"
	@echo "		make pong_int - сборка и запуск интерактивной части проекта Pong"
	@echo "		make gol      - сборка и запуск проекта Game Of Life"
	@echo "		make format   - копирование .clang-format и проверка кода на соответствие стилю"
	@echo "		make cpp      - запуск cppcheck"
	@echo "		make mem      - блок проверки памяти Valgrind/AddressSanitizer"
	@echo "		make clean    - очистка папки от артефактов"
	@echo "		make clear    - очистка кода от комментариев"
# ---------------------------------------------------------------- END
