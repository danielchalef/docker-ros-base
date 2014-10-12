#!/bin/bash

set -e

if [ -f /etc/configured ]; then
        cd ~/catkin_ws/
        source devel/setup.bash
        echo 'already configured'
else
      #code that need to run only one time ....
        cd ~/catkin_ws/
        source devel/setup.bash
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi