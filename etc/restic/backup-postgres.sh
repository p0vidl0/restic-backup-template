#!/bin/bash

DB_LIST=$(docker exec postgres psql -Upostgres -d postgres -q -t -c "SELECT datname FROM pg_database WHERE datname NOT IN ('postgres', 'template0', 'template1');")
echo Databases to dump: $DB_LIST

for DB in $DB_LIST; do
	echo Dumping database: $DB	
	docker exec postgres pg_dump -Upostgres $DB --clean \
	| gzip --rsyncable \
    | restic backup --tag postgres-$DB --stdin \
        --stdin-filename postgres-$DB.sql.gz
done