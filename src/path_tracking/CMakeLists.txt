cmake_minimum_required(VERSION 3.0.2)
project(path_tracking)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  morai_msgs
  coordinate
)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES path_tracking_library
  CATKIN_DEPENDS roscpp rospy std_msgs sensor_msgs morai_msgs coordinate
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_library(path_tracking_library
  src/path_reader.cpp
  src/find_target_point.cpp
  src/pure_pursuit.cpp
  src/stanley.cpp
)
target_link_libraries(path_tracking_library
  ${catkin_LIBRARIES}
)

add_executable(path_tracking_node
  src/main.cpp)
target_link_libraries(path_tracking_node
  path_tracking_library
  ${catkin_LIBRARIES}
)