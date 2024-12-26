# Use an Ubuntu image as the base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenJDK 17
RUN apt-get update && apt-get install -y openjdk-17-jre && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the application JAR file into the container
COPY build/libs/*.jar /app/app.jar

# Expose the application's default port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
