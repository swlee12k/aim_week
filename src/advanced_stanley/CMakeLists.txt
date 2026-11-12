cmake_minimum_required(VERSION 3.0.2)
project(advanced_stanley)

find_package(catkin REQUIRED COMPONENTS
  coordinate
  morai_msgs
  path_tracking
  roscpp
  sensor_msgs
  std_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS coordinate morai_msgs path_tracking roscpp sensor_msgs std_msgs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(advanced_stanley_node
  src/main.cpp
  src/advanced_stanley.cpp
  src/speed_control.cpp
)

add_dependencies(advanced_stanley_node ${catkin_EXPORTED_TARGETS})

target_link_libraries(advanced_stanley_node
  ${catkin_LIBRARIES}
)