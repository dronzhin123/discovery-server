FROM gradle:9.3.1-jdk21 AS build
WORKDIR /app
COPY build.gradle.kts settings.gradle.kts /app/
COPY src /app/src
RUN gradle clean build -x test --no-daemon

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/build/libs/*.jar discovery-server.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "discovery-server.jar"]
