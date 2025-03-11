FROM eclipse-temurin:21-jre-alpine
WORKDIR /opt/app

# Copy the JAR file from the target directory
COPY target/myapp-1.0-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
