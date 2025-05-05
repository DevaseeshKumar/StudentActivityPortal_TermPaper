FROM openjdk:21-jdk-slim

WORKDIR /app

COPY target/*.war app.war

EXPOSE 1127

ENTRYPOINT ["java", "-jar", "app.war"]