#include <ros/ros.h>
#include <std_msgs/Int32.h>

void callback(const std_msgs::Int32::ConstPtr& msg)
{
    ROS_INFO("Node3 Received: %d", msg->data);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "chain_sub");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("chain_output", 10, callback);

    ros::spin();

    return 0;
}