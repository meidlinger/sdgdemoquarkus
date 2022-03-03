# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="kenny.j.yang@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

ARG service_version
ENV SERVICE_VERSION ${service_version:-v1}

# Make port 9080 available to the world outside this container
EXPOSE 9080  8778 9779

# The application's jar file
ARG JAR_FILE=target/SDGDemoBoot-0.0.1.jar

# Add the application's jar to the container
ADD ${JAR_FILE} SDGDemoBoot-0.0.1.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/SDGDemoBoot-0.0.1.jar"]
