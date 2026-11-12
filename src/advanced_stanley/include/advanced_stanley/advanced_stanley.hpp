#ifndef ADVANCED_STANLEY_HPP
#define ADVANCED_STANLEY_HPP

// Point, load_path, find_target_point를 사용 
#include <path_tracking/function.hpp>

// 횡방향 Advanced Stanley 조향각 계산
void advanced_stanley(
    double pos_x,
    double pos_y,
    double heading,
    const std::vector<Point>& path,
    double target_x,
    double target_y,
    double velocity,
    double gain,
    double wheelbase,
    double lookahead_distance,
    double &steering_angle
);

// 종방향 곡률 기반 목표 속도 계산 (m/s)
void target_speed(
    double pos_x,
    double pos_y,
    double heading,
    double target_x,
    double target_y,
    double lookahead_distance,
    double max_speed,
    double max_lat_accel,
    double &speed
);

// 종방향 P 제어로 accel / brake 결정
void speed_control(
    double target,
    double current_speed,
    double kp,
    double &accel,
    double &brake
);

// 경로 끝 근처에서 목표 속도를 0으로
void end_stop(
    double pos_x,
    double pos_y,
    const std::vector<Point>& path,
    double stop_distance,
    double &speed
);

#endif