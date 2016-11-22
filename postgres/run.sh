#!/bin/sh

# this shell script drops the database and creates a new one
# additionally, the sql-scripts are executed in a certain order.
# connection information to the database are passed as parameter

if [ -n "$1" ]
then
	echo "host: $1"
else
	echo "Error: no host provided. Example call: run.sh host port database user pw"
	exit 1
fi

if [ -n "$2" ]
then
	echo "port: $2"
else
	echo "Error: no port provided. Example call: run.sh host port database user pw"
	exit 2
fi

if [ -n "$3" ]
then
	echo "database: $3"
else
	echo "Error: no database provided. Example call: run.sh host port database user pw"
	exit 3
fi

if [ -n "$4" ]
then
	echo "user: $4"
else
	echo "Error: no user provided. Example call: run.sh host port database user pw"
	exit 4
fi

if [ -n "$5" ]
then
	echo "pw: $5"
else
	echo "Error: no password provided. Example call: run.sh host port database user pw"
	exit 5
fi

psql -U "$4" -c "drop database mission5"