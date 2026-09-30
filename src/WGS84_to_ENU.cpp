#include <cmath>
#include <aim_week2/Transform.hpp>

void WGS84_to_ENU(double latitude, double longitude, double altitude, double &east, double &north, double &up)
{
    const double latitude0=35.70379317067722;
    const double longitude0=128.45489656762783;
    const double altitude0=88.25159645080566;

    const double a=6378137.0; 
    const double f=1/298.257223563; 

    double e2=f*(2-f);

    double phi_rad=latitude*M_PI/180; 
    double lambda_rad=longitude*M_PI/180;

    double phi0_rad=latitude0*M_PI/180;
    double lambda0_rad=longitude0*M_PI/180;

    double N=a/sqrt(1-e2*pow(sin(phi_rad),2)); 
    double N0=a/sqrt(1-e2*pow(sin(phi0_rad),2));

    double x=(N+altitude)*cos(phi_rad)*cos(lambda_rad);
    double y=(N+altitude)*cos(phi_rad)*sin(lambda_rad);
    double z=((1-e2)*N+altitude)*sin(phi_rad);

    double x0=(N0+altitude0)*cos(phi0_rad)*cos(lambda0_rad);
    double y0=(N0+altitude0)*cos(phi0_rad)*sin(lambda0_rad);
    double z0=((1-e2)*N0+altitude0)*sin(phi0_rad);

    east=-sin(lambda0_rad)*(x-x0)+cos(lambda0_rad)*(y-y0);
    north=-sin(phi0_rad)*cos(lambda0_rad)*(x-x0)-sin(phi0_rad)*sin(lambda0_rad)*(y-y0)+cos(phi0_rad)*(z-z0);
    up=cos(phi0_rad)*cos(lambda0_rad)*(x-x0)+cos(phi0_rad)*sin(lambda0_rad)*(y-y0)+sin(phi0_rad)*(z-z0);
}
