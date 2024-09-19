#!/bin/bash

RunningPort=`netstat -ntlp  | grep 8080 | awk -F: '{print $4}'`

if [[ -n "${RunningPort}" ]]
then
        sudo sh /opt/tomcat9/bin/shutdown.sh
        echo "Service is Down!!!"
else
        echo "Already Down!!!"
fi
