#!usr/bin/bash

source common.sh

PRINT "Installing frontend..."
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Enabling nginx..."
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT "Starting nginx..."
systemctl start nginx &>>$LOG
STAT_CHECK $?
