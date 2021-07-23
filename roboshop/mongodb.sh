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

PRINT "Installing mongodb"
yum install -y mongodb-org &>>$LOG
STAT_CHECK $?

PRINT "Enable MongoDB\t"
systemctl enable mongod
STAT_CHECK $?

PRINT "Start MongoDB\t"
systemctl start mongod
STAT_CHECK $?



