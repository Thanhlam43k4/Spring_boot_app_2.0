FROM openjdk:22-jdk-oracle

COPY target/hello-world-0.0.1-SNAPSHOT.war app.jar

ENTRYPOINT ["java","-jar","app.jar"]