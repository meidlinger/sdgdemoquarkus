# Start with a base image containing Java runtime
#FROM registry.access.redhat.com/quarkus/mandrel-21-rhel8
FROM registry.access.redhat.com/ubi8/openjdk-11

# Add Maintainer Info
LABEL maintainer="kenny.j.yang@gmail.com"

USER root

COPY * /tmp
RUN cd /tmp && \
    echo PWD=$PWD && \
    ls -al && \
    echo mvn=`which mvn` && \
    mvn -N io.takari:maven:wrapper && \
#    mvn io.quarkus.platform:quarkus-maven-plugin:2.7.5.Final:create \
#        -DprojectGroupId=my-groupId \
#        -DprojectArtifactId=my-artifactId && \
#    ./mvnw quarkus:add-extension \
#        -Dextensions=quarkus-container-image-openshift,quarkus-openshift,quarkus-openshift-client \
#        package && \
    ./mvnw package && \
    mv target/quarkus-app/lib/ /deployments/lib/ && \
    mv target/quarkus-app/*.jar /deployments/ && \
    mv target/quarkus-app/app/ /deployments/app/ && \
    mv target/quarkus-app/quarkus/ /deployments/quarkus/



ARG service_version
ENV SERVICE_VERSION ${service_version:-v1}

# Make port 9080 available to the world outside this container
EXPOSE 9080  8778 9779

USER 1001

# Run the jar file
ENTRYPOINT ["java","-jar","/deployments/quarkus-run.jar"]
