;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::FaultInjectionCtrlSrv)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'FaultInjectionCtrlSrv (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::FAULTINJECTIONCTRLSRV")
  (make-package "MORAI_MSGS::FAULTINJECTIONCTRLSRV"))
(unless (find-package "MORAI_MSGS::FAULTINJECTIONCTRLSRVREQUEST")
  (make-package "MORAI_MSGS::FAULTINJECTIONCTRLSRVREQUEST"))
(unless (find-package "MORAI_MSGS::FAULTINJECTIONCTRLSRVRESPONSE")
  (make-package "MORAI_MSGS::FAULTINJECTIONCTRLSRVRESPONSE"))

(in-package "ROS")





(defclass morai_msgs::FaultInjectionCtrlSrvRequest
  :super ros::object
  :slots (_request ))

(defmethod morai_msgs::FaultInjectionCtrlSrvRequest
  (:init
   (&key
    ((:request __request) (instance morai_msgs::FaultInjection_Controller :init))
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
    ;; morai_msgs/FaultInjection_Controller _request
    (send _request :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/FaultInjection_Controller _request
       (send _request :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/FaultInjection_Controller _request
     (send _request :deserialize buf ptr-) (incf ptr- (send _request :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::FaultInjectionCtrlSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod morai_msgs::FaultInjectionCtrlSrvResponse
  (:init
   (&key
    ((:response __response) (instance morai_msgs::FaultInjection_Response :init))
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
    ;; morai_msgs/FaultInjection_Response _response
    (send _response :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/FaultInjection_Response _response
       (send _response :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/FaultInjection_Response _response
     (send _response :deserialize buf ptr-) (incf ptr- (send _response :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::FaultInjectionCtrlSrv
  :super ros::object
  :slots ())

(setf (get morai_msgs::FaultInjectionCtrlSrv :md5sum-) "903881dc09163ac5bf8f905e4d1ee274")
(setf (get morai_msgs::FaultInjectionCtrlSrv :datatype-) "morai_msgs/FaultInjectionCtrlSrv")
(setf (get morai_msgs::FaultInjectionCtrlSrv :request) morai_msgs::FaultInjectionCtrlSrvRequest)
(setf (get morai_msgs::FaultInjectionCtrlSrv :response) morai_msgs::FaultInjectionCtrlSrvResponse)

(defmethod morai_msgs::FaultInjectionCtrlSrvRequest
  (:response () (instance morai_msgs::FaultInjectionCtrlSrvResponse :init)))

(setf (get morai_msgs::FaultInjectionCtrlSrvRequest :md5sum-) "903881dc09163ac5bf8f905e4d1ee274")
(setf (get morai_msgs::FaultInjectionCtrlSrvRequest :datatype-) "morai_msgs/FaultInjectionCtrlSrvRequest")
(setf (get morai_msgs::FaultInjectionCtrlSrvRequest :definition-)
      "FaultInjection_Controller request

================================================================================
MSG: morai_msgs/FaultInjection_Controller
# FaultInjection_Controller
# Fault injection configuration for vehicle controller systems.

int32 unique_id  # Vehicle identifier

int32 fault_location  # Target location for fault injection
int32 fault_class  # Fault classification identifier
int32 fault_subclass  # Fault sub-classification identifier
---
FaultInjection_Response response


================================================================================
MSG: morai_msgs/FaultInjection_Response
# FaultInjection_Response
# Response after a fault injection operation.

bool result  # true: success, false: failure

int32 unique_id  # Vehicle identifier
FaultStatusInfo_Vehicle vehicle  # Current vehicle fault status
FaultStatusInfo_Sensor[] sensors  # Current sensor fault statuses

================================================================================
MSG: morai_msgs/FaultStatusInfo_Vehicle
# FaultStatusInfo_Vehicle
# Fault status for vehicle subsystems (accel, brake, steer, tires).

FaultStatusInfo_Overall accel  # Acceleration system fault status
FaultStatusInfo_Overall brake  # Brake system fault status
FaultStatusInfo_Overall steer  # Steering system fault status
FaultStatusInfo_Overall[] tires  # Per-tire fault statuses

================================================================================
MSG: morai_msgs/FaultStatusInfo_Overall
# FaultStatusInfo_Overall
# Fault status for a single subsystem.

bool status  # true: fault active, false: normal
int32[] fault_subclass  # Active fault sub-classification identifiers

================================================================================
MSG: morai_msgs/FaultStatusInfo_Sensor
# FaultStatusInfo_Sensor
# Fault status for a single sensor.

int32 sensor_id  # Sensor identifier
FaultStatusInfo_Overall sensor  # Fault status of this sensor
")

(setf (get morai_msgs::FaultInjectionCtrlSrvResponse :md5sum-) "903881dc09163ac5bf8f905e4d1ee274")
(setf (get morai_msgs::FaultInjectionCtrlSrvResponse :datatype-) "morai_msgs/FaultInjectionCtrlSrvResponse")
(setf (get morai_msgs::FaultInjectionCtrlSrvResponse :definition-)
      "FaultInjection_Controller request

================================================================================
MSG: morai_msgs/FaultInjection_Controller
# FaultInjection_Controller
# Fault injection configuration for vehicle controller systems.

int32 unique_id  # Vehicle identifier

int32 fault_location  # Target location for fault injection
int32 fault_class  # Fault classification identifier
int32 fault_subclass  # Fault sub-classification identifier
---
FaultInjection_Response response


================================================================================
MSG: morai_msgs/FaultInjection_Response
# FaultInjection_Response
# Response after a fault injection operation.

bool result  # true: success, false: failure

int32 unique_id  # Vehicle identifier
FaultStatusInfo_Vehicle vehicle  # Current vehicle fault status
FaultStatusInfo_Sensor[] sensors  # Current sensor fault statuses

================================================================================
MSG: morai_msgs/FaultStatusInfo_Vehicle
# FaultStatusInfo_Vehicle
# Fault status for vehicle subsystems (accel, brake, steer, tires).

FaultStatusInfo_Overall accel  # Acceleration system fault status
FaultStatusInfo_Overall brake  # Brake system fault status
FaultStatusInfo_Overall steer  # Steering system fault status
FaultStatusInfo_Overall[] tires  # Per-tire fault statuses

================================================================================
MSG: morai_msgs/FaultStatusInfo_Overall
# FaultStatusInfo_Overall
# Fault status for a single subsystem.

bool status  # true: fault active, false: normal
int32[] fault_subclass  # Active fault sub-classification identifiers

================================================================================
MSG: morai_msgs/FaultStatusInfo_Sensor
# FaultStatusInfo_Sensor
# Fault status for a single sensor.

int32 sensor_id  # Sensor identifier
FaultStatusInfo_Overall sensor  # Fault status of this sensor
")



(provide :morai_msgs/FaultInjectionCtrlSrv "903881dc09163ac5bf8f905e4d1ee274")


