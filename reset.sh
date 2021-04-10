#!/usr/bin/env -S bash

source set_environment.sh

mkdir -p $polyrepo
pushd $polyrepo

for r in ${repositories[@]}; do
    rm -rf $r
    git clone --no-local $upstream/$r $r
done;
