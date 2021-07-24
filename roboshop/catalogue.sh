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
cd /home/roboshop && unzip -o /tmp/catalogue.zip &>>$LOG && rm -rf catalogue && mv catalogue-main catalogue &>>$LOG
STAT_CHECK $?

PRINT "Install NodeJS dependencies"
cd /home/roboshop/catalogue && npm install --unsafe-perm&>>$LOG
STAT_CHECK $?

PRINT "Fix Application permissions"
chown roboshop: roboshop /home/roboshop -R &>>$LOG
STAT_CHECK $?

PRINT "Update Systemd File"
sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal" /etc/systemd/system/catalogue.service && /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
STAT_CHECK $?


PRINT "Start Catalogue service"
systemctl daemon-reload &>>$LOG && systemctl start catalogue &>>$LOG && systemctl enable catalogue &>>$LOG
STAT_CHECK $?