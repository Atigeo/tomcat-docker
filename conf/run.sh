#!/bin/bash

# Start Tomcat and tail logs to keep PID 1 going.
start_container() 
{
	start_tomcat
	tail -f ${TOMCAT_HOME}/logs/*
}

# Start the Tomcat service
start_tomcat() 
{
	su ${USER} -c "${TOMCAT_HOME}/bin/catalina.sh start"
}

# Stop the Tomcat service
stop_tomcat() 
{
	kill $(ps -ef | grep apache-tomcat* | grep java | awk ' { print $2 } ')
}


# Startup the container
if [ -z $1 ]; then
	start_container
fi

# Start tomcat
if [ $1 == "start" ]; then 
	start_tomcat
fi

# Stop tomcat
if [ $1 == "stop" ]; then 
	stop_tomcat
fi

# Restart tomcat
if [ $1 == "restart" ]; then 
	stop_tomcat
	start_tomcat
fi
