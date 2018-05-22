#!/usr/bin/env bash

set -ex
# ensure the output folder exists.

if [ -d output ]; then
  echo "existing, then delete contents and re-create"
  rm -rf output/*
else
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
