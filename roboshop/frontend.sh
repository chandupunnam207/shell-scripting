#!usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

STAT_CHECK(){
  if [ $? eq 0 ] then
    echo done
  else
    echo fail
  fi
}

echo -e "Installing frontend"
yum install nginx -y >>$LOG
echo $?
STAT_CHECK

echo -e "Enabling nginx"
systemctl enable nginx >>$LOG
echo $?
STAT_CHECK

echo -e "Starting nginx"
systemctl start nginx >>$LOG
echo $?
STAT_CHECK