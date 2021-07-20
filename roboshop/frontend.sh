#!usr/bin/bash

source common.sh

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing frontend"
yum install nginx -y >>$LOG

  if [ $? -eq 0 ]; then
    echo -n -e "\e[32mdone\e[0m"
  else
    echo -n -e "\e[31mfail\e[0m"
fi



echo -e "Enabling nginx"
systemctl enable nginx >>$LOG
  if [ $? -eq 0 ]; then
    echo -n -e "\e[32mdone\e[0m"
  else
    echo -n -e "\e[31mfail\e[0m"
fi



echo -e "Starting nginx"
systemctl start nginx >>$LOG

  if [ $? -eq 0 ]; then
    echo -n -e "\e[32mdone\e[0m"
  else
    echo -n -e "\e[31mfail\e[0m"
fi

