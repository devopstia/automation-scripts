#!/bin/bash

# Define the backup directory
backup_dir="/db_backup"

# MySQL container name
mysql_container="alpha-db"

# MySQL root password
mysql_root_password="BoQU2SSK*PJqYYS8L*w8rDn"

# List of databases to restore (replace these with your provided backup filenames)
databases=("weatherapp_backup_20231104102159.sql" "mysql_backup_20231104102159.sql" "auth_backup_20231104102159.sql")

# Loop through each database and restore it
for backup_filename in "${databases[@]}"; do
  # Extract the database name from the backup filename
  db_name="${backup_filename%%_backup_*}"

  # Construct the full path to the backup file
  backup_file="$backup_dir/$backup_filename"

  # Check if the backup file exists
  if [ -f "$backup_file" ]; then
    # Restore the database
    docker exec -i "$mysql_container" mysql -uroot -p"$mysql_root_password" "$db_name" < "$backup_file"

    # Check if the restore was successful
    if [ $? -eq 0 ]; then
      echo "Restore of $db_name from $backup_filename successful."
    else
      echo "Restore of $db_name from $backup_filename failed."
    fi
  else
    echo "Backup file $backup_file does not exist for $db_name."
  fi
done




#!/bin/bash

# AWS S3 bucket name
aws_s3_bucket="your-s3-bucket-name"

# Local directory where you want to download the backup files
local_dir="/path/to/local/directory"

# List of backup filenames to download (replace these with your actual filenames)
backup_filenames=("weatherapp_backup_20231104102159.sql" "mysql_backup_20231104102159.sql" "auth_backup_20231104102159.sql")

# Loop through each backup filename and download it
for backup_filename in "${backup_filenames[@]}"; do
  # Use the AWS CLI to copy the file from S3 to the local directory
  aws s3 cp "s3://$aws_s3_bucket/$backup_filename" "$local_dir/$backup_filename"

  # Check if the download was successful
  if [ $? -eq 0 ]; then
    echo "Download of $backup_filename from S3 to $local_dir successful."
  else
    echo "Download of $backup_filename from S3 to $local_dir failed."
  fi
done
