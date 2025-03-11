# Use a lightweight OpenJDK 21 runtime
FROM eclipse-temurin:21-jre-alpine

# Set working directory inside the container
WORKDIR /opt/app

# Accept the JAR file name as a build argument
ARG JAR_NAME=docker2025-1.0-SNAPSHOT.jar

# Copy the built JAR file dynamically
COPY target/${JAR_NAME} app.jar

# Expose the application port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]

