#!/usr/bin/env bash

set -e

if [ ! -d "/workspace/catkin_ws/src" ]; then
    mkdir -p /workspace/catkin_ws/src
fi

source /opt/ros/$ROS_DISTRO/setup.bash && \
cd /workspace/catkin_ws && \
catkin_make

echo "source /workspace/catkin_ws/devel/setup.bash" >> ~/.bashrc 
