#ifndef aim_week3_function_hpp
#define aim_week3_function_hpp

#include <string>
#include <vector>

struct Point
{
    double x;
    double y;
    double z;
};

void load_path(
    const std::string& file_path,
    std::vector<Point>& path
);

void find_target_point(
    double pos_x,
    double pos_y,
    const std::vector<Point>& path,
    double lookahead_distance,
    double& target_x,
    double& target_y
);

void pure_pursuit(
    double pos_x,
    double pos_y,
    double target_x,
    double target_y,
    double heading,
    double wheelbase,
    double lookahead_distance,
    double& steering_angle
);

void stanley(
    double pos_x,
    double pos_y,
    double heading,
    const std::vector<Point>& path,
    double velocity,
    double gain,
    double& steering_angle
);

void quaternion_to_euler(
    double qx,
    double qy,
    double qz,
    double qw,
    double& roll,
    double& pitch,
    double& yaw
);

void wgs84_to_utm(
    double latitude,
    double longitude,
    double& easting,
    double& northing
);

#endif