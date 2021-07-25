#!usr/bin/bash

source common.sh

PRINT "Install epel release\t"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
STAT_CHECK $?

PRINT "Install Remi Repo\t"
yum install redis -y --enablerepo=remi &>>$LOG
STAT_CHECK $?

PRINT "Update Redis IP\t\t"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf  /etc/redis/redis.conf
STAT_CHECK $?

PRINT "Enable and Start Redis service"
systemctl enable redis &>>$LOG && systemctl restart redis &>>$LOG
STAT_CHECK $?


