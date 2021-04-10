#!/usr/bin/env -S bash -x

source set_environment.sh

pushd $monorepodir

# Iterate over branch names
for b in ${branches[@]}; do
    # Create and checkout a "new branch" on the last of the merge commits
    $dry git branch $b tmp-$mainbranch
    $dry git checkout $b
    # Iterate over the branch names
    for r in ${repositories[@]}; do
	# Create and checkout a temporary branch
	# in the "old" part of the monorepo
	$dry git branch monorepo/$r/$b $r/$b 
	$dry git checkout monorepo/$r/$b
	# Rebase this branch onto the "new branch"
	$dry git rebase $b
	$dry git checkout $b
	# Advance the "new branch"
	$dry git merge --ff-only monorepo/$r/$b > /dev/null
    done
done
