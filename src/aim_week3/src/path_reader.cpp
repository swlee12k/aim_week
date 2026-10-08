#include <fstream> //파일을 읽기 위한 헤더 파일
#include <aim_week3/function.hpp>

// Path.txt의 좌표들을 읽어서 path 벡터에 저장하는 함수
void load_path(
    const std::string& file_path, //읽을 파일 주소
    std::vector<Point>& path //읽은 좌표들을 저장할 벡터
)
{
    // 전달받은 경로의 파일 열기
    std::ifstream file(file_path);

    // 파일에서 읽어올 x, y, z 좌표
    double x, y, z;

    // 파일에서 x, y, z를 한 줄씩 읽음
    // 더 이상 읽을 데이터가 없으면 반복 종료
    while (file >> x >> y >> z) //파일에서 x, y, z 좌표를 읽어옴
    {
        // 경로의 한 점을 저장하는 변수
        Point p; 

        p.x = x;
        p.y = y;
        p.z = z;

         //읽은 좌표를 자동으로 배열에 추가
        path.push_back(p);
    }

     // 파일 닫기
    file.close();
}

// ref.txt의 기준점 위도, 경도, 고도를 읽는 함수
void load_ref(
    const std::string& file_path,
    double& latitude,
    double& longitude,
    double& altitude)
{
    std::ifstream file(file_path);

    // ref.txt에서 위도, 경도, 고도를 읽어옴
    file >> latitude >> longitude >> altitude;

    // 파일 닫기
    file.close();
}