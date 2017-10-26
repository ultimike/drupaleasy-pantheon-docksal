#!/usr/bin/env bash

## Import a database from a Pantheon environment.
##
## Usage: this function is included in various custom fin commands via:
## source "${PROJECT_ROOT}/.docksal/commands/common/import_database.sh"

# TO DO: pass in an argument with the environment ("dev", "test", "live", multidev name).
import_database ()
{
  PROJECT_NAME=`basename "${PROJECT_ROOT}"`;
  #echo "PROJECT_NAME is: ${PROJECT_NAME}";
  cd ${PROJECT_ROOT}
  echo "Deleting old database dumps...";
  rm -f database_dumps/db.sql > /dev/null
  rm -f database_dumps/db.sql.gz > /dev/null
  echo "Creating copy of the dev database...";
  terminus backup:create ${PROJECT_NAME}.${PANTHEON_SITE_ENV} --element=database
  echo "Downloading copy of env database...";
  terminus backup:get ${PROJECT_NAME}.${PANTHEON_SITE_ENV} --element=database | xargs curl -o database_dumps/db.sql.gz
  echo "Extracting and importing copy of ${PANTHEON_SITE_ENV} database...";
  fin exec "gunzip -fk database_dumps/db.sql.gz"
  fin db import "database_dumps/db.sql"
}
