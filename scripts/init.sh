#!/bin/bash

echo "Starting docker, this will take around 30 seconds"

WUSER=`id -u -n`
WUSER_ID=`id -u`

echo "Creating user $WUSER with id $WUSER_ID"
useradd --uid $WUSER_ID --create-home $WUSER


su $USER << EOF
if [ ! -d "/data/hive/metastore_db" ]; then
  echo "Setting up metastore"
  cd /data/hive
  $HIVE_HOME/bin/schematool -dbType derby -initSchema
  cd
fi
EOF
