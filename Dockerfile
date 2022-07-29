FROM maven:3.6.0-jdk-11-slim AS build
COPY /event-api/pom.xml /tmp/
COPY /event-api/src /tmp/src/
WORKDIR /tmp/



RUN mvn -f pom.xml clean package


EXPOSE 8080

#default command



COPY  /event-api/target/event-api-0.0.1-SNAPSHOT.jar /data/event-api-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","data/event-api-0.0.1-SNAPSHOT.jar"]
