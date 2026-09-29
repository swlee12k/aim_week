#include <ros/ros.h>
#include <aim_week1/CustomMsg.h>

void callback(const aim_week1::CustomMsg::ConstPtr& msg)
{
    ROS_INFO("float_data: %f", msg->float_data);
    ROS_INFO("double_data: %f", msg->double_data);

    for (int i = 0; i < msg->float_array.size(); i++)
    {
        ROS_INFO("float_array[%d]: %f", i, msg->float_array[i]);
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "custom_sub");
    ros::NodeHandle nh;

    ros::Subscriber sub =
        nh.subscribe("custom_data", 10, callback);

    ros::spin();

    return 0;
}