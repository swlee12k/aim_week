#include <cmath>
#include <advanced_stanley/advanced_stanley.hpp>

// 목표 속도: 코너가 급할수록 느리게
// v = sqrt(a_lat / k), k = 2 * sin(alpha) / Ld
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
)

{
    double heading_error = atan2(target_y - pos_y, target_x - pos_x) - heading;

    while (heading_error > M_PI)
        heading_error -= 2.0 * M_PI;
    while (heading_error < -M_PI)
        heading_error += 2.0 * M_PI;

    // 좌우 상관없이 얼마나 급한지만 필요해서 절댓값
    double curvature = fabs(2 * sin(heading_error)) / lookahead_distance;

    // 거의 직선이면 최고 속도 값
    if (curvature < 1e-3) // 0으로 나누기 방지지
    {
        speed = max_speed;
    }
    else
    {
        // 횡가속도 a_lat = v^2 * k가 a_lat을 넘지 않는 속도
        double v = sqrt(max_lat_accel / curvature);

        if (v > max_speed)
        {
            v = max_speed;
        }
        speed = v;
    }
}

// 속도 P 제어 -> accel / brake (cmd type 1)
void speed_control(
    double target,
    double current_speed,
    double kp,
    double &accel,
    double &brake
)

{
    // u > 0이면 가속, u < 0이면 감속
    double u = kp * (target - current_speed);

    accel = 0.0;
    brake = 0.0;

    // MORAI 범위 0~1로 제한
    if (u > 0.0)
    {
        accel = u;
        if (accel > 1.0)
            accel = 1.0;
    }
    else
    {
        accel = 0.0;
        if (u < -1.0)
            brake = 1.0;
        else
            brake = -u; // brake는 양수로 넣어야 하므로 부호 반전
    }
}

// 경로 끝 근처면 목표 속도 0
void end_stop(
    double pos_x,
    double pos_y,
    const std::vector<Point>& path,
    double stop_distance,
    double &speed
)

{
    double dx_end = path.back().x - pos_x;
    double dy_end = path.back().y - pos_y;
    double distance_to_end = sqrt(dx_end * dx_end + dy_end * dy_end);

    if (distance_to_end < stop_distance)
    {
        speed = 0.0;
    }
}