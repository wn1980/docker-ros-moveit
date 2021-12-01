#!/usr/bin/env bash

set -e

rosdep update

sudo apt-get update && sudo apt-get upgrade -y

mkdir -p /workspace/ws_moveit/src

cd /workspace/ws_moveit/src

git clone https://github.com/ros-planning/moveit_tutorials.git -b melodic-devel

git clone https://github.com/ros-planning/panda_moveit_config.git -b melodic-devel

rosdep install -y --from-paths . --ignore-src --rosdistro melodic

cd /workspace/ws_moveit

catkin config --extend /opt/ros/${ROS_DISTRO} --cmake-args -DCMAKE_BUILD_TYPE=Release

catkin build

echo 'source /workspace/ws_moveit/devel/setup.bash' >> ~/.bashrc

source /workspace/ws_moveit/devel/setup.bash
