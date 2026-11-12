#include <cmath>
#include <path_tracking/function.hpp>

// 이전에 찾았던 최근접 경로점 index
int nearest_index = 0;

// 현재 차량 위치를 기준으로 Pure Pursuit Target Point를 찾는 함수
void find_target_point(
    double pos_x,
    double pos_y,
    const std::vector<Point>& path,
    double lookahead_distance,
    double& target_x,
    double& target_y)
{
    // 정상 주행 중 최근접 경로점 탐색 범위
    const int search_backward = 30;
    const int search_forward = 100;

    // 경로 이탈 판단 거리 (m)
    const double recovery_distance = 5.0;

    int start_index = nearest_index - search_backward;
    int end_index = nearest_index + search_forward;

    // 인덱스 범위 제한
    if (start_index < 0)
        start_index = 0;

    if (end_index > static_cast<int>(path.size()))
        end_index = static_cast<int>(path.size());

    // 기존 인덱스 주변에서 최근접 경로점 탐색
    double min_distance = 999999.0;
    int new_nearest_index = nearest_index;

    for (int i = start_index; i < end_index; i++)
    {
        double dx = path[i].x - pos_x;
        double dy = path[i].y - pos_y;

        double distance = std::sqrt(dx * dx + dy * dy);

        if (distance < min_distance)
        {
            min_distance = distance;
            new_nearest_index = i;
        }
    }

    // 경로에서 크게 이탈한 경우 전체 경로를 다시 탐색
    if (min_distance > recovery_distance)
    {
        min_distance = 999999.0;

        for (int i = 0; i < static_cast<int>(path.size()); i++)
        {
            double dx = path[i].x - pos_x;
            double dy = path[i].y - pos_y;

            double distance = std::sqrt(dx * dx + dy * dy);

            if (distance < min_distance)
            {
                min_distance = distance;
                new_nearest_index = i;
            }
        }
    }

    // 최근접 경로점 갱신
    nearest_index = new_nearest_index;

    // 최근접 경로점부터 경로를 따라 이동한 거리
    double accumulated_distance = 0.0;

    for (int i = nearest_index; i < static_cast<int>(path.size()) - 1; i++)
    {
        double dx = path[i + 1].x - path[i].x;
        double dy = path[i + 1].y - path[i].y;

        double segment_distance = std::sqrt(dx * dx + dy * dy);

        accumulated_distance += segment_distance;

        // 경로를 따라 Lookahead Distance만큼 이동한 지점
        if (accumulated_distance >= lookahead_distance)
        {
            // 마지막 경로점에서 지나치게 멀리 점프하지 않도록
            // 선분 사이의 목표 위치를 보간
            double previous_distance = accumulated_distance - segment_distance;

            double ratio = (lookahead_distance - previous_distance)
                           / segment_distance;

            target_x = path[i].x + ratio * dx;
            target_y = path[i].y + ratio * dy;

            return;
        }
    }

    // 경로 끝까지 도달하면 마지막 경로점을 target으로 사용
    target_x = path.back().x;
    target_y = path.back().y;
}
