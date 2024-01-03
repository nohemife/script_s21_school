DATE = $(shell date -R)

all: 

build: 

git:
	git add .
	git commit -m "$(DATE)"
	git push origin main
