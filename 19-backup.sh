#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # IF $3 is empty, default is 14 days

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}

#check the source and destination are provided

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ] #! --->this means opposite
then
    echo "$SOURCE_DIR does not exist ....please check"

fi

if [ ! -d $DEST_DIR ] #! --->this means opposite
then
    echo "$DEST_DIR does not exist ....please check"

fi


FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files: $FILES"

if [ ! -z $FILES ] #true if FILES are empty
then
    echo "Files are found"
else
    echo "No Files older than $DAYS"
fi

