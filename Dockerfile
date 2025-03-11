FROM eclipse-temurin:21-jre-alpine

WORKDIR /opt/app

ARG JAR_NAME=myapp-1.0-SNAPSHOT.jar

COPY ${JAR_NAME} app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
