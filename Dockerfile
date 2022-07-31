FROM maven:3.6.0-jdk-11-slim AS build


WORKDIR /app
 

COPY event-api/pom.xml ./

COPY event-api/src ./src
RUN mvn -f pom.xml package

RUN echo pwd

EXPOSE 8080

#COPY  ./target/event-api-*-SNAPSHOT.jar event-api.jar

ENTRYPOINT ["java","-jar","target/event-api-0.0.1-SNAPSHOT.jar"]
