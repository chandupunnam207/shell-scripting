#!usr/bin/bash

source common.sh

echo -n -e "Installing frontend..."
yum install nginx -y &>>$LOG
STAT_CHECK $?


echo -n -e "Enabling nginx\t..."
systemctl enable nginx &>>$LOG
STAT_CHECK $?

echo -n -e "Starting nginx\t..."
systemctl start nginx &>>$LOG
STAT_CHECK $?
