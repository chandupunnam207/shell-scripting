#!usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "Installing frontend ...\e[32mdone\e[0m"
yum install nginx -y >>$LOG

echo -e "Enabling nginx \t...\e[32mdone\e[0m"
systemctl enable nginx >>$LOG

echo -e "Starting nginx \t...\e[32mdone\e[0m"
systemctl start nginx >>$LOG
