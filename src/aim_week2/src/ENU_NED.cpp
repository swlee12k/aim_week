#include <cmath>
#include <aim_week2/Transform.hpp>

void multiplyMatrices(double A[3][3], double B[3][3], double result[3][3])
{
    for (int i = 0; i < 3; ++i)
    {
        for (int j = 0; j < 3; ++j)
        {
            result[i][j] = 0;
            for (int k = 0; k < 3; ++k)
            {
                result[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

void ENU_to_NED(double enu_roll, double enu_pitch, double enu_yaw, double &ned_roll, double &ned_pitch, double &ned_yaw)
{
    double roll_rad=enu_roll * M_PI / 180.0;
    double pitch_rad=enu_pitch * M_PI / 180.0;
    double yaw_rad=enu_yaw * M_PI / 180.0;

    double cos_roll=cos(roll_rad);
    double sin_roll=sin(roll_rad);

    double R_roll[3][3]=
    {
        {1, 0 , 0},
        {0, cos_roll, -sin_roll},
        {0, sin_roll, cos_roll}
    };

    double cos_pitch=cos(pitch_rad);
    double sin_pitch=sin(pitch_rad);

    double R_pitch[3][3]=
    {
        {cos_pitch, 0, sin_pitch},
        {0, 1, 0},
        {-sin_pitch, 0, cos_pitch}
    };

    double cos_yaw=cos(yaw_rad);
    double sin_yaw=sin(yaw_rad);

    double R_yaw[3][3]=
    {
        {cos_yaw, -sin_yaw, 0},
        {sin_yaw, cos_yaw, 0},
        {0, 0, 1}
    };

    double C[3][3]=
    {
        {0, 1, 0},
        {1, 0, 0},
        {0, 0, -1}
    };
    
    double R_enu1[3][3];
    double R_enu[3][3];
    double R_ned[3][3];

    multiplyMatrices(R_yaw, R_pitch, R_enu1);
    multiplyMatrices(R_enu1, R_roll, R_enu);
    multiplyMatrices(C, R_enu, R_ned);
    
    ned_roll=atan2(R_ned[2][1], R_ned[2][2]) * 180.0 / M_PI;
    ned_pitch=asin(-R_ned[2][0]) * 180.0 / M_PI;
    ned_yaw=atan2(R_ned[1][0], R_ned[0][0]) * 180.0 / M_PI; 
}

void NED_to_ENU(double ned_roll, double ned_pitch, double ned_yaw, double &enu_roll, double &enu_pitch, double &enu_yaw)
{
    double roll_rad=ned_roll * M_PI / 180.0;
    double pitch_rad=ned_pitch * M_PI / 180.0;
    double yaw_rad=ned_yaw * M_PI / 180.0;

    double cos_roll=cos(roll_rad);
    double sin_roll=sin(roll_rad);

    double R_roll[3][3]=
    {
        {1, 0 , 0},
        {0, cos_roll, -sin_roll},
        {0, sin_roll, cos_roll}
    };

    double cos_pitch=cos(pitch_rad);
    double sin_pitch=sin(pitch_rad);

    double R_pitch[3][3]=
    {
        {cos_pitch, 0, sin_pitch},
        {0, 1, 0},
        {-sin_pitch, 0, cos_pitch}
    };

    double cos_yaw=cos(yaw_rad);
    double sin_yaw=sin(yaw_rad);

    double R_yaw[3][3]=
    {
        {cos_yaw, -sin_yaw, 0},
        {sin_yaw, cos_yaw, 0},
        {0, 0, 1}
    };

    double C[3][3]=
    {
        {0, 1, 0},
        {1, 0, 0},
        {0, 0, -1}
    };
    
    double R_ned1[3][3];
    double R_ned[3][3];
    double R_enu[3][3];

    multiplyMatrices(R_yaw, R_pitch, R_ned1);
    multiplyMatrices(R_ned1, R_roll, R_ned);
    multiplyMatrices(C, R_ned, R_enu);
    
    enu_roll=atan2(R_enu[2][1], R_enu[2][2]) * 180.0 / M_PI;
    enu_pitch=asin(-R_enu[2][0]) * 180.0 / M_PI;
    enu_yaw=atan2(R_enu[1][0], R_enu[0][0]) * 180.0 / M_PI; 
}