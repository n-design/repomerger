#!/usr/bin/env -S bash

source set_environment.sh

mkdir -p $upstream
pushd $upstream

for r in ${repositories[@]}; do
    rm -rf $r
    git clone --mirror ${polyrepoprefix}/${r}.git
done;
