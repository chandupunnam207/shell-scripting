#!usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing frontend"
yum install nginx -y >>$LOG
if [ $? -eq 0 ]; then
    echo -n -e "\e[32m\t\tdone"
  else
    echo -n -e "\e[32m\t\tfail"
fi



echo -e "Enabling nginx"
systemctl enable nginx >>$LOG
if [ $? -eq 0 ]; then
    echo -n -e "\e[32m\t\tdone"
  else
    echo -n -e "\e[32m\t\tfail"
fi



echo -e "Starting nginx"
systemctl start nginx >>$LOG
if [ $? -eq 0 ]; then
    echo -n -e "\e[32m\t\tdone"
  else
    echo -n -e "\e[32m\t\tfail"
fi
