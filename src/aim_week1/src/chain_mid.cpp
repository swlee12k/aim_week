#include <ros/ros.h>
#include <std_msgs/Int32.h>

ros::Publisher pub;

void callback(const std_msgs::Int32::ConstPtr& msg)
{
    ROS_INFO("Node2 Received: %d", msg->data);

    std_msgs::Int32 new_msg;
    new_msg.data = msg->data * 2;

    pub.publish(new_msg);

    ROS_INFO("Node2 Published: %d", new_msg.data);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "chain_mid");
    ros::NodeHandle nh;

    pub = nh.advertise<std_msgs::Int32>("chain_output", 10);

    ros::Subscriber sub = nh.subscribe("chain_input", 10, callback);

    ros::spin();

    return 0;
}