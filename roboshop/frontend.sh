#!usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "Installing frontend ...\e32mdone\e[0m"
yum install nginx -y >>$LOG

echo "Enabling nginx"
systemctl enable nginx >>$LOG

echo "Starting nginx"
systemctl start nginx >>$LOG
