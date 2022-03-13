#!/bin/bash

cd $RESTIC_PATH

DB_LIST=$(docker exec --env-file=mariadb.env mariadb mysql -sN -u$MARIADB_USERNAME -e "SELECT schema_name from INFORMATION_SCHEMA.SCHEMATA WHERE schema_name NOT IN ('sys', 'information_schema', 'mysql', 'performance_schema');")
for DB in $DB_LIST; do
	echo Dumping database: $DB
	docker exec --env-file=mariadb.env mariadb mysqldump --databases $DB --add-drop-database --triggers --routines --events -u$MARIADB_USERNAME \
	| gzip --rsyncable \
    | restic backup --tag mariadb-$DB --stdin \
        --stdin-filename mariadb-$DB.sql.gz

done
