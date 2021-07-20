#!usr/bin/bash

STAT_CHECK(){
  if [ $? -eq 0 ]; then
    echo -n -e "\e[32mdone\e[0m"
  else
    echo -n -e "\e[31mfail\e[0m"
fi
}