FROM eclipse-temurin:21-jdk
EXPOSE 8080
ARG JAR_FILE=target/aws-xray-spring-boot-sample-*.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
