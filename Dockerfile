# Use Java 21 runtime
FROM eclipse-temurin:21-jre-alpine

# Set working directory inside the container
WORKDIR /opt/app

# Accept the JAR file name as a build argument
ARG JAR_NAME=myapp-1.0-SNAPSHOT.jar

# Copy the built JAR file from Jenkins workspace
COPY /var/lib/jenkins/workspace/mypipeline/target/${JAR_NAME} app.jar

# Expose the application port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
