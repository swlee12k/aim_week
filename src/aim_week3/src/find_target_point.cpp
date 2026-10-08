#include <cmath>
#include <aim_week3/function.hpp>

// 현재 차량과 가장 가까운 경로점의 index를 저장
int nearest_index = 0;

// 현재 차량 위치를 기준으로 Pure Pursuit에서 사용할 target point를 찾는 함수
void find_target_point(
    double pos_x,
    double pos_y,
    const std::vector<Point>& path,
    double lookahead_distance,
    double& target_x,
    double& target_y)
{
    // 가장 가까운 경로점을 찾기 위한 초기 거리값
    double min_distance = 999999.0;

    // 이전 nearest_index 기준으로 앞쪽 100개까지만 탐색
    // 다른 경로 구간으로 index가 갑자기 점프하는 것을 방지
    int end_index = nearest_index + 100;

    // path 범위를 넘어가지 않도록 제한
    if (end_index > path.size())
    {
        end_index = path.size();
    }

    // 현재 차량과 가장 가까운 경로점 탐색
    for (int i = nearest_index; i < end_index; i++)
    {
        double dx = path[i].x - pos_x;
        double dy = path[i].y - pos_y;

        // 차량과 경로점 사이의 직선거리 계산
        double distance = std::sqrt(dx * dx + dy * dy);

        // 더 가까운 경로점을 발견하면 nearest_index 갱신
        if (distance < min_distance)
        {
            min_distance = distance;
            nearest_index = i;
        }
    }

   // nearest point부터 경로 앞쪽으로 탐색
    for (int i = nearest_index; i < path.size(); i++)
    {
        double dx = path[i].x - pos_x;
        double dy = path[i].y - pos_y;

        // 현재 차량과 각 경로점 사이 거리 계산
        double distance = std::sqrt(dx * dx + dy * dy);

        // lookahead distance 이상 떨어진 첫 경로점을 target point로 선정
        if (distance >= lookahead_distance)
        {
            target_x = path[i].x;
            target_y = path[i].y;

            return;
        }
    }
}