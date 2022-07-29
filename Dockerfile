FROM maven:3.8.5-openjdk-11 AS maven_build
COPY /event-api/pom.xml /tmp/
COPY /event-api/src /tmp/src/
WORKDIR /tmp/



RUN chmod a+x /usr/bin/mvn

RUN mvn package

#pull base image

FROM openjdk

EXPOSE 8080

#default command



COPY  /event-api/target/event-api-0.0.1-SNAPSHOT.jar /data/event-api-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","data/event-api-0.0.1-SNAPSHOT.jar"]
