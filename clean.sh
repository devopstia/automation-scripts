#!/bin/bash

# List all directories in ~/code
for directory in ~/code/*; do
    # Check if the item is a directory
    if [ -d "$directory" ]; then
        # Navigate to the directory
        cd "$directory"
        sleep 2
        echo
        echo
        echo "========================================================================="
        echo "Cleaning up .terraform, .terraform.lock.hcl, .terragrunt and .terragrunt-cache in directory $directory"
        
        # Delete terraform directories and files
        find "/home/tia/code" -type d -name '.terraform' -exec rm -rf {} \;
        find "/home/tia/code" -type f -name '.terraform.lock.hcl' -exec rm -f {} \;
        # find "/home/tia/code" -type f -name 'terraform.tfstate' -exec rm -f {} \;
        # find "/home/tia/code" -type f -name 'terraform.tfstate.backup' -exec rm -f {} \;

        # Delete terragrunt directories and files
        find "/home/tia/code" -type d -name '.terragrunt' -exec rm -rf {} \;
        find "/home/tia/code" -type d -name '.terragrunt-cache' -exec rm -rf {} \;

        echo "Cleanup complete."
    fi
done
