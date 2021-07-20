#!usr/bin/bash

source common.sh

LOG=/tmp/roboshop.log
rm -f $LOG

STAT_CHECK() {
  if [ $1 -eq 0 ]; then
     echo -e "\e[32m\tdone\e[0m"
  else
     echo -e "\e[31mfail\e[0m"
     exit 1
  fi
}

echo -n -e "Installing frontend..."
yum install nginx -y &>>$LOG
STAT_CHECK $?


echo -n -e "Enabling nginx\t..."
systemctl enable nginx &>>$LOG
STAT_CHECK $?

echo -n -e "Starting nginx\t..."
systemctl start nginx &>>$LOG
STAT_CHECK $?
