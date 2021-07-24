#!/usr/bin/bash

source common.sh

PRINT "Install NodeJS\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add Roboshop Application user"
id roboshop &>>$LOG
  if ($? ne 0); then
    useradd roboshop &>>$LOG
  fi
STAT_CHECK $?

PRINT "Download Catalogue"
$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Extract downloaded code"
$ cd /home/roboshop &>>$LOG && unzip /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue &>>$LOG && cd /home/roboshop/catalogue &>>$LOG && npm install &>>$LOG
STAT_CHECK $?



# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue