FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY build/libs/discovery-server-0.0.1-SNAPSHOT.jar discovery-server.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "discovery-server.jar"]