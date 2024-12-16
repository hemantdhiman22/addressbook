# Use an official Tomcat image as the base image
FROM tomcat:9-jdk8-temurin

# Set the working directory inside the container (optional)
WORKDIR /usr/local/tomcat

# Copy the WAR file to the Tomcat webapps directory
COPY target/addressbook.war webapps/addressbook.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
