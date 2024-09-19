#!/bin/bash
sleep 20
find /opt/tomcat9/webapps/ -name "addressbook*"  -exec chown -R tomcat:tomcat {}  \;
sleep 20
sudo sh /opt/tomcat9/bin/startup.sh
sleep 20

port=`netstat -ntlp  | grep 8080 | awk -F: '{print $4}'`

if [[ -z ${port}  ]]
then
        echo "Service is not UP!!!"
        exit 1
fi
