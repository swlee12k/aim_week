#include <fstream> //파일을 읽기 위한 헤더 파일
#include <aim_week3/function.hpp>

void load_path
(const std::string& file_path, //읽을 파일 주소
    std::vector<Point>& path) //읽은 좌표들을 저장할 벡터
{
    std::ifstream file(file_path); //파일을 읽기 위한 ifstream 객체 생성

    double x, y, z;

    while (file >> x >> y >> z) //파일에서 x, y, z 좌표를 읽어옴
    {
        Point p; //좌표 한 점을 저장하는 변수

        p.x = x;
        p.y = y;
        p.z = z;

        path.push_back(p); //읽은 좌표를 자동으로 배열에 추가
    }

    file.close();
}