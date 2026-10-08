#include <cmath>
#include <aim_week3/function.hpp>

void stanley(double pos_x, double pos_y, double heading, const std::vector<Point>& path, double velocity, double gain, double &steering_angle)
{
     int nearest_index = 0;
     double min_distance = 999999.0;

        // 차량에서 가장 가까운 path point 찾기
    for (int i = 0; i < path.size() - 1; i++)
        {
            double dx = path[i].x - pos_x;
            double dy = path[i].y - pos_y;

            double distance =
                sqrt(dx * dx + dy * dy);

            if (distance < min_distance)
            {
                min_distance = distance;
                nearest_index = i;
            }
        }

    double dx = path[nearest_index+1].x - path[nearest_index].x;
    double dy = path[nearest_index+1].y - path[nearest_index].y;
    double path_heading = atan2(dy, dx);

    double heading_error = path_heading - heading;

    while (heading_error > M_PI)
        heading_error -= 2.0 * M_PI;

    while (heading_error < -M_PI)
        heading_error += 2.0 * M_PI;

    double error_x = path[nearest_index].x - pos_x;
    double error_y = path[nearest_index].y - pos_y;
    double cross_track_error = cos(path_heading) * error_y - sin(path_heading) * error_x;

    steering_angle =
        heading_error + atan((gain * cross_track_error) / velocity);
}