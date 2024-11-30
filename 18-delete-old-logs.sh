#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR Exists"
else 
    echo "$SOURCE_DIR does not Exists"
    exit 1
fi