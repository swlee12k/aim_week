#include <ros/ros.h>
#include <morai_msgs/GPSMessage.h>
#include <sensor_msgs/Imu.h>
#include <morai_msgs/CtrlCmd.h>

#include <path_tracking/function.hpp>
#include <coordinate/coordinate.hpp>

#include <vector>
#include <cmath>

// 현재 차량의 위치와 진행 방향을 저장
double pos_x = 0.0;
double pos_y = 0.0;
double heading = 0.0;

// GPS 데이터를 받아 현재 차량 위치(ENU)를 계산하는 함수
void GPSCallback(const morai_msgs::GPSMessage::ConstPtr& msg)
{
    double latitude = msg->latitude;
    double longitude = msg->longitude;
    double altitude = msg->altitude;

    double east;
    double north;
    double up;

    // ref.txt 기준점은 WGS84_to_ENU.cpp 내부에 설정되어 있음
    WGS84_to_ENU(latitude, longitude, altitude, east, north, up);

    pos_x = east;
    pos_y = north;
}

// IMU 데이터를 받아 현재 차량의 진행 방향을 계산하는 함수
void IMUCallback(const sensor_msgs::Imu::ConstPtr& msg)
{
    double qx = msg->orientation.x;
    double qy = msg->orientation.y;
    double qz = msg->orientation.z;
    double qw = msg->orientation.w;

    double roll;
    double pitch;
    double yaw;

    Quaternion_to_Euler(qx, qy, qz, qw, roll, pitch, yaw);

    heading = yaw;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "path_tracking");
    ros::NodeHandle n;

    std::vector<Point> path;

    load_path(
        "/root/catkin_ws/src/path_tracking/Path.txt",
        path
    );

    ros::Subscriber gps_sub = n.subscribe("/gps", 1000, GPSCallback);
    ros::Subscriber imu_sub = n.subscribe("/imu", 1000, IMUCallback);

    ros::Publisher ctrl_pub =
        n.advertise<morai_msgs::CtrlCmd>("/ctrl_cmd", 10);

    double lookahead_distance = 5.0;
    double wheelbase = 3.01;

    double target_x = 0.0;
    double target_y = 0.0;

    double pure_pursuit_steering = 0.0;

    double gain = 4.0;
    double velocity = 10.0;
    double stanley_steering = 0.0;

    ros::Rate loop_rate(50);

    while (ros::ok())
    {
        ros::spinOnce();

                // 지연 보상: 속도와 heading으로 현재 위치를 앞으로 예측
        double predict_time = 0.2;
        double speed_mps = velocity / 3.6;
        double pred_x = pos_x + speed_mps * predict_time * cos(heading);
        double pred_y = pos_y + speed_mps * predict_time * sin(heading);

        lookahead_distance = 5.0;

        find_target_point(
            pred_x,
            pred_y,
            path,
            lookahead_distance,
            target_x,
            target_y
        );

        pure_pursuit(
            pred_x,
            pred_y,
            target_x,
            target_y,
            heading,
            wheelbase,
            lookahead_distance,
            pure_pursuit_steering
        );

        if (velocity > 0.1)
        {
            stanley(
                pred_x,
                pred_y,
                heading,
                path,
                velocity / 3.6,
                gain,
                wheelbase,
                stanley_steering
            );
        }

        morai_msgs::CtrlCmd ctrl_msg;

        ctrl_msg.longlCmdType = 2;
        ctrl_msg.velocity = velocity;
        ctrl_msg.front_steer = -pure_pursuit_steering;
        ctrl_msg.rear_steer = 0.0;
        ctrl_msg.accel = 0.0;
        ctrl_msg.brake = 0.0;
        ctrl_msg.acceleration = 0.0;

        ctrl_pub.publish(ctrl_msg);

        ROS_INFO("Heading : %.3f deg", heading * 180.0 / M_PI);
        ROS_INFO("Target : x = %.3f, y = %.3f", target_x, target_y);
        ROS_INFO("Pure Pursuit Steering : %.3f deg", pure_pursuit_steering * 180.0 / M_PI);
        ROS_INFO("Stanley Steering : %.3f deg", stanley_steering * 180.0 / M_PI);

        loop_rate.sleep();
    }

    return 0;
}