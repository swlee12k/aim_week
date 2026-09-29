cmake_minimum_required(VERSION 3.0.2)
project(aim_week1)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  geometry_msgs
  turtlesim
  message_generation
)

add_message_files(
  FILES
  CustomMsg.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS roscpp std_msgs message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(int32_pub src/int32_pub.cpp)
target_link_libraries(int32_pub ${catkin_LIBRARIES})

add_executable(int32_sub src/int32_sub.cpp)
target_link_libraries(int32_sub ${catkin_LIBRARIES})

add_executable(custom_pub src/custom_pub.cpp)
add_dependencies(custom_pub ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(custom_pub ${catkin_LIBRARIES})

add_executable(custom_sub src/custom_sub.cpp)
add_dependencies(custom_sub ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(custom_sub ${catkin_LIBRARIES})

add_executable(chain_pub src/chain_pub.cpp)
target_link_libraries(chain_pub ${catkin_LIBRARIES})

add_executable(chain_mid src/chain_mid.cpp)
target_link_libraries(chain_mid ${catkin_LIBRARIES})

add_executable(chain_sub src/chain_sub.cpp)
target_link_libraries(chain_sub ${catkin_LIBRARIES})