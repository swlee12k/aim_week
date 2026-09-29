;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::FaultInjectionTireSrv)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'FaultInjectionTireSrv (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::FAULTINJECTIONTIRESRV")
  (make-package "MORAI_MSGS::FAULTINJECTIONTIRESRV"))
(unless (find-package "MORAI_MSGS::FAULTINJECTIONTIRESRVREQUEST")
  (make-package "MORAI_MSGS::FAULTINJECTIONTIRESRVREQUEST"))
(unless (find-package "MORAI_MSGS::FAULTINJECTIONTIRESRVRESPONSE")
  (make-package "MORAI_MSGS::FAULTINJECTIONTIRESRVRESPONSE"))

(in-package "ROS")





(defclass morai_msgs::FaultInjectionTireSrvRequest
  :super ros::object
  :slots (_request ))

(defmethod morai_msgs::FaultInjectionTireSrvRequest
  (:init
   (&key
    ((:request __request) (instance morai_msgs::FaultInjection_Tire :init))
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
    ;; morai_msgs/FaultInjection_Tire _request
    (send _request :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; morai_msgs/FaultInjection_Tire _request
       (send _request :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; morai_msgs/FaultInjection_Tire _request
     (send _request :deserialize buf ptr-) (incf ptr- (send _request :serialization-length))
   ;;
   self)
  )

(defclass morai_msgs::FaultInjectionTireSrvResponse
  :super ros::object
  :slots (_response ))

(defmethod morai_msgs::FaultInjectionTireSrvResponse
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

(defclass morai_msgs::FaultInjectionTireSrv
  :super ros::object
  :slots ())

(setf (get morai_msgs::FaultInjectionTireSrv :md5sum-) "4c1cd51f8732dd56891a353f6f931b8a")
(setf (get morai_msgs::FaultInjectionTireSrv :datatype-) "morai_msgs/FaultInjectionTireSrv")
(setf (get morai_msgs::FaultInjectionTireSrv :request) morai_msgs::FaultInjectionTireSrvRequest)
(setf (get morai_msgs::FaultInjectionTireSrv :response) morai_msgs::FaultInjectionTireSrvResponse)

(defmethod morai_msgs::FaultInjectionTireSrvRequest
  (:response () (instance morai_msgs::FaultInjectionTireSrvResponse :init)))

(setf (get morai_msgs::FaultInjectionTireSrvRequest :md5sum-) "4c1cd51f8732dd56891a353f6f931b8a")
(setf (get morai_msgs::FaultInjectionTireSrvRequest :datatype-) "morai_msgs/FaultInjectionTireSrvRequest")
(setf (get morai_msgs::FaultInjectionTireSrvRequest :definition-)
      "FaultInjection_Tire request

================================================================================
MSG: morai_msgs/FaultInjection_Tire
# FaultInjection_Tire
# Fault injection configuration for tire systems.

int32 unique_id  # Vehicle identifier
int32 tire_index  # Target tire index

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

(setf (get morai_msgs::FaultInjectionTireSrvResponse :md5sum-) "4c1cd51f8732dd56891a353f6f931b8a")
(setf (get morai_msgs::FaultInjectionTireSrvResponse :datatype-) "morai_msgs/FaultInjectionTireSrvResponse")
(setf (get morai_msgs::FaultInjectionTireSrvResponse :definition-)
      "FaultInjection_Tire request

================================================================================
MSG: morai_msgs/FaultInjection_Tire
# FaultInjection_Tire
# Fault injection configuration for tire systems.

int32 unique_id  # Vehicle identifier
int32 tire_index  # Target tire index

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



(provide :morai_msgs/FaultInjectionTireSrv "4c1cd51f8732dd56891a353f6f931b8a")


