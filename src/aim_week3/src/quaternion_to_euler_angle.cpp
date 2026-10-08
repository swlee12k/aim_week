#include <cmath>
#include <aim_week3/function.hpp>

void quaternion_to_euler
(double qx, double qy, double qz, double qw, double &roll, double &pitch, double &yaw)
{
    double sinr_cosp = 2 * (qw * qx + qy * qz);
    double cosr_cosp = 1 - 2 * (qx * qx + qy * qy);
    roll = atan2(sinr_cosp, cosr_cosp);

    double sinp = 2 * (qw * qy - qz * qx);
    if (fabs(sinp) >= 1)
        pitch = copysign(M_PI / 2, sinp);
    else
        pitch = asin(sinp);

    double siny_cosp = 2 * (qw * qz + qx * qy);
    double cosy_cosp = 1 - 2 * (qy * qy + qz * qz);
    yaw = atan2(siny_cosp, cosy_cosp);
}