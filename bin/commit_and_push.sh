#!/usr/bin/env bash

set -x

git_msg="committed by robot, at Melbourne time ""$(TZ=UTC-10 date '+%d/%m/%Y %H:%M:%S')"
echo "commit msg= ""$git_msg"
GH_REPO=$1

git_ops() {
  git checkout master
  git status
  git add .
  git status
  git commit -m "$git_msg"
  git status
  # git pull -r origin master
  git push origin master
}

reset_origin() {
  GH_REPO=$1
  git remote set-url origin "$GH_REPO"
}

chmod -R g+w output
cd output
reset_origin "$GH_REPO"
git submodule update --remote
git_ops

# cd ..
# reset_origin "$GH_REPO"
# git_ops