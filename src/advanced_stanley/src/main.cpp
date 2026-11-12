#include <ros/ros.h>
#include <morai_msgs/GPSMessage.h> 
#include <morai_msgs/EgoVehicleStatus.h> // 현재 속도
#include <morai_msgs/CtrlCmd.h> 
#include <sensor_msgs/Imu.h> 

#include <coordinate/coordinate.hpp>
#include <advanced_stanley/advanced_stanley.hpp>

#include <cmath>

double pos_x = 0.0; // ENU (m)
double pos_y = 0.0; 
double heading = 0.0; // rad
double current_speed = 0.0; // m/s

// GPS -> ENU
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

// IMU -> yaw
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

// cmd type 1은 accel/brake를 직접 주므로 실제 속도가 필요
void EgoCallback(const morai_msgs::EgoVehicleStatus::ConstPtr& msg)
{
    current_speed = msg->velocity.x;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "advanced_stanley");
    ros::NodeHandle n;

    // 경로 파일 읽기
    std::vector<Point> path;

    load_path(
        "/root/catkin_ws/src/path_tracking/Path.txt", path
    );

    ros::Subscriber gps_sub = n.subscribe("/gps", 1000, GPSCallback);
    ros::Subscriber imu_sub = n.subscribe("/imu", 1000, IMUCallback);
    ros::Subscriber ego_sub = n.subscribe("/Ego_topic", 1000, EgoCallback);

    ros::Publisher ctrl_pub =
        n.advertise<morai_msgs::CtrlCmd>("/ctrl_cmd", 10);

    // 파라미터
    double wheelbase = 3.01;

    double target_x = 0.0; // 조향용 target point
    double target_y = 0.0;

    double gain = 5.0; // stanley 횡오차 gain
    double max_speed = 50.0 / 3.6; // 최고 속도 (m/s)
    double max_lat_accel = 1.0; // 허용 횡가속도 (m/s^2), 작을수록 코너에서 더 감속속
    double kp = 0.3; // 속도 P 제어 gain

    double steering_angle = 0.0; // 조향각 (rad)
    double speed = 0.0; // 목표 속도 (m/s)
    double accel = 0.0; // accel 페달 (0~1)
    double brake = 0.0; // brake 페달 (0~1)

    double stop_distance = 1.5;

     // lookahead: 속도 × 시간, 최소 최대로 제한
    double preview_time = 1.0; // 몇 초 앞을 볼지 (s)
    double lookahead_min = 4.0;    
    double lookahead_max = 40.0;

    double speed_target_x = 0.0; // 속도 계획용 타겟점 (조향용보다 멀리)
    double speed_target_y = 0.0;
    double max_decel = 2.0; // 속도 계획에서 가정하는 감속도 (m/s^2)

    ros::Rate loop_rate(50); 

    while (ros::ok())
    {
        ros::spinOnce();

        // 지연 보상 (없으면 코너에서 늦게 꺾어서 바깥으로 밀림)
        double predict_time = 0.1;
        double pred_x = pos_x + current_speed * predict_time * cos(heading);
        double pred_y = pos_y + current_speed * predict_time * sin(heading);

        // 조향용 lookahead
        double lookahead_distance = current_speed * preview_time;

        if (lookahead_distance < lookahead_min)
            lookahead_distance = lookahead_min;
        if (lookahead_distance > lookahead_max)
            lookahead_distance = lookahead_max;

        find_target_point(
            pred_x,
            pred_y,
            path,
            lookahead_distance,
            target_x,
            target_y
        );

        // 속도용 타겟점: 제동거리(v^2 / 2a)만큼 더 앞
        double speed_lookahead = current_speed * current_speed / (2.0 * max_decel)
                                 + lookahead_distance;
        
        find_target_point(
            pred_x,
            pred_y,
            path,
            speed_lookahead,
            speed_target_x,
            speed_target_y
        );

        // 조향
        advanced_stanley(
            pred_x,
            pred_y,
            heading,
            path,
            target_x,
            target_y,
            current_speed,
            gain,
            wheelbase,
            lookahead_distance,
            steering_angle
        );

       // 목표 속도: 가까운 쪽(차선 변경)이랑 먼 쪽(코너) 중 느린 값
        double speed_near = 0.0;
        double speed_far = 0.0;

        target_speed(
            pred_x,
            pred_y,
            heading,
            target_x,
            target_y,
            lookahead_distance,
            max_speed,
            max_lat_accel,
            speed_near
        );

        target_speed(
            pred_x,
            pred_y,
            heading,
            speed_target_x,
            speed_target_y,
            speed_lookahead,
            max_speed,
            max_lat_accel,
            speed_far
        );

        speed = speed_near;
        if (speed_far < speed)
        {
            speed = speed_far;
        }

        end_stop(
            pred_x,
            pred_y,
            path,
            stop_distance,
            speed
        );
    
        speed_control(
            speed,
            current_speed,
            kp,
            accel,
            brake
        );

        morai_msgs::CtrlCmd ctrl_msg;

        ctrl_msg.longlCmdType = 1; // 1: accel / brake 직접 제어
        ctrl_msg.front_steer = -steering_angle; // MORAI 조향 부호에 맞춤
        ctrl_msg.rear_steer = 0.0;
        ctrl_msg.accel = accel;
        ctrl_msg.brake = brake;
        ctrl_msg.acceleration = 0.0;

        ctrl_pub.publish(ctrl_msg);

        ROS_INFO("Position : x = %.3f, y = %.3f", pos_x, pos_y);
        ROS_INFO("Heading : %.3f deg", heading * 180.0 / M_PI);
        ROS_INFO("Lookahead Distance : %.3f m", lookahead_distance);
        ROS_INFO("Target : x = %.3f, y = %.3f", target_x, target_y);
        ROS_INFO("Advanced Stanley Steering Angle : %.3f deg", steering_angle * 180.0 / M_PI);
        ROS_INFO("Current Speed : %.3f km/h", current_speed * 3.6);
        ROS_INFO("Target Speed : %.3f km/h", speed * 3.6);
        ROS_INFO("Accel : %.3f", accel);
        ROS_INFO("Brake : %.3f", brake);

        loop_rate.sleep();
    }

    return 0;
}