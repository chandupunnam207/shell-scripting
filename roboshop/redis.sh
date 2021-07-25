#!usr/bin/bash

source common.sh

PRINT "Install epel release"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
STAT_CHECK $?

PRINT "Install Remi Repo"
yum install redis -y --enablerepo=remi &>>$LOG
STAT_CHECK $?

PRINT "Update Redis IP"
sed -i -e "s/127.0.0.1/0.0.0.0/" /etc/redis.conf &>>$LOG
STAT_CHECK $?

PRINT "Enable and Start Redis service"
systemctl enable redis &>>$LOG && systemctl start redis &>>$LOG
STAT_CHECK $?


