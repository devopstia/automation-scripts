#!/bin/bash

# How to create an images of running instance in AWS
INSTANCE_ID="i-0d6bfc34ad9c1972f"  # Replace with your EC2 instance ID
AMI_NAME="a1-del-dev-jenkins-master"          # Replace with a name for your AMI
DESCRIPTION="a1-del-dev-jenkins-master" # Replace with a description for your AMI

# Create the AMI
aws ec2 create-image --instance-id "$INSTANCE_ID" --name "$AMI_NAME" --description "$DESCRIPTION" --no-reboot

# ===========================================================================================================

# Variables
#!/bin/bash
INSTANCE_ID="i-0d6bfc34ad9c1972f"  # Replace with your EC2 instance ID
DESCRIPTION="a1-del-dev-jenkins-master" # Replace with a description for your AMI
TAG_NAME="Name"          # Replace with the tag name

# Capture current date and time
CURRENT_DATE_TIME=$(date +"%Y%m%d%H%M%S")
BUILD_NUMBER="1"

# Create the AMI with tags and date/time in the name
aws ec2 create-image --instance-id "$INSTANCE_ID" \
  --name "$AMI_NAME_PREFIX-$BUILD_NUMBER-$CURRENT_DATE_TIME" \
  --description "$DESCRIPTION" \
  --no-reboot