#!usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "Installing frontend \t...\e[32mdone\e[0m"
yum install nginx -y >>$LOG
echo $?

echo -e "Enabling nginx \t\t...\e[32mdone\e[0m"
systemctl enable nginx >>$LOG
echo $?

echo -e "Starting nginx \t\t...\e[32mdone\e[0m"
systemctl start nginx >>$LOG
echo $?