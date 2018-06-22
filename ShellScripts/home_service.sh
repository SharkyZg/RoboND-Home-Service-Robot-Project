#!/bin/sh
xterm  -e  " source ~/catkin_ws/devel/setup.bash && roslaunch ~/catkin_ws/src/turtlebot_simulator/turtlebot_gazebo/launch/turtlebot_world.launch world_file:=~/catkin_ws/src/World/gazebo.world" &
sleep 5
xterm  -e  " source ~/catkin_ws/devel/setup.bash && roslaunch ~/catkin_ws/src/turtlebot_simulator/turtlebot_gazebo/launch/amcl_demo.launch map_file:=~/catkin_ws/src/World/map.yaml" & 
sleep 5
xterm  -e  " source ~/catkin_ws/devel/setup.bash && roslaunch ~/catkin_ws/src/turtlebot_interactions/turtlebot_rviz_launchers/launch/view_navigation.launch " &
sleep 10
xterm  -e  " source ~/catkin_ws/devel/setup.bash && roslaunch ~/catkin_ws/src/add_markers/launch/add_markers.launch " &
xterm  -e  " source ~/catkin_ws/devel/setup.bash && roslaunch ~/catkin_ws/src/pick_objects/launch/pick_objects.launch "