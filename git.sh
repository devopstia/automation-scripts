#!/bin/bash

# Navigate to the code directory
cd ~/code

# Iterate over each directory in ~/code
for i in $(ls); do
    if [ -d "$i/.git" ]; then
        # If it's a git repository, enter the directory and update, add, commit, and push changes
        sleep 2
        echo
        echo
        echo "========================================================================="
        echo "Updating repository in $i"
        cd "$i"
        git pull --all
        git add -A
        git commit -m "DevOps Easy Learning"
        git push
        cd ..
    else
        # If it's not a git repository, skip
        echo "$i is not a Git repository, skipping..."
    fi
done
