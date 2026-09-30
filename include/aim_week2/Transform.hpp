#ifndef transform_hpp
#define transform_hpp

void WGS84_to_UTM(double latitude, double longitude,
                  double &easting, double &northing);

void WGS84_to_ENU(double latitude, double longitude, double altitude,
                  double &east, double &north, double &up);

void ENU_to_NED(double enu_roll, double enu_pitch, double enu_yaw,
                double &ned_roll, double &ned_pitch, double &ned_yaw);

void NED_to_ENU(double ned_roll, double ned_pitch, double ned_yaw,
                double &enu_roll, double &enu_pitch, double &enu_yaw);

void Quaternion_to_Euler(double qx, double qy, double qz, double qw,
                         double &roll, double &pitch, double &yaw);

#endif