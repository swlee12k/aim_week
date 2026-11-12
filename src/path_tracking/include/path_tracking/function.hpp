#ifndef PATH_TRACKING_HPP
#define PATH_TRACKING_HPP

#include <string> // 파일 경로 문자열
#include <vector> // point 점들을 여러 개 저장하는 배열

// 경로 한 점을 표현하는 자료형 정의
struct Point{double x;
    double y;
    double z;};

// 경로 파일 읽기 함수 선언
void load_path(
    const std::string& file_path,
    std::vector<Point>& path
);

void load_ref(
    const std::string& file_path,
    double& latitude,
    double& longitude,
    double& altitude
);

// target point 찾기 함수 선언
void find_target_point(
    double pos_x,
    double pos_y,
    const std::vector<Point>& path,
    double lookahead_distance,
    double& target_x,
    double& target_y
);

// Pure Pursuit 함수 선언
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

// Stanley 함수 선언
void stanley(
    double pos_x,
    double pos_y,
    double heading,
    const std::vector<Point>& path,
    double velocity,
    double gain,
    double wheelbase,
    double& steering_angle
);


#endif