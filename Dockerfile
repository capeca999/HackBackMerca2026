FROM maven:3.9.9 AS build
WORKDIR /app

COPY / /app
RUN mvn clean install -DskipTests

FROM amazoncorretto:21
COPY --from=build /app/target/hackatonMerca-0.0.1-SNAPSHOT.jar /app/app.jar

WORKDIR /app

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]