cmake_minimum_required(VERSION 3.0.2)
project(aim_week3)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  morai_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS roscpp rospy std_msgs sensor_msgs morai_msgs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(aim_week3_node
  src/main.cpp
  src/path_reader.cpp
  src/find_target_point.cpp
  src/pure_pursuit.cpp
  src/stanley.cpp
  src/quaternion_to_euler_angle.cpp
  src/wgs84_to_utm.cpp
)
target_link_libraries(aim_week3_node
  ${catkin_LIBRARIES}
)