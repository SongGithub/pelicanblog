#!/usr/bin/env bash

set -ex
# ensure the output folder exists.

if [ ! -d output ]; then
  mkdir output
fi

cd output
git add .
git commit -m 'committed by git robot'
git push -u origin master

cd ..
git add .
git commit -m 'committed by git robot'
git push -u origin master
