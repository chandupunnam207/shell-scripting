#!usr/bin/bash

source common.sh

PRINT "Installing frontend"
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Enabling nginx\t"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT "Starting nginx\t"
systemctl start nginx &>>$LOG
STAT_CHECK $?

PRINT "Download Frontend"
yum install curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG

PRINT "Remove Old HTDocs"
cd /usr/share/nginx/html && rm -rf * &>>$LOG
STAT_CHECK $?

PRINT "Extract Frontend Main Zip File"
unzip /tmp/frontend.zip &>>$LOG  && mv frontend-main/* . &>>$LOG && mv static/* . &>>$LOG && rm -rf frontend-master static &>>$LOG
STAT_CHECK $?

PRINT "Update Roboshop Configuration"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG





