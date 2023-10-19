# Use a specific Maven and OpenJDK 11 base image for the build stage
FROM maven AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Copy the entire application source code
COPY src ./src

# Build the application
RUN mvn clean package

# Use a smaller OpenJDK 11 base image for the final stage
FROM openjdk

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage to the final stage using a wildcard
COPY --from=build /app/target/*.jar ./

# Expose the port that the app will run on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "*.jar"]
