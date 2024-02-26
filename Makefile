DATE = $(shell date -R)

all: git

build: 

backup:
	@cp ~/.zshrc ~/.zshrc_$(shell date +"%Y-%m-%d_%H-%M-%S")
	@echo "\033[0;32mbackup success\033[0;m"
	@ sleep 1

update:
	date +"%Y-%m-%d %H-%M-%S" > date.txt

git: backup update
	git add .
	git commit -m "$(DATE)"
	git push origin main
