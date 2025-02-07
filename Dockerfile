FROM tomcat:9
MAINTAINER shubham.borkar
COPY **/**.war /usr/local/tomcat/webapps/
RUN mv /usr/local/tomcat/webapps/**.war /usr/local/tomcat/webapps/student.war
