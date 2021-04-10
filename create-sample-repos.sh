#!/bin/bash

source set_environment.sh

rm -rf $upstream && mkdir -p $upstream
pushd $upstream

for i in $repositories; do
    thefile=${i}_first_file.txt
    anotherfile=${i}_second_file.txt
    rm -rf $i && mkdir -p $i
    pushd $i
    git init --initial-branch "$mainbranch"
    echo "A file belonging to repo $i" > $thefile
    git add $thefile
    git commit -m "Initial commit in $i"
    echo "An added line" >> $thefile
    git commit -m "Added feature to $i" $thefile
    git switch --create "v1.0"
    echo "This is v1.0" >> $thefile
    git commit -m "Version 1.0 released for $i" $thefile
    git switch main
    echo "Another file with new features" >> $anotherfile
    echo "Referring to another file" >> $thefile
    git add $thefile $anotherfile
    git commit -m "Added another file and dependency to $i" 
    echo "Refining the features for v2.0" >> $anotherfile
    echo "Refining the features for v2.0" >> $thefile
    git add $thefile $anotherfile
    git commit -m "Refining the features for v2.0" 
    git switch --create "v2.0"
    echo "This is v2.0" >> $thefile
    echo "This is v2.0" >> $anotherfile
    git commit -m "Version 2.0 released" $thefile $anotherfile
    git switch main
    echo "Yet another feature" >> $anotherfile
    echo "Yet another feature" >> $thefile
    git commit -m "Added another file and dependency" $thefile $anotherfile
    popd
done
    
