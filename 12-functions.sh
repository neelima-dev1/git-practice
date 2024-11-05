#!/bin/bash

USERID=$(id -u)
#echo "User id is: $USERID"
VALIDATE(){
    echo "exit status: $1"
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privelages"
    exit 1

fi
dnf list installed  git 
VALIDATE $?

# if [ $? -ne 0 ]
# then
#     echo "Git is not installed, going to install it.."
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "Git installation is not sucess .. check it"
#         exit 1
#     else
#         echo "Git installation is sucess"
#     fi        
# else
#     echo "Git is already installed, nothing to ddo.."
# fi       

# dnf list installed mysql
# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed, going to install.."
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "mysql installation is not sucess .. check it"
#         exit 1
#     else
#         echo "mysql is installation is sucess "
#     fi
# else
#     echo "mysql is already installed, nothing to do."
# fi                


