#include <ros/ros.h>
#include <morai_msgs/GPSMessage.h>
#include <sensor_msgs/Imu.h>
#include <morai_msgs/CtrlCmd.h>

#include <aim_week3/function.hpp>

#include <fstream>
#include <vector>
#include <cmath>


// 현재 차량의 위치와 진행 방향을 저장
double pos_x = 0.0;
double pos_y = 0.0;
double heading = 0.0;

// ref.txt 기준점의 UTM 좌표를 저장
double ref_easting = 0.0;
double ref_northing = 0.0;


// GPS 데이터를 받아 현재 차량 위치를 계산하는 함수
void GPSCallback(const morai_msgs::GPSMessage::ConstPtr& msg)
{
    // MORAI GPS에서 위도, 경도 값을 받아옴
    double latitude = msg->latitude;
    double longitude = msg->longitude;

    double easting;
    double northing;

    // 현재 GPS 좌표를 WGS84에서 UTM 좌표로 변환
    wgs84_to_utm(latitude, longitude, easting, northing);

    // 현재 UTM 좌표에서 기준점 UTM 좌표를 빼서 로컬 좌표로 변환환
    pos_x = easting - ref_easting;
    pos_y = northing - ref_northing;
}


// IMU 데이터를 받아 현재 차량의 진행 방향을 계산하는 함수
void IMUCallback(const sensor_msgs::Imu::ConstPtr& msg)
{
    // IMU에서 quaternion 값을 받아옴
    double qx = msg->orientation.x;
    double qy = msg->orientation.y;
    double qz = msg->orientation.z;
    double qw = msg->orientation.w;

    double roll;
    double pitch;
    double yaw;

    // Quaternion을 Euler angle로 변환
    quaternion_to_euler(qx, qy, qz, qw, roll, pitch, yaw);

    // yaw 값을 차량의 heading으로 사용
    heading = yaw;
}


int main(int argc, char **argv)
{
    // ROS 노드 초기화
    ros::init(argc, argv, "aim_week3");
    ros::NodeHandle n;

    // Path.txt의 경로점들을 path vector에 저장
    std::vector<Point> path;
    load_path(
    "/root/catkin_ws/src/aim_week3/Path.txt",
    path);

    // ref.txt 불러오기
    double ref_latitude;
    double ref_longitude;
    double ref_altitude;
    
    load_ref(
    "/root/catkin_ws/src/aim_week3/ref.txt",
    ref_latitude,
    ref_longitude,
    ref_altitude
    );

    // 기준점 GPS 좌표를 UTM으로 변환
    wgs84_to_utm(
        ref_latitude,
        ref_longitude,
        ref_easting,
        ref_northing
    );


    // MORAI의 GPS와 IMU 토픽을 subscribe
    ros::Subscriber gps_sub = n.subscribe("/gps", 1000, GPSCallback);
    ros::Subscriber imu_sub = n.subscribe("/imu", 1000, IMUCallback);

    // 계산된 차량 제어 명령을 /ctrl_cmd 토픽으로 publish
    ros::Publisher ctrl_pub = n.advertise<morai_msgs::CtrlCmd>("/ctrl_cmd", 10);

    // Pure Pursuit에서 사용할 설정값
    double lookahead_distance = 5.0;
    double wheelbase = 3.01;

    // Pure Pursuit가 따라갈 target point 좌표
    double target_x = 0.0;
    double target_y = 0.0;

    // Pure Pursuit에서 계산된 조향각
    double pure_pursuit_steering = 0.0;


    // Stanley에서 사용할 gain 값
    double gain = 4;

    // 차량의 목표 속도
    double velocity = 20.0;

    // Stanley에서 계산된 조향각
    double stanley_steering = 0.0;

    // 약 0.1초마다 반복
    ros::Rate loop_rate(10);

    while (ros::ok())
    {
        // callback을 실행하여 현재 차량의 위치와 heading을 갱신
        ros::spinOnce();

        // 속도 * 시간
        // lookahead distance를 속도에 따라 변경
        lookahead_distance = 3.01 + 0.2 * velocity;

        // Pure Pursuit에서 사용할 target point 찾기
        find_target_point(
        pos_x,
        pos_y,
        path,
        lookahead_distance,
        target_x,
        target_y   
        );
        // Pure Pursuit 조향각 계산
        pure_pursuit(
        pos_x,
        pos_y, 
        target_x,
        target_y,
        heading,
        wheelbase,
        lookahead_distance, 
        pure_pursuit_steering
        );

        // Stanley 조향각 계산
        // velocity가 0이면 Stanley 계산 불가능
        if (velocity > 0.1)
        {
            stanley(
            pos_x,
            pos_y,
            heading,
            path,
            velocity,
            gain,
            stanley_steering
            );
        }

         // MORAI 차량에 보낼 제어 메시지 생성
        morai_msgs::CtrlCmd ctrl_msg;

        // 속도 제어 방식 사용
        ctrl_msg.longlCmdType = 2; // 1: Torque, 2: Velocity, 3: Acceleration

        // 차량 속도 설정
        ctrl_msg.velocity = velocity;

        // Pure Pursuit에서 계산한 조향각을 앞바퀴에 적용
        // // MORAI의 조향 방향과 계산된 부호가 반대라서 -를 붙임
        ctrl_msg.front_steer = -pure_pursuit_steering;;

        // 뒷바퀴 조향 사용 안 함
        ctrl_msg.rear_steer = 0.0;

        // 사용하지 않는 값
        ctrl_msg.accel = 0.0;
        ctrl_msg.brake = 0.0;
        ctrl_msg.acceleration = 0.0;

        // MORAI로 제어 명령 전송
        ctrl_pub.publish(ctrl_msg);

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