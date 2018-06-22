#!/bin/sh
xterm  -e  " export TURTLEBOT_GAZEBO_WORLD_FILE=/home/workspace/catkin_ws/src/World/gazebo.world && source ../../devel/setup.bash && roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/turtlebot_world.launch world_file:=/home/workspace/catkin_ws/src/World/gazebo2.world" &
sleep 5
xterm  -e  " source ../../devel/setup.bash && roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/amcl_demo.launch map_file:=/home/workspace/catkin_ws/src/World/map.yaml" & 
sleep 5
xterm  -e  " source ../../devel/setup.bash && roslaunch ../turtlebot_interactions/turtlebot_rviz_launchers/launch/view_navigation.launch " 