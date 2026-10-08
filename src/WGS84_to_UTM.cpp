#include <cmath>
#include <aim_week2/Transform.hpp>

void WGS84_to_UTM(double latitude, double longitude, double &easting, double &northing)
{
    const double a=6378137.0; 
    const double f=1/298.257223563; 
    const double k0=0.9996; 

    double M0=0.0;

    double e2=f*(2-f); 
    double ep2=e2/(1-e2); 

    int zone=floor((longitude+180)/6)+1; 

    double lambda0=6*zone-183; 

    double phi_rad=latitude*M_PI/180; 
    double lambda_rad=longitude*M_PI/180;
    double lambda0_rad=lambda0*M_PI/180; 

    double N=a/sqrt(1-e2*pow(sin(phi_rad),2)); 
    double T=pow(tan(phi_rad),2); 
    double C=ep2*pow(cos(phi_rad),2); 
    double A=(lambda_rad-lambda0_rad)*cos(phi_rad); 

    double M=a*((1-(e2/4)-(3*pow(e2,2)/64)-(5*pow(e2,3)/256))*phi_rad-((3*e2/8)+(3*pow(e2,2)/32)+(45*pow(e2,3)/1024))*sin(2*phi_rad)+((15*pow(e2,2)/256)+(45*pow(e2,3)/1024))*sin(4*phi_rad)-((35*pow(e2,3)/3072))*sin(6*phi_rad));
    
    double x=k0*N*(A+(1-T+C)*(pow(A,3)/6)+(5-18*T+pow(T,2)+72*C-58*ep2)*(pow(A,5)/120));
    double y=k0*(M-M0+N*tan(phi_rad)*(((pow(A,2)/2)+(5-T+9*C+4*pow(C,2))*(pow(A,4)/24))+(61-58*T+pow(T,2)+600*C-330*ep2)*(pow(A,6)/720)));
    
    easting=x+500000;
    if (latitude < 0)
    {
    northing = y + 10000000;
    }
    else
    {
    northing = y;
    }
}
