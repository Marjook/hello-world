FROM maven:3.3-jdk-8 AS build
RUN apk add --no-cache git
RUN git clone --depth 1 "https://github.com/Marjook/hello-world.git" .
RUN mvn clean package

# Pull base image 
FROM tomcat:8-jre8 
COPY --from=build ./webapp/target/webapp.war /usr/local/tomcat/webapps
