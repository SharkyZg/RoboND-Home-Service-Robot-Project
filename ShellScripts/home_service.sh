#!/bin/sh
xterm  -e  " source ../../devel/setup.bash && roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/turtlebot_world.launch" &
sleep 5
xterm  -e  " source ../../devel/setup.bash && export TURTLEBOT_GAZEBO_MAP_FILE= && roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/amcl_demo.launch" & 
sleep 5
xterm  -e  " source ../../devel/setup.bash && roslaunch ../turtlebot_interactions/turtlebot_rviz_launchers/launch/view_navigation.launch " &
sleep 10
xterm  -e  " source ../../devel/setup.bash && roslaunch ../add_markers/launch/add_markers.launch " &
xterm  -e  " source ../../devel/setup.bash && roslaunch ../pick_objects/launch/pick_objects.launch "