;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::MoraiSimProcSrv)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'MoraiSimProcSrv (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::MORAISIMPROCSRV")
  (make-package "MORAI_MSGS::MORAISIMPROCSRV"))
(unless (find-package "MORAI_MSGS::MORAISIMPROCSRVREQUEST")
  (make-package "MORAI_MSGS::MORAISIMPROCSRVREQUEST"))
(unless (find-package "MORAI_MSGS::MORAISIMPROCSRVRESPONSE")
  (make-package "MORAI_MSGS::MORAISIMPROCSRVRESPONSE"))

(in-package "ROS")





(defclass morai_msgs::MoraiSimProcSrvRequest
  :super ros::object
  :slots (_request ))

(defmethod morai_msgs::MoraiSimProcSrvRequest
  (:init
   (&key
    ((:request __request) (instance morai_msgs::MoraiSimProcHandle :init))
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
    ;; morai_msgs/MoraiSimProcHandle _request
    (send _request :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/MoraiSimProcHandle _request
       (send _request :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/MoraiSimProcHandle _request
     (send _request :deserialize buf ptr-) (incf ptr- (send _request :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::MoraiSimProcSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod morai_msgs::MoraiSimProcSrvResponse
  (:init
   (&key
    ((:response __response) (instance morai_msgs::MoraiSrvResponse :init))
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
    ;; morai_msgs/MoraiSrvResponse _response
    (send _response :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/MoraiSrvResponse _response
       (send _response :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/MoraiSrvResponse _response
     (send _response :deserialize buf ptr-) (incf ptr- (send _response :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::MoraiSimProcSrv
  :super ros::object
  :slots ())

(setf (get morai_msgs::MoraiSimProcSrv :md5sum-) "6d340598acf4b7d6e6f913c45512bf48")
(setf (get morai_msgs::MoraiSimProcSrv :datatype-) "morai_msgs/MoraiSimProcSrv")
(setf (get morai_msgs::MoraiSimProcSrv :request) morai_msgs::MoraiSimProcSrvRequest)
(setf (get morai_msgs::MoraiSimProcSrv :response) morai_msgs::MoraiSimProcSrvResponse)

(defmethod morai_msgs::MoraiSimProcSrvRequest
  (:response () (instance morai_msgs::MoraiSimProcSrvResponse :init)))

(setf (get morai_msgs::MoraiSimProcSrvRequest :md5sum-) "6d340598acf4b7d6e6f913c45512bf48")
(setf (get morai_msgs::MoraiSimProcSrvRequest :datatype-) "morai_msgs/MoraiSimProcSrvRequest")
(setf (get morai_msgs::MoraiSimProcSrvRequest :definition-)
      "MoraiSimProcHandle request

================================================================================
MSG: morai_msgs/MoraiSimProcHandle
# MoraiSimProcHandle
# Playback commands and conditions for rosbag replay.

uint8 sim_process_status  # Process status (1: Playing, 2: Paused, 32: Stopped)

int16 replay_option  # Bitmask (0x0001: load file, 0x0010: designate target, 0x0100: set start time, 0x1000: set speed)
string rosbag_file_name  # Filename of the rosbag file to load
int16 replay_target_option  # Bitmask (0x0001: ego vehicle, 0x0010: NPC vehicle, 0x0100: pedestrian)

int32 replay_speed  # Playback speed multiplier (e.g., 1, 2)
int32 start_time  # Start time [ms]
---
MoraiSrvResponse response


================================================================================
MSG: morai_msgs/MoraiSrvResponse
# MoraiSrvResponse
# Generic service response indicating success or failure.

bool result  # true: success, false: failure
")

(setf (get morai_msgs::MoraiSimProcSrvResponse :md5sum-) "6d340598acf4b7d6e6f913c45512bf48")
(setf (get morai_msgs::MoraiSimProcSrvResponse :datatype-) "morai_msgs/MoraiSimProcSrvResponse")
(setf (get morai_msgs::MoraiSimProcSrvResponse :definition-)
      "MoraiSimProcHandle request

================================================================================
MSG: morai_msgs/MoraiSimProcHandle
# MoraiSimProcHandle
# Playback commands and conditions for rosbag replay.

uint8 sim_process_status  # Process status (1: Playing, 2: Paused, 32: Stopped)

int16 replay_option  # Bitmask (0x0001: load file, 0x0010: designate target, 0x0100: set start time, 0x1000: set speed)
string rosbag_file_name  # Filename of the rosbag file to load
int16 replay_target_option  # Bitmask (0x0001: ego vehicle, 0x0010: NPC vehicle, 0x0100: pedestrian)

int32 replay_speed  # Playback speed multiplier (e.g., 1, 2)
int32 start_time  # Start time [ms]
---
MoraiSrvResponse response


================================================================================
MSG: morai_msgs/MoraiSrvResponse
# MoraiSrvResponse
# Generic service response indicating success or failure.

bool result  # true: success, false: failure
")



(provide :morai_msgs/MoraiSimProcSrv "6d340598acf4b7d6e6f913c45512bf48")


