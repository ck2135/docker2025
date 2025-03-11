# Use a lightweight OpenJDK 11 runtime
FROM eclipse-temurin:11-jre-alpine

# Set working directory inside the container
WORKDIR /opt/app

# Copy the built JAR file from the Jenkins pipeline
ARG JAR_NAME=target/docker2025-1.0-SNAPSHOT.jar
COPY ${JAR_NAME} app.jar

# Expose the application port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]

