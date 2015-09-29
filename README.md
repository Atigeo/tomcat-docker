xPatterns Tomcat Docker
=============

Summary
-------
A docker container running Tomcat. The /usr/bin/run.sh script can take several parameters.
	start | stop | restart
	$`docker exec <CONTAINER_ID> run.sh restart`
	
By default, the run.sh script will start Tomcat and tail the logs to keep the docker running. 
Logs are visable by using,
	$`docker logs -f <CONTAINER_ID>`

Dependencies
-------
 * Ubuntu >= 12.04, Centos >= 7
 * docker >= 1.8.1 (https://docs.docker.com/installation/)

Installation 
-------
 * Pull the docker container. $`docker pull xpatterns/tomcat:8.0.26`

Running
-------
 * Launch the docker container $`docker run -d -p 8080:8080 -p 8443:8443  xpatterns/tomcat:8.0.26`

Testing
-------
 * From host machine: $`docker ps`

Example
-------


Notes
-------
