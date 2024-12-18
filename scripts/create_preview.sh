#!/bin/bash

ENV_NAME="$1"

echo "Creating database $ENV_NAME"

# replace <database_name> in create_database.sql by ENV_NAME
cp create_database.sql create_database.temp.sql
sed -i "s/<database_name>/$ENV_NAME/g" create_database.temp.sql
cat create_database.temp.sql
psql -h 0.0.0.0 -U postgres -f create_database.temp.sql && rm create_database.temp.sql
