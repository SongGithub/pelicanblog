#!/usr/bin/env bash

set -x

git_msg="committed by robot, at Melbourne time ""$(TZ=UTC-10 date '+%d/%m/%Y %H:%M:%S')"
echo "commit msg= ""$git_msg"
GH_REPO=$1

git_ops() {
  git checkout master
  git pull -r origin
  git add .
  git commit -m "$git_msg"
  git push -f origin master
}

reset_origin() {
  GH_REPO=$1
  git remote rm origin
  git remote add origin "$GH_REPO"
}

chmod -R g+w output
cd output
reset_origin "$GH_REPO"
git_ops

# cd ..
# reset_origin "$GH_REPO"
# git_ops