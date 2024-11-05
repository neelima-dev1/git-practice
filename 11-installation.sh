#!/bin/bash

USERID=$(id -u)
#echo "User id is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1

fi
dnf list installed  git 

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git installation is not sucess .. check it"
        exit 1
    else
        echo "Git installation is sucess"
    fi        
else
    echo "Git is already installed, nothing to ddo.."
fi        