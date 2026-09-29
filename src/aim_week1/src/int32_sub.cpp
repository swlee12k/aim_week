#include <ros/ros.h>
#include <std_msgs/Int32.h>

void callback(const std_msgs::Int32::ConstPtr& msg)
{
    ROS_INFO("Received: %d", msg->data);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "int32_sub");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("number", 10, callback);
    ros::spin();
    return 0;
}