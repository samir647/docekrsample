FROM maven:3.6.0-jdk-11-slim AS build
COPY /event-api/pom.xml /tmp/
COPY /event-api/src /tmp/src/
WORKDIR /tmp/



RUN mvn -f pom.xml clean package




#default command

FROM openjdk:11-jre-slim

COPY  /tmp/target/event-api-0.0.1-SNAPSHOT.jar  /home/usr/event.jar

EXPOSE 8080

#CMD ls -la
ENTRYPOINT ["java","-jar","/home/usr/event.jar"]
