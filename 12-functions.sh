#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1
fi    
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "$2 is ....FAILED"
    exit
    else
        echo "$2 is ....SUCESS"
    fi    
}
CHECK_ROOT
dnf list installed  git 
VALIDATE $?

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    VALIDATE $? "Installing Git"    
else
    echo "Git is already installed, nothing to ddo.."
fi       

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install.."
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "mysql is already installed, nothing to do."
fi                


