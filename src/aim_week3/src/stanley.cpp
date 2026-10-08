#include <cmath>
#include <aim_week3/function.hpp>

// Stanley으로 조향각을 계산하는 함수
void stanley(
    double pos_x,
    double pos_y,
    double heading,
    const std::vector<Point>& path,
    double velocity,
    double gain,
    double &steering_angle
)
{
    // 현재 차량과 가장 가까운 경로점의 index
     int nearest_index = 0;
     // 가장 가까운 경로점을 찾기 위한 초기 거리값
     double min_distance = 999999.0;

    // 현재 차량과 가장 가까운 path point 찾기
    for (int i = 0; i < path.size() - 1; i++)
        {
            // 차량과 경로점 사이의 x, y 거리 차이
            double dx = path[i].x - pos_x;
            double dy = path[i].y - pos_y;

            // 차량과 경로점 사이의 직선거리 계산
            double distance =
                sqrt(dx * dx + dy * dy);

            // 더 가까운 경로점을 찾으면 nearest_index 갱신
            if (distance < min_distance)
            {
                min_distance = distance;
                nearest_index = i;
            }
        }

    // 현재 경로가 향하는 방향 계산
    double dx = path[nearest_index+1].x - path[nearest_index].x;
    double dy = path[nearest_index+1].y - path[nearest_index].y;
    double path_heading = atan2(dy, dx);

    // 경로가 향하는 방향과 차량 heading의 차이 계산
    double heading_error = path_heading - heading;

    // heading error를 -π ~ π 범위로 맞춤
    while (heading_error > M_PI)
        heading_error -= 2.0 * M_PI;
    while (heading_error < -M_PI)
        heading_error += 2.0 * M_PI;

    // 차량과 nearest path point 사이의 위치 오차
    double error_x = path[nearest_index].x - pos_x;
    double error_y = path[nearest_index].y - pos_y;

    // 차량이 경로의 좌우 어느 쪽으로 얼마나 벗어났는지 계산
    double cross_track_error = cos(path_heading) * error_y - sin(path_heading) * error_x;

    // 최종 Stanley 조향각 계산
    steering_angle =
        heading_error + atan((gain * cross_track_error) / velocity);
}