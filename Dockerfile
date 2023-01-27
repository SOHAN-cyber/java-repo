FROM maven as builder
WORKDIR /app
COPY . /app
RUN mvn clean package

FROM tomcat:8-jre8
COPY --from=builder /app/webapp/target/webapp.war /usr/local/tomcat/ROOT.war
