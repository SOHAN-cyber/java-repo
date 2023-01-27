FROM maven as builder
COPY . /app
RUN mvn clean package

From tomcat:8-jre8
COPY --from=builder /app/webapp/target/webapp.war /usr/local/tomcat/ROOT.war
