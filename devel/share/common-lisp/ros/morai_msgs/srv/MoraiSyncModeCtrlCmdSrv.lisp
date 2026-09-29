; Auto-generated. Do not edit!


(cl:in-package morai_msgs-srv)


;//! \htmlinclude MoraiSyncModeCtrlCmdSrv-request.msg.html

(cl:defclass <MoraiSyncModeCtrlCmdSrv-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type morai_msgs-msg:SyncModeCtrlCmd
    :initform (cl:make-instance 'morai_msgs-msg:SyncModeCtrlCmd)))
)

(cl:defclass MoraiSyncModeCtrlCmdSrv-request (<MoraiSyncModeCtrlCmdSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoraiSyncModeCtrlCmdSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoraiSyncModeCtrlCmdSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-srv:<MoraiSyncModeCtrlCmdSrv-request> is deprecated: use morai_msgs-srv:MoraiSyncModeCtrlCmdSrv-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <MoraiSyncModeCtrlCmdSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-srv:request-val is deprecated.  Use morai_msgs-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoraiSyncModeCtrlCmdSrv-request>) ostream)
  "Serializes a message object of type '<MoraiSyncModeCtrlCmdSrv-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'request) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoraiSyncModeCtrlCmdSrv-request>) istream)
  "Deserializes a message object of type '<MoraiSyncModeCtrlCmdSrv-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'request) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoraiSyncModeCtrlCmdSrv-request>)))
  "Returns string type for a service object of type '<MoraiSyncModeCtrlCmdSrv-request>"
  "morai_msgs/MoraiSyncModeCtrlCmdSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoraiSyncModeCtrlCmdSrv-request)))
  "Returns string type for a service object of type 'MoraiSyncModeCtrlCmdSrv-request"
  "morai_msgs/MoraiSyncModeCtrlCmdSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoraiSyncModeCtrlCmdSrv-request>)))
  "Returns md5sum for a message object of type '<MoraiSyncModeCtrlCmdSrv-request>"
  "e9926504ec40cc3e19da6c7c7a0e8a49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoraiSyncModeCtrlCmdSrv-request)))
  "Returns md5sum for a message object of type 'MoraiSyncModeCtrlCmdSrv-request"
  "e9926504ec40cc3e19da6c7c7a0e8a49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoraiSyncModeCtrlCmdSrv-request>)))
  "Returns full string definition for message of type '<MoraiSyncModeCtrlCmdSrv-request>"
  (cl:format cl:nil "SyncModeCtrlCmd request~%~%================================================================================~%MSG: morai_msgs/SyncModeCtrlCmd~%# SyncModeCtrlCmd~%# Vehicle control command for synchronous simulation mode.~%~%uint64 frame  # Frame counter~%~%CtrlCmd command  # Vehicle control command~%~%bool sensor_capture  # true: capture sensor data this frame~%~%================================================================================~%MSG: morai_msgs/CtrlCmd~%# CtrlCmd~%# Control command signals for steering, moving, and stopping the ego vehicle.~%# Topic: /ctrl_cmd~%~%int32 longlCmdType  # Control method index (1: Throttle, 2: Velocity, 3: Acceleration)~%~%float64 accel  # Accelerator pedal input, range 0~~1~%float64 brake  # Brake pedal input, range 0~~1~%float64 front_steer  # Front wheel steer angle [rad]~%float64 rear_steer  # Rear wheel steer angle [rad]~%~%float64 velocity  # Target velocity, active when longlCmdType == 2 [km/h]~%float64 acceleration  # Target acceleration, active when longlCmdType == 3 [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoraiSyncModeCtrlCmdSrv-request)))
  "Returns full string definition for message of type 'MoraiSyncModeCtrlCmdSrv-request"
  (cl:format cl:nil "SyncModeCtrlCmd request~%~%================================================================================~%MSG: morai_msgs/SyncModeCtrlCmd~%# SyncModeCtrlCmd~%# Vehicle control command for synchronous simulation mode.~%~%uint64 frame  # Frame counter~%~%CtrlCmd command  # Vehicle control command~%~%bool sensor_capture  # true: capture sensor data this frame~%~%================================================================================~%MSG: morai_msgs/CtrlCmd~%# CtrlCmd~%# Control command signals for steering, moving, and stopping the ego vehicle.~%# Topic: /ctrl_cmd~%~%int32 longlCmdType  # Control method index (1: Throttle, 2: Velocity, 3: Acceleration)~%~%float64 accel  # Accelerator pedal input, range 0~~1~%float64 brake  # Brake pedal input, range 0~~1~%float64 front_steer  # Front wheel steer angle [rad]~%float64 rear_steer  # Rear wheel steer angle [rad]~%~%float64 velocity  # Target velocity, active when longlCmdType == 2 [km/h]~%float64 acceleration  # Target acceleration, active when longlCmdType == 3 [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoraiSyncModeCtrlCmdSrv-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'request))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoraiSyncModeCtrlCmdSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoraiSyncModeCtrlCmdSrv-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude MoraiSyncModeCtrlCmdSrv-response.msg.html

(cl:defclass <MoraiSyncModeCtrlCmdSrv-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type morai_msgs-msg:SyncModeResultResponse
    :initform (cl:make-instance 'morai_msgs-msg:SyncModeResultResponse)))
)

(cl:defclass MoraiSyncModeCtrlCmdSrv-response (<MoraiSyncModeCtrlCmdSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoraiSyncModeCtrlCmdSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoraiSyncModeCtrlCmdSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-srv:<MoraiSyncModeCtrlCmdSrv-response> is deprecated: use morai_msgs-srv:MoraiSyncModeCtrlCmdSrv-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <MoraiSyncModeCtrlCmdSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-srv:response-val is deprecated.  Use morai_msgs-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoraiSyncModeCtrlCmdSrv-response>) ostream)
  "Serializes a message object of type '<MoraiSyncModeCtrlCmdSrv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'response) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoraiSyncModeCtrlCmdSrv-response>) istream)
  "Deserializes a message object of type '<MoraiSyncModeCtrlCmdSrv-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'response) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoraiSyncModeCtrlCmdSrv-response>)))
  "Returns string type for a service object of type '<MoraiSyncModeCtrlCmdSrv-response>"
  "morai_msgs/MoraiSyncModeCtrlCmdSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoraiSyncModeCtrlCmdSrv-response)))
  "Returns string type for a service object of type 'MoraiSyncModeCtrlCmdSrv-response"
  "morai_msgs/MoraiSyncModeCtrlCmdSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoraiSyncModeCtrlCmdSrv-response>)))
  "Returns md5sum for a message object of type '<MoraiSyncModeCtrlCmdSrv-response>"
  "e9926504ec40cc3e19da6c7c7a0e8a49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoraiSyncModeCtrlCmdSrv-response)))
  "Returns md5sum for a message object of type 'MoraiSyncModeCtrlCmdSrv-response"
  "e9926504ec40cc3e19da6c7c7a0e8a49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoraiSyncModeCtrlCmdSrv-response>)))
  "Returns full string definition for message of type '<MoraiSyncModeCtrlCmdSrv-response>"
  (cl:format cl:nil "SyncModeResultResponse response~%~%~%================================================================================~%MSG: morai_msgs/SyncModeResultResponse~%# SyncModeResultResponse~%# Generic result response for sync mode operations.~%~%bool result  # true: success, false: failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoraiSyncModeCtrlCmdSrv-response)))
  "Returns full string definition for message of type 'MoraiSyncModeCtrlCmdSrv-response"
  (cl:format cl:nil "SyncModeResultResponse response~%~%~%================================================================================~%MSG: morai_msgs/SyncModeResultResponse~%# SyncModeResultResponse~%# Generic result response for sync mode operations.~%~%bool result  # true: success, false: failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoraiSyncModeCtrlCmdSrv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'response))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoraiSyncModeCtrlCmdSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoraiSyncModeCtrlCmdSrv-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoraiSyncModeCtrlCmdSrv)))
  'MoraiSyncModeCtrlCmdSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoraiSyncModeCtrlCmdSrv)))
  'MoraiSyncModeCtrlCmdSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoraiSyncModeCtrlCmdSrv)))
  "Returns string type for a service object of type '<MoraiSyncModeCtrlCmdSrv>"
  "morai_msgs/MoraiSyncModeCtrlCmdSrv")