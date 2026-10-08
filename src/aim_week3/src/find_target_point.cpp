#include <cmath>
#include <aim_week3/function.hpp>

int nearest_index = 0;

void find_target_point(double pos_x, double pos_y, const std::vector<Point>& path, double lookahead_distance,
    double& target_x, double& target_y)
{
    double min_distance = 999999.0;

    int end_index = nearest_index + 100;

    if (end_index > path.size())
    {
        end_index = path.size();
    }

    // 현재 nearest_index 근처에서 가장 가까운 path point 찾기
    for (int i = nearest_index; i < end_index; i++)
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

    // nearest point부터 앞쪽으로 lookahead target 찾기
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