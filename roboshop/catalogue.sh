#!/usr/bin/bash

source common.sh

PRINT "Install NodeJS\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add Roboshop Application user"
id roboshop &>>$LOG
  if [ $? -ne 0 ] ; then
    useradd roboshop &>>$LOG
  fi
STAT_CHECK $?

PRINT "Download Catalogue\t"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Extract downloaded code\t"
cd /home/roboshop && unzip -o /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue &>>$LOG && cd /home/roboshop/catalogue && npm install --unsafe-perm&>>$LOG
STAT_CHECK $?

PRINT "Update service file"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service

PRINT "Reload "
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue