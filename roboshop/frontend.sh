#!usr/bin/bash

source common.sh

PRINT "Installing frontend\t"
yum install nginx -y &>>$LOG
STAT_CHECK $?

PRINT "Download Frontend\t"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Remove Old HTDocs\t"
cd /usr/share/nginx/html && rm -rf * &>>$LOG
STAT_CHECK $?

PRINT "Extract Frontend Zip\t"
unzip /tmp/frontend.zip &>>$LOG  && mv frontend-main/* . &>>$LOG && mv static/* . &>>$LOG && rm -rf frontend-master static &>>$LOG
STAT_CHECK $?

PRINT "Update Roboshop Configuration"
sed -i -e "catalogue/ s/localhost/catalogue.roboshop.internal/" -e "user/ s/localhost/user.roboshop.internal/" -e "cart/ s/localhost/cart.roboshop.internal/" mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG
STAT_CHECK $?

PRINT "Enabling nginx\t\t"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT "Starting nginx\t\t"
systemctl start nginx &>>$LOG
STAT_CHECK $?





