# Start with a base image containing Java runtime
FROM registry.access.redhat.com/ubi8/openjdk-11

# Add Maintainer Info
LABEL maintainer="kenny.j.yang@gmail.com"

USER root

COPY * /tmp
RUN cd /tmp && \
    microdnf -y update && microdnf -y install net-tools procps nmap && \
    mvn -N io.takari:maven:wrapper && \
    ./mvnw package && \
    mv target/quarkus-app/lib/ /deployments/lib/ && \
    mv target/quarkus-app/*.jar /deployments/ && \
    mv target/quarkus-app/app/ /deployments/app/ && \
    mv target/quarkus-app/quarkus/ /deployments/quarkus/

ARG service_version
ENV SERVICE_VERSION ${service_version:-v1}

EXPOSE 8080  8778 9779

USER 1001

# Run the jar file
ENTRYPOINT ["java","-jar","/deployments/quarkus-run.jar"]
