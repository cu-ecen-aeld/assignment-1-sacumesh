#!/bin/bash

set -u

#Exits with value 1 error and print statements if any of the arguments above were not specified
if [ $# -ne 2 ]
then
	exit 1
fi


writefile=$1
writestr=$2

# Checks if the path already exists
# If the path doesnt exist create the path 
# or exits with 1 if the path creation fails 
if [ ! -d "$(dirname "${writefile}")" ]
then
	mkdir -p "$(dirname "${writefile}")" 2>/dev/null
	if [ $? -ne 0 ]
	then
		exit 1
	fi
fi


# Write the content to the file
echo ${writestr} > ${writefile}
