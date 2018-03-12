#!/bin/bash

repos=( "git@github.com:nageshkmr1/test1.git"
        "git@github.com:nageshkmr1/test2.git" )
for i in "${repos[@]}"
do 
   NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 7 | head -n 1) 
ssh -i "$GIT_SSH_KEYS_PATH" git clone -b  development --single-branch $i  clone-git-repo/clone_$NEW_UUID
 done


apt-get install npm
npm install
npm install -g grunt-cli

grunt bump -v

mv commit.sh clone-git-repo/
cd clone-git-repo/
chmod +x commit.sh
./commit.sh

