#!usr/bin/bash

source common.sh

PRINT "Installing frontend\t..."
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Enabling nginx\t\t..."
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT "Starting nginx\t\t..."
systemctl start nginx &>>$LOG
STAT_CHECK $?
