cmake_minimum_required(VERSION 3.0.2)
project(aim_week2)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  morai_msgs
  sensor_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS roscpp rospy std_msgs morai_msgs sensor_msgs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(main
  src/main.cpp
  src/WGS84_to_UTM.cpp
  src/WGS84_to_ENU.cpp
  src/ENU_NED.cpp
  src/Quaternion_to_Euler.cpp
)

target_link_libraries(main
  ${catkin_LIBRARIES}
)