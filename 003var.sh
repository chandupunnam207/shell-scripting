#!usr/bin/bash

a=10
b=20
c=$((a*b))
echo $a
echo $b
echo $c

Date=$(date +%F)
echo Welcome, Today date is $Date

##Output of LS and Cat commands for files
Output_files=$(cat 001Shell.sh)
echo Here is the output for your shell = $Output_files


a=(10 20 30 40 50 60 70 80 90 100 200 300 400 500 600 700 800)
echo ${a[*]}