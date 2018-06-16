#!/bin/sh
xterm  -e  " export TURTLEBOT_GAZEBO_WORLD_FILE=/home/workspace/catkin_ws/src/World/gazebo.world && source ../../devel/setup.bash && roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/turtlebot_world.launch world_file:=/home/workspace/catkin_ws/src/World/gazebo.world" &
sleep 5
xterm  -e  " roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/gmapping_demo.launch" & 
sleep 5
xterm  -e  " roslaunch ../turtlebot_interactions/turtlebot_rviz_launchers/launch/view_navigation.launch " & 
sleep 5
xterm  -e  " roslaunch ../turtlebot/turtlebot_teleop/launch/keyboard_teleop.launch "
