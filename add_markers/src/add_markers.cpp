#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include "nav_msgs/Odometry.h"

bool objectPicked;
bool objectDelivered;

void checkPosition(const nav_msgs::Odometry::ConstPtr &msg)
{

  ros::Rate r(1);
  ros::NodeHandle n;
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1);
  float x = msg->pose.pose.position.x;
  float y = msg->pose.pose.position.y;
  ROS_INFO("Position-> x: [%f], y: [%f], z: [%f]", x, y, msg->pose.pose.position.z);
  ROS_INFO("Object picked: [%d]\n", objectPicked);
  if ((0.0 < x && x < 0.15) && (2.9 < y && y < 3.05))
  {
    objectPicked = true;
  }
  //

  if ((7.35 < x && x < 7.45) && (-2.05 < y && y < -1.95))
  {
    objectDelivered = true;
  }

  visualization_msgs::Marker marker;
  // Set the frame ID and timestamp.  See the TF tutorials for information on these.
  marker.header.frame_id = "/map";
  marker.header.stamp = ros::Time::now();

  // Set the namespace and id for this marker.  This serves to create a unique ID
  // Any marker sent with the same namespace and id will overwrite the old one
  marker.ns = "basic_shapes";
  marker.id = 0;

  // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
  marker.type = visualization_msgs::Marker::CUBE;
  ;

  // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
  marker.action = visualization_msgs::Marker::ADD;

  // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
  if (objectDelivered)
  {
    marker.pose.position.x = 8.3;
    marker.pose.position.y = -1.3;
    marker.scale.z = 1.0;
  }
  else if (!objectPicked)
  {
    marker.pose.position.x = 0.1;
    marker.pose.position.y = 3.15;
  }
  else
  {
    marker.pose.position.x = 0;
    marker.pose.position.y = 0;
  }

  marker.pose.position.z = 0;
  marker.pose.orientation.x = 0.0;
  marker.pose.orientation.y = 0.0;
  marker.pose.orientation.z = 0.0;
  marker.pose.orientation.w = 1.0;

  // Set the scale of the marker -- 1x1x1 here means 1m on a side
  if (!objectPicked || objectDelivered)
  {
    marker.scale.x = 0.2f;
    marker.scale.y = 0.2f;
    marker.scale.z = 1.0;
  }
  else
  {
    // hide marker
    marker.scale.x = 0.0f;
    marker.scale.y = 0.0f;
    marker.scale.z = 0.0f;
  }
  // Set the color -- be sure to set alpha to something non-zero!
  marker.color.r = 0.0f;
  marker.color.g = 0.0f;
  marker.color.b = 1.0f;
  marker.color.a = 1.0;

  marker.lifetime = ros::Duration();

  // Publish the marker
  while (marker_pub.getNumSubscribers() < 1)
  {
    if (!ros::ok())
    {
      ROS_WARN_ONCE("ROS System error");
    }
    ROS_WARN_ONCE("Please create a subscriber to the marker");
    sleep(1);
  }
  marker_pub.publish(marker);

  r.sleep();
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "add_markers");
  ros::NodeHandle p;
  ros::Subscriber sub = p.subscribe("odom", 1000, checkPosition);
  ros::spin();
}