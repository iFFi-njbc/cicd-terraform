# Use a specific Maven and OpenJDK 14 base image for the build stage
FROM maven:3.8.4-openjdk-14 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Copy the entire application source code
COPY src ./src

# Build the application
RUN mvn clean package

# Use a smaller OpenJDK 14 base image for the final stage
FROM openjdk:14-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage to the final stage using a wildcard
COPY --from=build /app/target/*.jar ./

# Expose the port that the app will run on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "*.jar"]
