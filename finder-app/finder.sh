#!/bin/bash
set -e
set -u

#Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ $# -ne 2 ]
then
	exit 1
fi

filedir=$1
searchstr=$2


#Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
if [ ! -d ${filedir} ]
then
	exit 1
fi


file_count=$(find ${filedir} -type f | wc -l)
matching_line_count=$(grep -r ${searchstr} ${filedir} | wc -l)

echo "The number of files are ${file_count} and the number of matching lines are ${matching_line_count}"
