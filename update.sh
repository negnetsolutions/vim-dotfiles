#!/bin/bash

git pull origin `git branch | sed -n '/\* /s///p'`
git submodule init
git submodule sync
git submodule foreach 'git fetch origin --tags; git checkout master; git pull' && git pull && git submodule update --init --recursive
