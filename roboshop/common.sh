#!usr/bin/bash

##FUNCTION TO VALIDATE THE USER
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] ; then
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
     echo -e "\eCheck the log file for more details here : $LOG"
     exit 1
  fi
}

##FUNCTION TO ADD ECHO AND TAB SCRIPT FROM FRONTEND
PRINT() {
  echo -n -e "$1\t\t..."
}


NODEJS() {
  PRINT "Install NodeJS\t\t"
  yum install nodejs make gcc-c++ -y &>>$LOG
  STAT_CHECK $?

  PRINT "Add Roboshop Application user"
  id roboshop &>>$LOG
    if [ $? -ne 0 ] ; then
      useradd roboshop &>>$LOG
    fi
  STAT_CHECK $?

  PRINT "Download ${COMPONENT} \t\t"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip" &>>$LOG
  STAT_CHECK $?

  PRINT "Extract downloaded code\t"
  cd /home/roboshop && unzip -o /tmp/${COMPONENT}.zip &>>$LOG && rm -rf ${COMPONENT} && mv ${COMPONENT}-main ${COMPONENT} &>>$LOG
  STAT_CHECK $?

  PRINT "Install NodeJS dependencies"
  cd /home/roboshop/${COMPONENT} && npm install --unsafe-perm&>>$LOG
  STAT_CHECK $?

  PRINT "Fix Application permissions"
  chown roboshop:roboshop /home/roboshop -R &>>$LOG
  STAT_CHECK $?

  PRINT "Setup SystemD File\t"
  sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" -e "s/REDIS_ENDPOINT/redis.roboshop.internal/" -e "s/MONGO_ENDPOINT/mongodb.roboshop.internal/" -e "s/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/" /home/roboshop/${COMPONENT}/systemd.service && mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  STAT_CHECK $?


  PRINT "Start ${COMPONENT}  service\t"
  systemctl daemon-reload &>>$LOG && systemctl restart ${COMPONENT} &>>$LOG && systemctl enable ${COMPONENT} &>>$LOG
  STAT_CHECK $?
}