#!/bin/bash
# update_repo.sh
# Adds all new files, commits local git repository, then pushes changes to github
git add *
git commit
git push origin master
