#!/usr/bin/env -S bash -x

function add_tag_for_common_ancestor() {
    git tag "monorepo/$r/Monobase" $(git merge-base --octopus ${branches[@]})
}

source set_environment.sh
pushd $polyrepo

for r in ${repositories[@]}; do
    pushd "$r"
    git-filter-repo --to-subdirectory-filter $r --tag-rename '':"polyrepo/$r/"
    add_tag_for_common_ancestor
    popd
done;

