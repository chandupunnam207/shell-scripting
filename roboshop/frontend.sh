#!usr/bin/bash

LOG=/tmp/roboshop.log

yum install nginx -y >>$LOG

echo Enabling nginx
systemctl enable nginx >>$LOG


echo Starting nginx
systemctl start nginx >>$LOG

