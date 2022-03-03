build: ./mvnw package
run: java -jar ./target/quarkus-app/quarkus-run.jar

add new user:
curl -X POST localhost:8080/v1/api/sdg/demo/person/name/Darren/title/Parnter
get all employee
 curl localhost:8080/v1/api/sdg/demo/person/all
 Check person title
curl localhost:8080/v1/api/sdg/demo/person/title/name/Darren