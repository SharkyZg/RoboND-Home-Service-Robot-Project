#!/bin/sh
xterm  -e  " source ../../devel/setup.bash && roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/turtlebot_world.launch" &
sleep 5
xterm  -e  " source ../../devel/setup.bash && roslaunch ../turtlebot_simulator/turtlebot_gazebo/launch/gmapping_demo.launch" & 
sleep 5
xterm  -e  " source ../../devel/setup.bash && roslaunch ../turtlebot_interactions/turtlebot_rviz_launchers/launch/view_navigation.launch " & 
sleep 5
xterm  -e  " source ../../devel/setup.bash && roslaunch ../wall_follower/launch/wall_follower.launch "
