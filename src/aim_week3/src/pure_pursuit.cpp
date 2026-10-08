#include <cmath>
#include <aim_week3/function.hpp>

// Pure Pursuit으로 조향각을 계산하는 함수
void pure_pursuit(
    double pos_x,
    double pos_y,
    double target_x,
    double target_y,
    double heading,
    double wheelbase,
    double lookahead_distance,
    double &steering_angle
)
{
    // 현재 차량에서 target point까지의 x, y 거리 차이
    double dx = target_x - pos_x;
    double dy = target_y - pos_y;

    // 차량 위치에서 target point를 바라보는 각도
    double angle_to_target = atan2(dy, dx);
    // 현재 차량의 heading과 target 방향 사이의 각도 차이
    double alpha = angle_to_target - heading;

    //경로의 곡률 계산
    double curvature = (2 * sin(alpha)) / lookahead_distance; //곡률 계산

    //최종 조향각 계산
    steering_angle = atan(curvature * wheelbase); //조향각 계산
}