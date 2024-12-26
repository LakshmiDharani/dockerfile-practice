# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jre-slim

# Set the working directory
WORKDIR /app

# Copy the application JAR file into the container
# Update the path based on Spring Boot's default build output structure
COPY build/libs/*.jar /app/app.jar

# Expose the application's default port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
