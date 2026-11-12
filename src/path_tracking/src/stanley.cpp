
#include <cmath>
#include <path_tracking/function.hpp>

// Stanley로 조향각을 계산하는 함수
void stanley(
    double pos_x,
    double pos_y,
    double heading,
    const std::vector<Point>& path,
    double velocity,
    double gain,
    double wheelbase,
    double &steering_angle
)


{
    // 경로점이 2개 미만이면 선분이 없으므로 계산하지 않음
    if (path.size() < 2)
    {
        steering_angle = 0.0;
        return;
    }

    // 전륜 중심의 ENU 좌표 계산
    double front_x = pos_x + wheelbase * cos(heading);
    double front_y = pos_y + wheelbase * sin(heading);

    // 최근접 경로 선분을 찾기 위한 초기값
    double min_distance = 999999.0;
    int nearest_index = 0;

    // 최근접 경로 선분의 투영점
    double nearest_x = 0.0;
    double nearest_y = 0.0;

    // 전체 경로에서 가장 가까운 선분 탐색
    for (int i = 0; i < static_cast<int>(path.size()) - 1; i++)
    {
        // 경로 선분의 시작점과 끝점
        double x1 = path[i].x;
        double y1 = path[i].y;
        double x2 = path[i + 1].x;
        double y2 = path[i + 1].y;

        // 경로 선분의 방향 벡터
        double dx = x2 - x1;
        double dy = y2 - y1;

        // 선분 길이의 제곱
        double length_squared = dx * dx + dy * dy;

        // 길이가 0인 선분은 건너뜀
        if (length_squared < 1e-12)
            continue;

        // 전륜 중심을 경로 선분에 투영
        double t = ((front_x - x1) * dx
                  + (front_y - y1) * dy) / length_squared;

        // 투영점이 선분 범위를 벗어나지 않도록 제한
        if (t < 0.0)
            t = 0.0;
        else if (t > 1.0)
            t = 1.0;

        // 선분 위의 최근접점 계산
        double projection_x = x1 + t * dx;
        double projection_y = y1 + t * dy;

        // 전륜 중심과 최근접점 사이의 거리 제곱
        double error_x = projection_x - front_x;
        double error_y = projection_y - front_y;

        double distance_squared =
            error_x * error_x + error_y * error_y;

        // 가장 가까운 선분과 투영점 저장
        if (distance_squared < min_distance)
        {
            min_distance = distance_squared;
            nearest_index = i;
            nearest_x = projection_x;
            nearest_y = projection_y;
        }
    }

    // 경로 방향을 계산하기 위한 전방 거리 (m)
    const double heading_lookahead = 3.0;

    // 최근접점부터 경로를 따라 전방 탐색
    double accumulated_distance = 0.0;

    double ahead_x = nearest_x;
    double ahead_y = nearest_y;

    double start_x = nearest_x;
    double start_y = nearest_y;

    for (int i = nearest_index;
         i < static_cast<int>(path.size()) - 1; i++)
    {
        double end_x = path[i + 1].x;
        double end_y = path[i + 1].y;

        double dx = end_x - start_x;
        double dy = end_y - start_y;

        double segment_distance = sqrt(dx * dx + dy * dy);

        if (segment_distance < 1e-6)
        {
            start_x = end_x;
            start_y = end_y;
            continue;
        }

        if (accumulated_distance + segment_distance
            >= heading_lookahead)
        {
            double ratio =
                (heading_lookahead - accumulated_distance)
                / segment_distance;

            ahead_x = start_x + ratio * dx;
            ahead_y = start_y + ratio * dy;
            break;
        }

        accumulated_distance += segment_distance;

        start_x = end_x;
        start_y = end_y;

        // 경로 끝에 도달한 경우
        ahead_x = end_x;
        ahead_y = end_y;
    }

    // 전방 경로점 기준 진행 방향 계산
    double path_dx = ahead_x - nearest_x;
    double path_dy = ahead_y - nearest_y;

    double path_heading = heading;

    if (path_dx * path_dx + path_dy * path_dy > 1e-12)
    {
        path_heading = atan2(path_dy, path_dx);
    }

    // 차량과 경로 진행 방향의 차이
    double heading_error = path_heading - heading;

    // Heading Error를 -pi ~ pi 범위로 정규화
    while (heading_error > M_PI)
        heading_error -= 2.0 * M_PI;

    while (heading_error < -M_PI)
        heading_error += 2.0 * M_PI;

    // 전륜 중심에서 최근접 선분까지의 횡방향 오차
    double error_x = nearest_x - front_x;
    double error_y = nearest_y - front_y;

    double cross_track_error =
        cos(path_heading) * error_y
        - sin(path_heading) * error_x;

    // 저속에서 분모가 0이 되는 것을 방지
    const double k_soft = 1.0;

    // Stanley 최종 조향각 계산 (rad)
    steering_angle =
        heading_error
        + atan((gain * cross_track_error)
               / (velocity + k_soft));
}
