#!/usr/bin/bash

type bash
#Printing on the screen can be done by two commands they are
#1.printf
#2.echo
#Syntax echo <MESSAGE TO PRINT>
#Simple echo command
echo Hello World

#Syntax for color or new line is echo -e "MESSAGE\n\t\e" where \n is new line \t is tab space and -e is an option to print new line or tab space
#Syntax for enabling colors is \e and disabling the colors is \e[om
echo -e "\e[35mMy command is printed correctly \nThank you\e[0m"
echo -e "\e[31mApple is red in color\e[0m"
echo -e "\e[32mI like green tea\e[0m"
echo -e "\e[33mMy chair color is yellow\e[0m"
echo -e "\e[36m*\n**\n***\n****\n*****\e[0m"


a=10
b=20
c=(0 10 20 30 40 50 60 70 80 90 100)
echo sum of a and b = $((a+b))
echo ${c[5]}
echo ${c[4]}
echo ${c[9]}
echo ${c[*]:5:9}

echo Name=$name
echo Location=$location
echo course name=$course
echo course start date=$date

## Input function into shell scripting can take input from terminal and can be accessed from input commands such as $0=script name, $1=first argument
# $* or $@ pulls all the parsed values into the script and $# prints the number of values parsed into the script
echo $0
echo $1
echo $*
echo $@
echo $#
echo -e "\e[36m\n*****************\e[0m"

TestFunction(){
  a=100000
  b=200000
  c=300000
  echo value of the first argument of function=$1
  echo value of the first argument of function=$*

}
TestFunction NTPC Bhel
echo value of a =$a
echo value of b =$b
echo value of c =$c
echo value of first argument=$1
echo value of first argument=$*




































