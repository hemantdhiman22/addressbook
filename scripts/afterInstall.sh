#!/bin/bash

find /opt/tomcat9/webapps/ -name "addressbook*"  -exec chown -R tomcat:tomcat {}  \;
