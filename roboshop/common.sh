#!usr/bin/bash

USER_ADD=$(id -u)
if [USER_ADD ne 0] ; then
  echo -e "\e[31mYou should be a root user or sudo user to run this command\e[0m"
fi


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
