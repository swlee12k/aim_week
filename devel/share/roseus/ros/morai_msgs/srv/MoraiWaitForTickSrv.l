;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::MoraiWaitForTickSrv)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'MoraiWaitForTickSrv (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::MORAIWAITFORTICKSRV")
  (make-package "MORAI_MSGS::MORAIWAITFORTICKSRV"))
(unless (find-package "MORAI_MSGS::MORAIWAITFORTICKSRVREQUEST")
  (make-package "MORAI_MSGS::MORAIWAITFORTICKSRVREQUEST"))
(unless (find-package "MORAI_MSGS::MORAIWAITFORTICKSRVRESPONSE")
  (make-package "MORAI_MSGS::MORAIWAITFORTICKSRVRESPONSE"))

(in-package "ROS")





(defclass morai_msgs::MoraiWaitForTickSrvRequest
  :super ros::object
  :slots (_request ))

(defmethod morai_msgs::MoraiWaitForTickSrvRequest
  (:init
   (&key
    ((:request __request) (instance morai_msgs::WaitForTick :init))
    )
   (send-super :init)
   (setq _request __request)
   self)
  (:request
   (&rest __request)
   (if (keywordp (car __request))
       (send* _request __request)
     (progn
       (if __request (setq _request (car __request)))
       _request)))
  (:serialization-length
   ()
   (+
    ;; morai_msgs/WaitForTick _request
    (send _request :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/WaitForTick _request
       (send _request :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/WaitForTick _request
     (send _request :deserialize buf ptr-) (incf ptr- (send _request :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::MoraiWaitForTickSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod morai_msgs::MoraiWaitForTickSrvResponse
  (:init
   (&key
    ((:response __response) (instance morai_msgs::WaitForTickResponse :init))
    )
   (send-super :init)
   (setq _response __response)
   self)
  (:response
   (&rest __response)
   (if (keywordp (car __response))
       (send* _response __response)
     (progn
       (if __response (setq _response (car __response)))
       _response)))
  (:serialization-length
   ()
   (+
    ;; morai_msgs/WaitForTickResponse _response
    (send _response :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/WaitForTickResponse _response
       (send _response :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/WaitForTickResponse _response
     (send _response :deserialize buf ptr-) (incf ptr- (send _response :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::MoraiWaitForTickSrv
  :super ros::object
  :slots ())

(setf (get morai_msgs::MoraiWaitForTickSrv :md5sum-) "3eb0a3f62d91d9466c06193a806b0d89")
(setf (get morai_msgs::MoraiWaitForTickSrv :datatype-) "morai_msgs/MoraiWaitForTickSrv")
(setf (get morai_msgs::MoraiWaitForTickSrv :request) morai_msgs::MoraiWaitForTickSrvRequest)
(setf (get morai_msgs::MoraiWaitForTickSrv :response) morai_msgs::MoraiWaitForTickSrvResponse)

(defmethod morai_msgs::MoraiWaitForTickSrvRequest
  (:response () (instance morai_msgs::MoraiWaitForTickSrvResponse :init)))

(setf (get morai_msgs::MoraiWaitForTickSrvRequest :md5sum-) "3eb0a3f62d91d9466c06193a806b0d89")
(setf (get morai_msgs::MoraiWaitForTickSrvRequest :datatype-) "morai_msgs/MoraiWaitForTickSrvRequest")
(setf (get morai_msgs::MoraiWaitForTickSrvRequest :definition-)
      "WaitForTick request

================================================================================
MSG: morai_msgs/WaitForTick
# WaitForTick
# Request to wait for the next simulation tick in synchronous mode.

string user_id  # User identifier
uint64 frame  # Current frame number
---
WaitForTickResponse response


================================================================================
MSG: morai_msgs/WaitForTickResponse
# WaitForTickResponse
# Response after a simulation tick completes in synchronous mode.

bool tick_status  # Tick completion status
bool pause_status  # Simulation pause status
uint64 frame  # Current frame number

EgoVehicleStatus vehicle_status  # Ego vehicle state after tick
string time  # Simulation timestamp

================================================================================
MSG: morai_msgs/EgoVehicleStatus
# EgoVehicleStatus
# Status telemetry of the ego vehicle for closed-loop control.
# Topic: /Ego_topic

Header header
int32 unique_id  # Object unique id
geometry_msgs/Vector3 acceleration  # Acceleration vector [m/s^2]
geometry_msgs/Vector3 position  # Current position in ENU coordinates [m]
geometry_msgs/Vector3 velocity  # Velocity vector [m/s]
geometry_msgs/Vector3 angular_velocity  # [deg/s] 

float64 heading  # Vehicle heading [deg]
float32 accel  # Accelerator pedal, range 0~1
float32 brake  # Brake pedal, range 0~1
float32 front_steer_angle  # Front wheel angle [deg]
float32 rear_steer_angle  # Rear wheel angle [deg]
float32 lateral_offset  # Lateral offset from reference

float32 tire_lateral_force_fl  # Front-left tire lateral force
float32 tire_lateral_force_fr  # Front-right tire lateral force
float32 tire_lateral_force_rl  # Rear-left tire lateral force
float32 tire_lateral_force_rr  # Rear-right tire lateral force

float32 side_slip_angle_fl  # Front-left side slip angle
float32 side_slip_angle_fr  # Front-right side slip angle
float32 side_slip_angle_rl  # Rear-left side slip angle
float32 side_slip_angle_rr  # Rear-right side slip angle

float32 tire_cornering_stiffness_fl  # Front-left cornering stiffness
float32 tire_cornering_stiffness_fr  # Front-right cornering stiffness
float32 tire_cornering_stiffness_rl  # Rear-left cornering stiffness
float32 tire_cornering_stiffness_rr  # Rear-right cornering stiffness

float32 distance_left_lane_boundary  # Distance from left lane boundary [m]
float32 distance_right_lane_boundary  # Distance from right lane boundary [m]
float32 cross_track_error  # Distance from lane center, right-positive [m]

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")

(setf (get morai_msgs::MoraiWaitForTickSrvResponse :md5sum-) "3eb0a3f62d91d9466c06193a806b0d89")
(setf (get morai_msgs::MoraiWaitForTickSrvResponse :datatype-) "morai_msgs/MoraiWaitForTickSrvResponse")
(setf (get morai_msgs::MoraiWaitForTickSrvResponse :definition-)
      "WaitForTick request

================================================================================
MSG: morai_msgs/WaitForTick
# WaitForTick
# Request to wait for the next simulation tick in synchronous mode.

string user_id  # User identifier
uint64 frame  # Current frame number
---
WaitForTickResponse response


================================================================================
MSG: morai_msgs/WaitForTickResponse
# WaitForTickResponse
# Response after a simulation tick completes in synchronous mode.

bool tick_status  # Tick completion status
bool pause_status  # Simulation pause status
uint64 frame  # Current frame number

EgoVehicleStatus vehicle_status  # Ego vehicle state after tick
string time  # Simulation timestamp

================================================================================
MSG: morai_msgs/EgoVehicleStatus
# EgoVehicleStatus
# Status telemetry of the ego vehicle for closed-loop control.
# Topic: /Ego_topic

Header header
int32 unique_id  # Object unique id
geometry_msgs/Vector3 acceleration  # Acceleration vector [m/s^2]
geometry_msgs/Vector3 position  # Current position in ENU coordinates [m]
geometry_msgs/Vector3 velocity  # Velocity vector [m/s]
geometry_msgs/Vector3 angular_velocity  # [deg/s] 

float64 heading  # Vehicle heading [deg]
float32 accel  # Accelerator pedal, range 0~1
float32 brake  # Brake pedal, range 0~1
float32 front_steer_angle  # Front wheel angle [deg]
float32 rear_steer_angle  # Rear wheel angle [deg]
float32 lateral_offset  # Lateral offset from reference

float32 tire_lateral_force_fl  # Front-left tire lateral force
float32 tire_lateral_force_fr  # Front-right tire lateral force
float32 tire_lateral_force_rl  # Rear-left tire lateral force
float32 tire_lateral_force_rr  # Rear-right tire lateral force

float32 side_slip_angle_fl  # Front-left side slip angle
float32 side_slip_angle_fr  # Front-right side slip angle
float32 side_slip_angle_rl  # Rear-left side slip angle
float32 side_slip_angle_rr  # Rear-right side slip angle

float32 tire_cornering_stiffness_fl  # Front-left cornering stiffness
float32 tire_cornering_stiffness_fr  # Front-right cornering stiffness
float32 tire_cornering_stiffness_rl  # Rear-left cornering stiffness
float32 tire_cornering_stiffness_rr  # Rear-right cornering stiffness

float32 distance_left_lane_boundary  # Distance from left lane boundary [m]
float32 distance_right_lane_boundary  # Distance from right lane boundary [m]
float32 cross_track_error  # Distance from lane center, right-positive [m]

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")



(provide :morai_msgs/MoraiWaitForTickSrv "3eb0a3f62d91d9466c06193a806b0d89")


