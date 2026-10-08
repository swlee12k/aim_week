#include <cmath>
#include <aim_week3/function.hpp>

void pure_pursuit
(double pos_x, double pos_y, double target_x, double target_y, double heading, double wheelbase, double lookahead_distance, double &steering_angle)
{
    double dx = target_x - pos_x;
    double dy = target_y - pos_y;

    double angle_to_target = atan2(dy, dx); //차량과 target point 사이의 각도 계산
    double alpha = angle_to_target - heading; //차량의 heading과 target point 사이의 각도 차이 계산

    double curvature = (2 * sin(alpha)) / lookahead_distance; //곡률 계산

    steering_angle = atan(curvature * wheelbase); //조향각 계산
}