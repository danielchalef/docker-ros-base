#Name of container: docker-ros-desktop-full
#Version of container: 0.1
# Forked from https://github.com/QuantumObject/docker-ros-base
FROM ubuntu:14.04
MAINTAINER Daniel Chalef  "daniel.chalef@gmail.com"

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y upgrade

#Add ROS repository and update the container
#Installation of necessary package/software for these containers...
RUN apt-get -y update && apt-get -y install wget git vim bash-completion
RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
RUN wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
RUN apt-get update && apt-get install -y -q  build-essential \
                              ros-indigo-desktop-full \
                    && apt-get clean \
                    && rm -rf /tmp/* /var/tmp/*  \
                    && rm -rf /var/lib/apt/lists/*

# Install graphics driver&co for accelerated 3d support (optional, but required if you intend using rviz) 
ADD NVIDIA_DRIVER.run /tmp/NVIDIA_DRIVER.run
RUN sh /tmp/NVIDIA_DRIVER.run -a --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA_DRIVER.run
    
# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1

##startup scripts  
#Pre-config script that needs to be run only when the container runs for the first time 
#Setting a flag for not running it again. This is used for setting up the service.
RUN mkdir -p /etc/my_init.d
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

##Adding Deamons to containers
#pre-config script that needs to be run when container image is created 
#optionally include here additional software that needs to be installed or configured for some service running on the container.
COPY pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf \
    && /bin/bash -c /sbin/pre-conf \
    && rm /sbin/pre-conf


##Script that can be running from the outside using 'docker exec -it container_id commands' tool
## for example to create backups for database.
COPY backup.sh /sbin/backup
RUN chmod +x /sbin/backup
VOLUME /var/backups


#add files and scripts that need to be used for this container
#include conf file related to service/daemon 
#additional tools to be used internally 

# To allow access from outside of the container  to the container service at these ports 
# Need to allow ports access rule at firewall too . 
EXPOSE 11311

#creatian of volume 
#VOLUME 

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
