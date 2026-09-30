#include <ros/ros.h>
#include <morai_msgs/GPSMessage.h>
#include <sensor_msgs/Imu.h>
#include <aim_week2/Transform.hpp>

void gpsCallback(const morai_msgs::GPSMessage::ConstPtr& msg)
{
    double latitude = msg->latitude;
    double longitude = msg->longitude;
    double altitude = msg->altitude;

    double easting, northing;
    double east, north, up;

    // WGS84 -> UTM
    WGS84_to_UTM(latitude, longitude,
                 easting, northing);

    // WGS84 -> ENU
    WGS84_to_ENU(latitude, longitude, altitude,
                 east, north, up);

    ROS_INFO("GPS : Lat: %.8f, Lon: %.8f, Alt: %.2f",
             latitude, longitude, altitude);

    ROS_INFO("UTM : Easting: %.3f, Northing: %.3f",
             easting, northing);

    ROS_INFO("ENU : East: %.3f, North: %.3f, Up: %.3f",
             east, north, up);
}

 void imuCallback(const sensor_msgs::Imu::ConstPtr& msg)
{
    double qx = msg->orientation.x;
    double qy = msg->orientation.y;
    double qz = msg->orientation.z;
    double qw = msg->orientation.w;

    double roll;
    double pitch;
    double yaw;
    Quaternion_to_Euler(qx, qy, qz, qw, roll, pitch, yaw);

    double ned_roll, ned_pitch, ned_yaw;
    ENU_to_NED(roll, pitch, yaw,
               ned_roll, ned_pitch, ned_yaw);

    double enu_roll, enu_pitch, enu_yaw;
    NED_to_ENU(ned_roll, ned_pitch, ned_yaw,
               enu_roll, enu_pitch, enu_yaw);

    ROS_INFO("Quaternion : qx: %f, qy: %f, qz: %f, qw: %f", qx, qy, qz, qw);
    
    ROS_INFO("Euler : Roll: %f, Pitch: %f, Yaw: %f", roll, pitch, yaw);

    ROS_INFO("ENU->NED : Roll: %.2f, Pitch: %.2f, Yaw: %.2f",
             ned_roll, ned_pitch, ned_yaw);

    ROS_INFO("NED->ENU : Roll: %.2f, Pitch: %.2f, Yaw: %.2f",
             enu_roll, enu_pitch, enu_yaw);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "transformation_subscriber");
    ros::NodeHandle n;
    ros::Subscriber gps_sub=n.subscribe("/gps", 1000, gpsCallback);
    ros::Subscriber imu_sub=n.subscribe("/Imu", 1000, imuCallback);
    ros::Rate loop_rate(10);

    while (ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
    }
   return 0;
}