# Use an official Maven image as the base image for building
FROM maven AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the entire application source code
COPY . /app

# Build the application
RUN mvn clean package

# Use a lightweight OpenJDK image as the base image for the final image
FROM openjdk

# Set the working directory in the container
WORKDIR /app

# Copy the executable JAR file from the builder stage
COPY --from=builder /app/target/*.jar /app/springrestapi-0.0.1-SNAPSHOT.jar

# Expose the port that the application will run on
EXPOSE 8080

# Entry point command to run the application
CMD ["java", "-jar", "springrestapi-0.0.1-SNAPSHOT.jar"]
