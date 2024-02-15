#!/bin/bash

# Define the backup directory
backup_dir="/db_backup"

# MySQL container name
mysql_container="alpha-db"

# MySQL root password
mysql_root_password="BoQU2SSK*PJqYYS8L*w8rDn"

# List of databases to back up (replace these with your database names)
databases=("weatherapp" "mysql" "auth")

# Define your AWS S3 bucket name
aws_s3_bucket="your-s3-bucket-name"

# Loop through each database and create a backup
for db_name in "${databases[@]}"; do
  backup_filename="${db_name}_backup_$(date +'%Y%m%d%H%M%S').sql"
  docker exec -i "$mysql_container" mysqldump -uroot -p"$mysql_root_password" "$db_name" > "$backup_dir/$backup_filename"

  # Check if the backup was successful
  if [ $? -eq 0 ]; then
    echo "Backup of $db_name successful. Backup saved to $backup_dir/$backup_filename"

    # Copy the backup file to the AWS S3 bucket
    aws s3 cp "$backup_dir/$backup_filename" "s3://$aws_s3_bucket/$backup_filename"

    # Check if the copy to S3 was successful
    if [ $? -eq 0 ]; then
      echo "Copy of $backup_filename to S3 successful."
    else
      echo "Copy of $backup_filename to S3 failed."
    fi
  else
    echo "Backup of $db_name failed."
  fi
done
