#include <ros/ros.h>
#include <aim_week1/CustomMsg.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "custom_pub");
    ros::NodeHandle nh;

    ros::Publisher pub =
        nh.advertise<aim_week1::CustomMsg>("custom_data", 10);

    ros::Rate loop_rate(1);

    while (ros::ok())
    {
        aim_week1::CustomMsg msg;

        msg.float_data = 1.5;
        msg.double_data = 3.141592;

        msg.float_array.push_back(1.0);
        msg.float_array.push_back(2.0);
        msg.float_array.push_back(3.0);

        pub.publish(msg);

        ROS_INFO("Custom message published");

        loop_rate.sleep();
    }

    return 0;
}