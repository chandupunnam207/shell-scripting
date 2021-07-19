#!usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "Installing frontend ...\e[32m\tdone\e[0m"
yum install nginx -y >>$LOG

echo -e "Enabling nginx ...\e[32m\tdone\e[0m"
systemctl enable nginx >>$LOG

echo -e "Starting nginx ...\e[32m\tdone\e[0m"
systemctl start nginx >>$LOG
