FROM ubuntu:18.04
RUN apt-get update
RUN apt install -y default-jdk tomcat8 maven git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR "/boxfuse-sample-java-war-hello"
RUN  mvn package
RUN cp -r target/hello-1.0 /var/lib/tomcat8/webapps/
EXPOSE 8080
RUN mkdir -p /usr/share/tomcat8/conf && cp /etc/tomcat8/server.xml /usr/share/tomcat8/conf/server.xml && mkdir -p /usr/share/tomcat8/common/classes && mkdir -p /usr/share/tomcat8/server/classes && mkdir -p /usr/share/tomcat8/shared/classes && mkdir -p /usr/share/tomcat8/temp && mkdir -p /usr/share/tomcat8/logs
ENV CATALINA_BASE /var/lib/tomcat8
CMD ["/usr/share/tomcat8/bin/catalina.sh", "run"]