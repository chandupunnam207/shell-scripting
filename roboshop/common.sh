#!usr/bin/bash

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
