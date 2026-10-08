#include <cmath>
#include <aim_week3/function.hpp>

void find_target_point(double pos_x, double pos_y, const std::vector<Point>& path, double lookahead_distance,
    double& target_x, double& target_y)
{
    int nearest_index = 0;
    double min_distance = 999999.0;

    // 현재 차량과 가장 가까운 path point 찾기
    for (int i = 0; i < path.size(); i++)
    {
        double dx = path[i].x - pos_x;
        double dy = path[i].y - pos_y;

        double distance = std::sqrt(dx * dx + dy * dy);

        if (distance < min_distance)
        {
            min_distance = distance;
            nearest_index = i;
        }
    }

    // nearest point부터 앞쪽으로 target 찾기
    for (int i = nearest_index; i < path.size(); i++)
    {
        double dx = path[i].x - pos_x;
        double dy = path[i].y - pos_y;

        double distance = std::sqrt(dx * dx + dy * dy);

        if (distance >= lookahead_distance)
        {
            target_x = path[i].x;
            target_y = path[i].y;

            return;
        }
    }
}