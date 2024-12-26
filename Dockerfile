# Stage 1: Build the application
# Use the official Gradle image with JDK 17 to build the Java application
FROM gradle:7.6-jdk17 AS build

# Set the working directory inside the container for the build process
WORKDIR /app

# Copy the entire project (source code and Gradle configuration) to the container
COPY . .

# Make the Gradle wrapper executable
RUN chmod +x ./gradlew

# Run the Gradle build command to compile the application and create the JAR file
RUN ./gradlew build

# Stage 2: Run the application
# Use the official Ubuntu 20.04 image as the base for the runtime environment
FROM ubuntu:20.04

# Update the package index and install the OpenJDK 17 runtime
RUN apt-get update && apt-get install -y openjdk-17-jre && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container for the application
WORKDIR /app

# Copy the built JAR files from the build stage to the runtime image
COPY --from=build /app/build/libs/*.jar /app/

# Debug step: List the files in the /app directory to verify the copied JARs
RUN ls -la /app/

# Rename the main application JAR file to a standard name (app.jar) for consistent entry point
# This uses a wildcard to locate the correct JAR file based on its name pattern
RUN mv /app/*-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose port 8080 to make the application accessible
EXPOSE 8080

# Define the entry point to run the application JAR using Java
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
