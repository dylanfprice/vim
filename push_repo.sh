#!/bin/bash
# push_repo.sh
# Adds all new files, commits local git repository, then pushes changes to github
git add *
git commit -m "$1"
git push origin master
