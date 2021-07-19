#!usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "Installing frontend ...\e[32mdone\e[0m"
yum install nginx -y >>$LOG

echo "Enabling nginx ...\e[32mdone\e[0m"
systemctl enable nginx >>$LOG

echo "Starting nginx ...\e[32mdone\e[0m"
systemctl start nginx >>$LOG
