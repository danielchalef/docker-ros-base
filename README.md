docker-ros-base
===============

ros-base container

to run the container:

docker run -d -p 11311 quantumobject/docker-ros-base

To used the container you need to access it by

docker exec -it container_id /bin/bash


This container was made to explore and learn the ROS (Robot Operating System). For additional info check :
[http://www.ros.org/](http://www.ros.org/)

For tutorial you can begin exploring at :

[http://wiki.ros.org/ROS/Tutorials/NavigatingTheFilesystem](http://wiki.ros.org/ROS/Tutorials/NavigatingTheFilesystem)

prior procedure of this tutorial already done at the container (Installing and Configuring Your ROS Environment) . The user account and working directory use in this case it is root and root subdirectory. 

If you need to add device to it , please try to run container with -v /dev/xxxx:/dev/xxxxx to include device from server/computer you are running the container ( no sure if that will work ... but let me know ... and maybe you need to add  –privileged too) or  using –device /dev/xxxxx  after docker 1.2
