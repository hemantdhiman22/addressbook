# Use OpenJDK 8 as a parent image
FROM openjdk:8-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/addressbook.jar app.jar

# Expose the application's default port (modify if needed)
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "app.jar"]
