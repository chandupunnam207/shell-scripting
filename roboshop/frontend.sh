#!usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "\e32mInstalling frontend ...done\e[0m"
yum install nginx -y >>$LOG

systemctl enable nginx >>$LOG

systemctl start nginx >>$LOG
