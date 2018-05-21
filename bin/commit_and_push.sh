#!/usr/bin/env bash

set -ex

commit_push() {
  msg=$1
  git add .
  git commit -m "$msg"
  git push -u origin master
}


cd output
commit_push 'committed by git robot'

cd ..
commit_push 'committed by git robot'
