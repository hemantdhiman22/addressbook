FROM public.ecr.aws/docker/library/maven:amazoncorretto  as maven
LABEL COMPANY="Addressbook"
LABEL MAINTAINER="support@addressbook.com"
LABEL APPLICATION="addressbook"

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN mvn package 

FROM public.ecr.aws/docker/library/tomcat:8.5-jdk15-openjdk-oracle
#ARG TOMCAT_FILE_PATH=/docker 
	
#Data & Config - Persistent Mount Point
#ENV APP_DATA_FOLDER=/var/lib/SampleApp
#ENV SAMPLE_APP_CONFIG=${APP_DATA_FOLDER}/config/
	
#ENV CATALINA_OPTS="-Xms1024m -Xmx4096m -XX:MetaspaceSize=512m -	XX:MaxMetaspaceSize=512m -Xss512k"

#Move over the War file from previous build step
WORKDIR /usr/local/tomcat/webapps/
COPY --from=maven /usr/src/app/target/addressbook.war /usr/local/tomcat/webapps/addressbook.war

#COPY ${TOMCAT_FILE_PATH}/* ${CATALINA_HOME}/conf/

#WORKDIR $APP_DATA_FOLDER

EXPOSE 8080
ENTRYPOINT ["catalina.sh", "run"]
