#!/usr/bin/env bash

set -x

git_msg="committed by robot, at Melbourne time ""$(TZ=UTC-10 date '+%d/%m/%Y %H:%M:%S')"
echo "commit msg= ""$git_msg"

git_ops() {
  git add .
  git commit -m "$git_msg"
  git pull -r
  git push -u origin master
}

reset_origin() {
  git remote rm origin
  git remote add origin $(GH_REPO)
}

cd output
reset_origin
git_ops

cd ..
reset_origin
git_ops