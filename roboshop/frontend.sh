#!usr/bin/bash

LOG=/tmp/roboshop.log

yum install nginx -y >>$LOG

systemctl enable nginx >>$LOG

systemctl start nginx >>$LOG
