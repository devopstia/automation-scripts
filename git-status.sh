#!/bin/bash

# Navigate to the code directory
cd ~/code

# Iterate over each directory in ~/code
for i in $(ls); do
    if [ -d "$i/.git" ]; then
        # If it's a git repository, enter the directory and update, add, commit, and push changes
        cd "$i"
        sleep 2
        echo
        echo
        echo "========================================================================="
        echo "Checking the status of the repository $i"
        
        git status
        cd ..
    else
        # If it's not a git repository, skip
        echo "$i is not a Git repository, skipping..."
    fi
done
