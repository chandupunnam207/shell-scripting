#!/usr/bin/bash

source common.sh

PRINT "Setting up repository"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT_CHECK $?

PRINT "Installing mongodb\t"
yum install -y mongodb-org &>>$LOG
STAT_CHECK $?

PRINT "Update mongodb IP in config"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT_CHECK $?

PRINT "Enable MongoDB\t\t"
systemctl enable mongod &>>$LOG && systemctl start mongod &>>$LOG
STAT_CHECK $?

PRINT "Download mongodb schema\t"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"&>>$LOG
STAT_CHECK $?

PRINT "Download mongodb schema\t"
cd /tmp && unzip mongodb.zip&>>$LOG $$ cd mongodb-main && mongo < catalogue.js&>>$LOG && mongo < users.js&>>$LOG
STAT_CHECK $?








