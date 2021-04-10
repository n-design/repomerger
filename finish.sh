#!/usr/bin/env -S bash -x

source set_environment.sh

pushd $monorepodir

# Remove the remotes that point to the polyrepo
for r in ${repositories[@]}; do
    $dry git remote remove $r
done

# Remove the temporary branch
git branch -D tmp-$mainbranch

# Remove all branches in the monorepo namespace
git branch -a | grep monorepo | xargs git branch -D

# Remove the Monobase tags from polyrepo commits
git tag --list | grep Monobase | xargs git tag -d

# Clean up the monorepo: Adjust committer names and remove .gitignore files
# inherited from the polyrepo
git-filter-repo --use-mailmap --force --invert-paths --path-glob '*/.gitignore'

# Add the remote for the monorepo. Push manually.
git remote add origin ${monorepo_remote}

# Finally, check out the main branch
git checkout $mainbranch


