# Stage 1: Build the application
FROM gradle:7.6-jdk17 AS build
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew build

# Stage 2: Run the application
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openjdk-17-jre && rm -rf /var/lib/apt/lists/*
WORKDIR /app
# Copy all JARs to the app directory
COPY --from=build /app/build/libs/*.jar /app/
# Debug step: List files in /app
RUN ls -la /app/
# Rename the desired JAR to app.jar
RUN mv /app/*-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
