DATE = $(shell date -R)

all: git

build: 

backup:
	@cp ~/.zshrc ~/.zshrc_$(shell date +"%Y-%m-%d_%H-%M-%S")
	@echo "\033[0;32mbackup success\033[0;m"
	@ sleep 1

git: backup
	git add .
	git commit -m "$(DATE)"
	git push origin main
