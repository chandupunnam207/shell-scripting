#!usr/bin/bash

##FUNCTION TO VALIDATE THE USER
USER_ADD=$(id -u)
if [ $USER_ADD -ne 0 ] ; then
  echo -e "\e[31mYou should be a root user or sudo user to run this command\e[0m"
  exit 2
fi


LOG=/tmp/roboshop.log
rm -f $LOG

##STATUS CHECK FUNCTION TO PRINT SUCCESS OR FAIL
STAT_CHECK() {
  if [ $1 -eq 0 ]; then
     echo -e "\e[32mdone\e[0m"
  else
     echo -e "\e[31mfail\e[0m"
     exit 1
  fi
}

##FUNCTION TO ADD ECHO AND TAB SCRIPT FROM FRONTEND
PRINT() {
  echo -n -e "$1\t\t..."
}