## These volumes will be created automatically
/data/db-data
/data/redis-data

## DB to backup
it is auth

## Login and check users that sign up already as root
```sh
docker exec -it [DB_CONTAINER_ID] bash
docker exec -it alpha-db bash
docker exec -it 470c55283eb9 bash
mysql -u root -p

SHOW DATABASES;
USE auth;
SHOW TABLES;
SELECT * FROM users;
```




#!/bin/bash

# Define variables for database connection and backup details
DB_CONTAINER_NAME="alpha-db"
DB_USER="root"
DB_PASSWORD="BoQU2SSK*PJqYYS8L*w8rDn"
DB_NAME="auth"
BACKUP_DIR="/db_backup"
DATE=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.sql"

# Create the backup using the mysqldump command
docker exec -i "$DB_CONTAINER_NAME" mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully. Backup file saved as: $BACKUP_FILE"
else
  echo "Backup failed."
fi






```sh
#!/bin/bash

# Define variables for database connection and backup details
DB_CONTAINER_NAME="alpha-db"
DB_USER="root"
DB_PASSWORD="BoQU2SSK*PJqYYS8L*w8rDn"
DB_NAME="auth"
BACKUP_DIR="/db_backup"

# Prompt the user for the backup file name
read -p "Enter the backup file name (e.g., backup_20220101123456.sql): " BACKUP_FILE

# Check if the specified backup file exists
if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
  echo "Backup file not found: $BACKUP_DIR/$BACKUP_FILE"
  exit 1
fi

# Restore the database using the mysql command
docker exec -i "$DB_CONTAINER_NAME" mysql -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$BACKUP_DIR/$BACKUP_FILE"

# Check if the restore was successful
if [ $? -eq 0 ]; then
  echo "Database restore completed successfully from $BACKUP_FILE"
else
  echo "Database restore failed."
fi

```
