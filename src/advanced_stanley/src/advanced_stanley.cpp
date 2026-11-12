#include <cmath>
#include <advanced_stanley/advanced_stanley.hpp>

// Advanced Stanley
// delta = atan(2L * sin(alpha) / Ld) + atan(k * e / (v + k_soft))
// PP 항으로 앞을 미리 보고, Stanley 횡오차 항으로 경로에 붙게 함
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
)

{
    // 전륜 위치 (Stanley는 앞바퀴 기준)
    double front_x = pos_x + wheelbase * cos(heading);
    double front_y = pos_y + wheelbase * sin(heading);

    // 전륜에서 가장 가까운 경로점
    int nearest_index = 0;
    double min_distance = 999999.0;

    // 아래에서 nearest_index + 1을 쓰니까 마지막 점은 빼고 탐색
    for (int i = 0; i < static_cast<int>(path.size()) - 1; i++)
    {
        double dx = path[i].x - front_x;
        double dy = path[i].y - front_y;

        double distance = sqrt(dx * dx + dy * dy);

        if (distance < min_distance)
        {
            min_distance = distance;
            nearest_index = i;
        }
    }

    // 최근접점에서의 경로 방향
    double path_yaw = atan2(
        path[nearest_index + 1].y - path[nearest_index].y,
        path[nearest_index + 1].x - path[nearest_index].x
    );

    // 횡오차 e
    double error_x = path[nearest_index].x - front_x;
    double error_y = path[nearest_index].y - front_y;

    double cross_track_error = error_y * cos(path_yaw) - error_x * sin(path_yaw);

    // alpha: 타겟점 방향 - heading
    double heading_error = atan2(target_y - pos_y, target_x - pos_x) - heading;

    // -pi ~ pi
    while (heading_error > M_PI)
        heading_error -= 2.0 * M_PI;
    while (heading_error < -M_PI)
        heading_error += 2.0 * M_PI;

    // 저속에서 분모가 0 되는 거 방지
    const double k_soft = 1.0;

    // PP 항
    double pp_term = atan(2.0 * wheelbase * sin(heading_error) / lookahead_distance);
    // Stanley 항
    double stanley_term = atan((gain * cross_track_error) / (velocity + k_soft));

    steering_angle = pp_term + stanley_term;
}