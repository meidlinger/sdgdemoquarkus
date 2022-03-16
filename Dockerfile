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
    mvn io.quarkus.platform:quarkus-maven-plugin:2.7.5.Final:create \
        -DprojectGroupId=my-groupId \
        -DprojectArtifactId=my-artifactId && \
    ./mvnw quarkus:add-extension \
        -Dextensions=quarkus-container-image-openshift,quarkus-openshift,quarkus-openshift-client \
        package && \
    mv ./target/SDGDemoBoot-0.0.1.jar /


ARG service_version
ENV SERVICE_VERSION ${service_version:-v1}

# Make port 9080 available to the world outside this container
EXPOSE 9080  8778 9779

USER 1001

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/SDGDemoBoot-0.0.1.jar"]
