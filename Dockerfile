# # Use a specific Maven and OpenJDK 11 base image for the build stage
# FROM maven AS build

# # Set the working directory in the container
# WORKDIR /app

# # Copy the Maven project file
# COPY pom.xml .

# # Copy the entire application source code
# COPY src ./src

# # Build the application
# RUN mvn clean package

# # Use a smaller OpenJDK 11 base image for the final stage
# FROM openjdk

# # Set the working directory in the container
# WORKDIR /app

# # Copy the JAR file from the build stage to the final stage using a wildcard
# COPY --from=build /app/target/*.jar ./

# # Expose the port that the app will run on
# EXPOSE 8080

# # Command to run the application
# CMD ["java", "-jar", "*.jar"]

# Use a specific OpenJDK 11 base image
FROM openjdk:11

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY ./target/springrestapi-0.0.1-SNAPSHOT.jar /app/

# Command to run the application
CMD ["java", "-jar", "springrestapi-0.0.1-SNAPSHOT.jar"]
