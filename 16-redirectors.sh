#!/bin/bash

LOGS_FOLDER="/var/log/shell-script/"
SCRIPT_NAME=$( echo $0 |cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
CHECK_ROOT(){

if [ $USERID -ne 0 ]
then
    echo -e "$R Please run this script with root privelages $N" | tee -a &>>$LOG_FILE
    exit 1
fi    
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$2 is .... $R FAILED $N" | tee -a $LOG_FILE
    exit
    else
        echo -e "$2 is .... $G SUCESS $N" | tee -a $LOG_FILE
    fi    
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 ...."
    exit 1
}

echo "Script Strated executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

#  sh 15-loops.sh git mysql postfix nginx
for package in $@ #$@ reffers to all arguments passed  to it
do
    dnf list installed $package &>>$LOG_FILE 
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it .." | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed .. nothing to do $N" | tee -a $LOG_FILE
    fi         
done