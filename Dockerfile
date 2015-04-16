#name of container: docker-ros-base
#version of container: 0.5.1
FROM quantumobject/docker-baseimage
MAINTAINER Angel Rodriguez  "angel@quantumobject.com"

# Set correct environment variables.
ENV HOME /root

#add repository and update the container
#Installation of necessary package/software for these containers...
RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
RUN wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
RUN apt-get update && apt-get install -y -q  build-essential \
                              ros-indigo-ros-base \
                    && apt-get clean \
                    && rm -rf /tmp/* /var/tmp/*  \
                    && rm -rf /var/lib/apt/lists/*

#General variable definitions....

##startup scripts  
#Pre-config script that needs to be run only when the container runs for the first time 
#Setting a flag for not running it again. This is used for setting up the service.
RUN mkdir -p /etc/my_init.d
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh


##Adding Deamons to containers

#pre-config script for another service that needs to be run when container image is created 
#optionally include here additional software that needs some service to be installed, like for example mysqld
COPY pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf \
    && /bin/bash -c /sbin/pre-conf \
    && rm /sbin/pre-conf


## script that can be running from the outside using docker-bash tool ...
## for example to create backups for database with convitation of VOLUME dockers-bash container_ID backup_mysql
COPY backup.sh /sbin/backup
RUN chmod +x /sbin/backup
VOLUME /var/backups


#add files and scripts that need to be used for this container
#include conf file related to service/daemon 
#additional tools to be used internally 

# some ports need to be allowed access from outside of the server. 
EXPOSE 11311

#creatian of volume 
#VOLUME 

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
