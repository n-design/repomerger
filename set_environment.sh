repos_file=${repos:-repos.txt}
repositories=$(< "${repos_file}")
polyrepoprefix=git@github.com:repomerger
upstream=../upstream
polyrepo=../polyrepo
monorepodir=../monorepo
mainbranch=main
declare -a branches=(v1.0 v2.0 main)
monorepo_remote=git@github.com:repomerger/monorepo.git