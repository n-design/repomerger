#!/usr/bin/env -S bash -x

# Configure the environment.
source set_environment.sh

# Change to monorepo directory
pushd $monorepodir

# Iterate over the polyrepo. Add a remote for each repo in the polyrepo. Fetch
# all contents from each repo. Then merge the contents into the HEAD of the
# monorepo. Finally, add a tag to denote the commits where the old repos have
# been merged into the monorepo.

for r in ${repositories[@]}; do
    $dry git remote add $r $polyrepo/$r
    $dry git fetch $r
    $dry git merge --allow-unrelated-histories -m "Merging monorepo/$r/Monobase into monorepo" monorepo/$r/Monobase > /dev/null
    $dry git tag -m "Merged $r into monorepo" monorepo/$r/merged
done

