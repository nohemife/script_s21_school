#!/bin/bash
echo del com.docker.docker
rm -rf ~/Library/Containers/com.docker.docker
sleep 3
echo mkdir
mkdir -p ~/goinfre/Docker/Data
sleep 3
echo link com.docker.docker
ln -s ~/goinfre/Docker ~/Library/Containers/com.docker.docker
sleep 3
reset
