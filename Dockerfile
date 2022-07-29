FROM maven:3.6.0-jdk-11-slim AS build
COPY pom.xml /tmp/
COPY src/ /tmp/src/
WORKDIR /tmp/

RUN mvn -f pom.xml package

#default command

FROM openjdk:11-jre-slim

#COPY event-api-0.0.1-SNAPSHOT.jar event-api-0.0.1-SNAPSHOT.jar

EXPOSE 8080

#ENTRYPOINT ["java","-jar","/tmp/event-api-0.0.1-SNAPSHOT.jar"]
#CMD ls
