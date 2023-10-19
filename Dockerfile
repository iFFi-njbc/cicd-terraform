# Use a more recent OpenJDK base image
FROM openjdk

# Set the working directory in the container
WORKDIR /app

# Copy the entire application source code
COPY . /app

# Build the application
RUN ./mvnw clean package

# Expose the port that the application will run on
EXPOSE 8080

# Entry point command to run the application
CMD ["java", "-jar", "target/springrestapi-0.0.1-SNAPSHOT.jar"]
