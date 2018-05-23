#!/usr/bin/env bash

set -x

GH_TARGET_REPO=$1


git_ops_submodule() {
  git add .
  git_msg="committed by robot, at Melbourne time ""$(TZ=UTC-10 date '+%d/%m/%Y %H:%M:%S')"
  git commit -m "$git_msg"
  git push origin master --force-with-lease
}

reset_origin() {
  GH_REPO=$1
  # default one is the one without auth token.
  # so we have to reset the origin url with the one that has auth-token embedded
  git remote set-url origin "$GH_REPO"
}


# main
cd output
# default branch is none but a commit. So have to checkout master branch before
# writting files into it via `make publish`. I know it looks hacky now.
git checkout master
# get rid of historical rubbish that are not relevant
rm -rf *
cd ..
make publish
cd output
if [ "$CI" == "true" ]; then
  reset_origin "$GH_TARGET_REPO"
fi
git_ops_submodule
