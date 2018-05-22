#!/usr/bin/env bash

set -x

git_msg=$(date '+%d/%m/%Y %H:%M:%S')
echo "committed by robot, at ""$git_msg"

cd output
git add .
git commit -m "$git_msg"
git push -u origin master

cd ..
git add .
git commit -m "$git_msg"
git push -u origin master
