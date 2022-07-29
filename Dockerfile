FROM maven:3.8.5-openjdk-11 AS maven_build
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

#pull base image

FROM openjdk

EXPOSE 8080

#default command



COPY  /event-api/target/event-api-0.0.1-SNAPSHOT.jar /data/event-api-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","data/event-api-0.0.1-SNAPSHOT.jar"]
