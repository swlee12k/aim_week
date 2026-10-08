#include <cmath>
#include <aim_week3/function.hpp>

int nearest_index = 0;

void stanley(double pos_x, double pos_y, double heading, const std::vector<Point>& path, double velocity, double gain, double &steering_angle)
{
     
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

    double error_x = path[nearest_index].x - pos_x;
    double error_y = path[nearest_index].y - pos_y;
    double cross_track_error = cos(path_heading) * error_y - sin(path_heading) * error_x;

    steering_angle =
        heading_error + atan((gain * cross_track_error) / velocity);
}