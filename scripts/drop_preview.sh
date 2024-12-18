#!/bin/bash

ENV_NAME="$1"

echo "Dropping database $ENV_NAME"

# replace <database_name> in create_database.sql by ENV_NAME
cp drop_database.sql drop_database.temp.sql
sed -i "s/<database_name>/$ENV_NAME/g" drop_database.temp.sql
cat drop_database.temp.sql
psql -h $PG_HOST -U $PG_USER -f drop_database.temp.sql && rm drop_database.temp.sql
