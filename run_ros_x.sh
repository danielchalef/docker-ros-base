#!/bin/bash

xhost +
docker run \
   -p 11311:11311 -p 33433:33433 -p 80:80 -p 9090:9090 \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -e DISPLAY=$DISPLAY \
   -it ros-desktop-full /bin/bash
xhost -
