# Install script for directory: /root/catkin_ws/src/MORAI-ROS_morai_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/root/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/msg" TYPE FILE FILES
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/CtrlCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/EgoVehicleStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/EgoVehicleStatusExtended.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/GPSMessage.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/GhostMessage.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ObjectStatusList.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ObjectStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ObjectStatusExtended.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ObjectStatusListExtended.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/TrafficLight.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ERP42Info.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/GetTrafficLightStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SetTrafficLight.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/IntersectionControl.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/IntersectionStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/CollisionData.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MultiEgoSetting.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/IntscnTL.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SensorPosControl.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MoraiSimProcHandle.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MoraiSimProcStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MoraiSrvResponse.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ScenarioLoad.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MoraiTLIndex.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MoraiTLInfo.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SaveSensorData.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ReplayInfo.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/EventInfo.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/Lamps.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/VehicleSpec.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/VehicleSpecIndex.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/NpcGhostCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/NpcGhostInfo.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/VehicleCollisionData.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/VehicleCollision.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeAddObject.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeInfo.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/WaitForTickResponse.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeRemoveObject.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeCmdResponse.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/WaitForTick.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MapSpec.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MapSpecIndex.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeCtrlCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeSetGear.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeResultResponse.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SyncModeScenarioLoad.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/RadarDetection.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/RadarDetections.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/PRStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/PRCtrlCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/PREvent.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SkateboardCtrlCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SkateboardStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SkidSteer6wUGVCtrlCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SkidSteer6wUGVStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MultiPlayEventResponse.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/MultiPlayEventRequest.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/DillyCmdResponse.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/DillyCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/WoowaDillyStatus.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/SVADC.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultInjection_Controller.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultInjection_Response.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultInjection_Sensor.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultInjection_Tire.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultStatusInfo_Overall.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultStatusInfo_Sensor.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultStatusInfo_Vehicle.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/FaultStatusInfo.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/UGVServeSkidCtrlCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/VelocityCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/Obstacle.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/Obstacles.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/Transforms.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/GVDirectCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/GVStateCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/TOF.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/RobotOutput.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/WheelControl.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/RobotState.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/Conveyor.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/CMDConveyor.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ExternalForce.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/GeoVector3Message.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ShipState.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ShipCtrlCmd.msg"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/msg/ManipulatorControl.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/srv" TYPE FILE FILES
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiScenarioLoadSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiSimProcSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiTLInfoSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiEventCmdSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiVehicleSpecSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiSyncModeCmdSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiWaitForTickSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiMapSpecSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiSyncModeCtrlCmdSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiSyncModeSetGearSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiSyncModeSLSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/PREventSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiSyncModeAddObjectSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MoraiSyncModeRemoveObjectSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/MultiPlayEventSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/WoowaDillyEventCmdSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/FaultInjectionCtrlSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/FaultInjectionSensorSrv.srv"
    "/root/catkin_ws/src/MORAI-ROS_morai_msgs/srv/FaultInjectionTireSrv.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/cmake" TYPE FILE FILES "/root/catkin_ws/build/MORAI-ROS_morai_msgs/catkin_generated/installspace/morai_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/root/catkin_ws/devel/include/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/root/catkin_ws/devel/share/roseus/ros/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/root/catkin_ws/devel/share/common-lisp/ros/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/root/catkin_ws/devel/share/gennodejs/ros/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/root/catkin_ws/devel/lib/python3/dist-packages/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/root/catkin_ws/devel/lib/python3/dist-packages/morai_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/root/catkin_ws/build/MORAI-ROS_morai_msgs/catkin_generated/installspace/morai_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/cmake" TYPE FILE FILES "/root/catkin_ws/build/MORAI-ROS_morai_msgs/catkin_generated/installspace/morai_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs/cmake" TYPE FILE FILES
    "/root/catkin_ws/build/MORAI-ROS_morai_msgs/catkin_generated/installspace/morai_msgsConfig.cmake"
    "/root/catkin_ws/build/MORAI-ROS_morai_msgs/catkin_generated/installspace/morai_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/morai_msgs" TYPE FILE FILES "/root/catkin_ws/src/MORAI-ROS_morai_msgs/package.xml")
endif()

