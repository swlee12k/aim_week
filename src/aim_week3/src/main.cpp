#include <ros/ros.h>
#include <morai_msgs/GPSMessage.h>
#include <sensor_msgs/Imu.h>

#include <aim_week3/function.hpp>

#include <fstream>
#include <vector>
#include <cmath>


// 현재 차량 상태값
double pos_x = 0.0;
double pos_y = 0.0;
double heading = 0.0;

// 기준점 UTM 좌표
double ref_easting = 0.0;
double ref_northing = 0.0;


// GPS Callback
void GPSCallback(const morai_msgs::GPSMessage::ConstPtr& msg)
{
    double latitude = msg->latitude;
    double longitude = msg->longitude;

    double easting;
    double northing;

    // 현재 GPS 좌표를 UTM으로 변환
    wgs84_to_utm(latitude, longitude, easting, northing);

    // 기준점 기준 로컬 좌표로 변환
    pos_x = easting - ref_easting;
    pos_y = northing - ref_northing;
}


// IMU Callback
void IMUCallback(const sensor_msgs::Imu::ConstPtr& msg)
{
    double qx = msg->orientation.x;
    double qy = msg->orientation.y;
    double qz = msg->orientation.z;
    double qw = msg->orientation.w;

    double roll;
    double pitch;
    double yaw;

    quaternion_to_euler(qx, qy, qz, qw, roll, pitch, yaw);

    // 차량 heading
    heading = yaw;
}


int main(int argc, char **argv)
{
    // ROS 노드 초기화
    ros::init(argc, argv, "aim_week3");
    ros::NodeHandle n;

    // Path.txt 불러오기
    std::vector<Point> path;
    load_path("/root/catkin_ws/src/aim_week3/Path.txt", path);

    // ref.txt 불러오기
    std::ifstream ref_file("/root/catkin_ws/src/aim_week3/ref.txt");

    double ref_latitude;
    double ref_longitude;
    double ref_altitude;

    ref_file
        >> ref_latitude
        >> ref_longitude
        >> ref_altitude;

    ref_file.close();

    // 기준점 WGS84 -> UTM
    wgs84_to_utm(ref_latitude, ref_longitude, ref_easting, ref_northing);


    // Subscriber
    ros::Subscriber gps_sub = n.subscribe("/gps", 1000, GPSCallback);
    ros::Subscriber imu_sub = n.subscribe("/imu", 1000, IMUCallback);


    // Pure Pursuit 설정값
    double lookahead_distance = 5.0;
    double wheelbase = 2.7;

    double target_x = 0.0;
    double target_y = 0.0;

    double pure_pursuit_steering = 0.0;


    // Stanley 설정값
    double gain = 1.0;

    // 임시 속도
    double velocity = 5.0;

    double stanley_steering = 0.0;

    ros::Rate loop_rate(10);

    while (ros::ok())
    {
        // callback 실행
        ros::spinOnce();

        // Pure Pursuit

        find_target_point(pos_x, pos_y, path, lookahead_distance, target_x, target_y);

        pure_pursuit(pos_x, pos_y, target_x, target_y, heading, wheelbase, lookahead_distance, pure_pursuit_steering);


        
        // Stanley
    
        // velocity가 0이면 Stanley 계산 불가능
        if (velocity > 0.1)
        {
            stanley(pos_x, pos_y, heading, path, velocity, gain, stanley_steering);
        }


        // 결과 출력
        ROS_INFO("Position : x = %.3f, y = %.3f", pos_x, pos_y);

        ROS_INFO("Heading : %.3f", heading);

        ROS_INFO("Target : x = %.3f, y = %.3f", target_x, target_y);

        ROS_INFO("Pure Pursuit Steering : %.3f", pure_pursuit_steering);

        ROS_INFO("Stanley Steering : %.3f", stanley_steering);

        loop_rate.sleep();
    }


    return 0;
}