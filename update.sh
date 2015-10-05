#!/bin/bash

git pull origin `git branch | sed -n '/\* /s///p'`
git submodule init
git submodule sync
git submodule update --remote --merge
git add . && git commit -m "Submodule updates"
