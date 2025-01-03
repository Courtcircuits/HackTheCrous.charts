#!/bin/bash

ENV_NAME="$PG_DATABASE"

echo "Creating database $ENV_NAME"

# replace <database_name> in create_database.sql by ENV_NAME
cp create_database.sql create_database.temp.sql
sed -i "s/<database_name>/$ENV_NAME/g" create_database.temp.sql
cat create_database.temp.sql
psql --no-password -h $PG_HOST -U $PG_USER -f create_database.temp.sql && rm create_database.temp.sql
