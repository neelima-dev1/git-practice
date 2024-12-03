#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # IF $3 is empty, default is 14 days
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

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


FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14) | zip "$ZIP_FILE" -@

echo "Files: $FILES"

if [ ! -z $FILES ] #true if FILES are empty, ! makes it expression false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@
    
    #CHECK if zip file is sucessfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Sucessfully zipped files older than $DAYS"

        #remove the files after zipping
        while IFS= read -r file #IFS is called internal field separator, empty it will not ignore while space. -r is for not to ignore special characters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES

    else 
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "No Files older than $DAYS"
fi

