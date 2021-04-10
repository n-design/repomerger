#!/usr/bin/env -S bash -x

./reset.sh
./prepare-polyrepo.sh
./initialize-monorepo.sh
./migrate-merge.sh
./migrate-rebase.sh
./finish.sh
