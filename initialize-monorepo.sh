#!/usr/bin/env -S bash -x

source set_environment.sh

rm -rf $monorepodir && mkdir -p $monorepodir

cp _mailmap $monorepodir/.mailmap
cp _gitignore $monorepodir/.gitignore
cp _gitattributes $monorepodir/.gitattributes
cp -r skeleton/*  $monorepodir

pushd $monorepodir

git init --initial-branch=tmp-$mainbranch
git add -A
git commit -m "Initial commit"
