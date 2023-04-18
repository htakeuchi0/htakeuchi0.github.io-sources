#!/bin/bash

deploy_dir="../htakeuchi0.github.io/"

hugo --minify -D
cp -r public/* $deploy_dir
cd $deploy_dir
git status
