;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::MoraiSyncModeCtrlCmdSrv)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'MoraiSyncModeCtrlCmdSrv (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::MORAISYNCMODECTRLCMDSRV")
  (make-package "MORAI_MSGS::MORAISYNCMODECTRLCMDSRV"))
(unless (find-package "MORAI_MSGS::MORAISYNCMODECTRLCMDSRVREQUEST")
  (make-package "MORAI_MSGS::MORAISYNCMODECTRLCMDSRVREQUEST"))
(unless (find-package "MORAI_MSGS::MORAISYNCMODECTRLCMDSRVRESPONSE")
  (make-package "MORAI_MSGS::MORAISYNCMODECTRLCMDSRVRESPONSE"))

(in-package "ROS")





(defclass morai_msgs::MoraiSyncModeCtrlCmdSrvRequest
  :super ros::object
  :slots (_request ))

(defmethod morai_msgs::MoraiSyncModeCtrlCmdSrvRequest
  (:init
   (&key
    ((:request __request) (instance morai_msgs::SyncModeCtrlCmd :init))
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
    ;; morai_msgs/SyncModeCtrlCmd _request
    (send _request :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/SyncModeCtrlCmd _request
       (send _request :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/SyncModeCtrlCmd _request
     (send _request :deserialize buf ptr-) (incf ptr- (send _request :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::MoraiSyncModeCtrlCmdSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod morai_msgs::MoraiSyncModeCtrlCmdSrvResponse
  (:init
   (&key
    ((:response __response) (instance morai_msgs::SyncModeResultResponse :init))
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
    ;; morai_msgs/SyncModeResultResponse _response
    (send _response :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/SyncModeResultResponse _response
       (send _response :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/SyncModeResultResponse _response
     (send _response :deserialize buf ptr-) (incf ptr- (send _response :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::MoraiSyncModeCtrlCmdSrv
  :super ros::object
  :slots ())

(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrv :md5sum-) "e9926504ec40cc3e19da6c7c7a0e8a49")
(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrv :datatype-) "morai_msgs/MoraiSyncModeCtrlCmdSrv")
(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrv :request) morai_msgs::MoraiSyncModeCtrlCmdSrvRequest)
(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrv :response) morai_msgs::MoraiSyncModeCtrlCmdSrvResponse)

(defmethod morai_msgs::MoraiSyncModeCtrlCmdSrvRequest
  (:response () (instance morai_msgs::MoraiSyncModeCtrlCmdSrvResponse :init)))

(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrvRequest :md5sum-) "e9926504ec40cc3e19da6c7c7a0e8a49")
(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrvRequest :datatype-) "morai_msgs/MoraiSyncModeCtrlCmdSrvRequest")
(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrvRequest :definition-)
      "SyncModeCtrlCmd request

================================================================================
MSG: morai_msgs/SyncModeCtrlCmd
# SyncModeCtrlCmd
# Vehicle control command for synchronous simulation mode.

uint64 frame  # Frame counter

CtrlCmd command  # Vehicle control command

bool sensor_capture  # true: capture sensor data this frame

================================================================================
MSG: morai_msgs/CtrlCmd
# CtrlCmd
# Control command signals for steering, moving, and stopping the ego vehicle.
# Topic: /ctrl_cmd

int32 longlCmdType  # Control method index (1: Throttle, 2: Velocity, 3: Acceleration)

float64 accel  # Accelerator pedal input, range 0~1
float64 brake  # Brake pedal input, range 0~1
float64 front_steer  # Front wheel steer angle [rad]
float64 rear_steer  # Rear wheel steer angle [rad]

float64 velocity  # Target velocity, active when longlCmdType == 2 [km/h]
float64 acceleration  # Target acceleration, active when longlCmdType == 3 [m/s^2]
---
SyncModeResultResponse response


================================================================================
MSG: morai_msgs/SyncModeResultResponse
# SyncModeResultResponse
# Generic result response for sync mode operations.

bool result  # true: success, false: failure
")

(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrvResponse :md5sum-) "e9926504ec40cc3e19da6c7c7a0e8a49")
(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrvResponse :datatype-) "morai_msgs/MoraiSyncModeCtrlCmdSrvResponse")
(setf (get morai_msgs::MoraiSyncModeCtrlCmdSrvResponse :definition-)
      "SyncModeCtrlCmd request

================================================================================
MSG: morai_msgs/SyncModeCtrlCmd
# SyncModeCtrlCmd
# Vehicle control command for synchronous simulation mode.

uint64 frame  # Frame counter

CtrlCmd command  # Vehicle control command

bool sensor_capture  # true: capture sensor data this frame

================================================================================
MSG: morai_msgs/CtrlCmd
# CtrlCmd
# Control command signals for steering, moving, and stopping the ego vehicle.
# Topic: /ctrl_cmd

int32 longlCmdType  # Control method index (1: Throttle, 2: Velocity, 3: Acceleration)

float64 accel  # Accelerator pedal input, range 0~1
float64 brake  # Brake pedal input, range 0~1
float64 front_steer  # Front wheel steer angle [rad]
float64 rear_steer  # Rear wheel steer angle [rad]

float64 velocity  # Target velocity, active when longlCmdType == 2 [km/h]
float64 acceleration  # Target acceleration, active when longlCmdType == 3 [m/s^2]
---
SyncModeResultResponse response


================================================================================
MSG: morai_msgs/SyncModeResultResponse
# SyncModeResultResponse
# Generic result response for sync mode operations.

bool result  # true: success, false: failure
")



(provide :morai_msgs/MoraiSyncModeCtrlCmdSrv "e9926504ec40cc3e19da6c7c7a0e8a49")


