# ---- xPatterns Tomcat Docker ----
#
# Created by : Greg Abdo
#
# Usage : docker run -d -p 8080:8080 -p 8443:8443 xpatterns/tomcat:8.0.26
#


# ---- Version control ----

FROM xpatterns/java:8u65

ENV TOMCAT_VERSION 8.0.35


# ---- Download Links ----

ENV TOMCAT_DOWNLOAD_LINK https://s3.amazonaws.com/xpatterns/dependencies/tomcat/apache-tomcat-${TOMCAT_VERSION}.tar.gz


# ---- Default Environmental Variables ----

ENV USER tomcat
ENV TOMCAT_HOME /usr/local/apache-tomcat

ENV JAVA_XMS 1g
ENV JAVA_XMX 1g
ENV JAVA_PERM 1g
ENV JAVA_MAX_PERM 1g

# ---- Ports ----

EXPOSE 8080
EXPOSE 8443


# ---- Create user tomcat ----

RUN useradd $USER -U
RUN echo $USER:$USER| chpasswd


# ---- Install Tomcat 8 ----

RUN wget ${TOMCAT_DOWNLOAD_LINK} -P /tmp/
RUN tar xzf /tmp/*.tar.gz -C /tmp/
RUN rm -Rf /tmp/*.tar.gz
RUN mv /tmp/apache-tomcat* ${TOMCAT_HOME}
RUN chown -R ${USER}:${USER} ${TOMCAT_HOME}

RUN update-alternatives --install "/bin/catalina" "catalina" "$TOMCAT_HOME/bin/catalina.sh" 1

COPY conf/catalina.sh ${TOMCAT_HOME}/bin/


# ---- Copy scripts  ----

COPY conf/run.sh	/usr/bin/run.sh
RUN chmod u+x /usr/bin/run.sh

CMD ["/usr/bin/run.sh"]
