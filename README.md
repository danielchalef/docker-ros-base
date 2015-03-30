# docker-ros-base

Docker container for [ros-base][3]

"The Robot Operating System (ROS) is a set of software libraries and tools that help you build robot applications. From drivers to state-of-the-art algorithms, and with powerful developer tools, ROS has what you need for your next robotics project. And it's all open source."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io
  
To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 11311 quantumobject/docker-ros-base

To used the container you need to access it by

    $ docker exec -it container_id /bin/bash

This container was made to explore and learn the [ROS (Robot Operating System)][1]

For tutorial you can begin exploring at :

[http://wiki.ros.org/ROS/Tutorials/NavigatingTheFilesystem][6]

Prior procedure of this tutorial already done at the container (Installing and Configuring Your ROS Environment). The user account and working directory use in this case it is root and root subdirectory. 

If you need to add a device from the server that docker is running  , please try to run the container with the options –device /dev/xxxxx.

## More Info

About ROS [www.ros.org][1]

To help improve this container [quantumobject/docker-ros-base][5]

[1]:http://www.ros.org
[2]:https://www.docker.com
[3]:http://wiki.ros.org/ROS/Installation
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-ros-base
[6]:http://wiki.ros.org/ROS/Tutorials/NavigatingTheFilesystem
