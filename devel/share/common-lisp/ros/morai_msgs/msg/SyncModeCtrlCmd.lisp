; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude SyncModeCtrlCmd.msg.html

(cl:defclass <SyncModeCtrlCmd> (roslisp-msg-protocol:ros-message)
  ((frame
    :reader frame
    :initarg :frame
    :type cl:integer
    :initform 0)
   (command
    :reader command
    :initarg :command
    :type morai_msgs-msg:CtrlCmd
    :initform (cl:make-instance 'morai_msgs-msg:CtrlCmd))
   (sensor_capture
    :reader sensor_capture
    :initarg :sensor_capture
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SyncModeCtrlCmd (<SyncModeCtrlCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SyncModeCtrlCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SyncModeCtrlCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<SyncModeCtrlCmd> is deprecated: use morai_msgs-msg:SyncModeCtrlCmd instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <SyncModeCtrlCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:frame-val is deprecated.  Use morai_msgs-msg:frame instead.")
  (frame m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <SyncModeCtrlCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:command-val is deprecated.  Use morai_msgs-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'sensor_capture-val :lambda-list '(m))
(cl:defmethod sensor_capture-val ((m <SyncModeCtrlCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:sensor_capture-val is deprecated.  Use morai_msgs-msg:sensor_capture instead.")
  (sensor_capture m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SyncModeCtrlCmd>) ostream)
  "Serializes a message object of type '<SyncModeCtrlCmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'frame)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'frame)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'command) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sensor_capture) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SyncModeCtrlCmd>) istream)
  "Deserializes a message object of type '<SyncModeCtrlCmd>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'frame)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'frame)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'command) istream)
    (cl:setf (cl:slot-value msg 'sensor_capture) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SyncModeCtrlCmd>)))
  "Returns string type for a message object of type '<SyncModeCtrlCmd>"
  "morai_msgs/SyncModeCtrlCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SyncModeCtrlCmd)))
  "Returns string type for a message object of type 'SyncModeCtrlCmd"
  "morai_msgs/SyncModeCtrlCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SyncModeCtrlCmd>)))
  "Returns md5sum for a message object of type '<SyncModeCtrlCmd>"
  "9bab2fd41aaffffe3e4fd625ac8bd37f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SyncModeCtrlCmd)))
  "Returns md5sum for a message object of type 'SyncModeCtrlCmd"
  "9bab2fd41aaffffe3e4fd625ac8bd37f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SyncModeCtrlCmd>)))
  "Returns full string definition for message of type '<SyncModeCtrlCmd>"
  (cl:format cl:nil "# SyncModeCtrlCmd~%# Vehicle control command for synchronous simulation mode.~%~%uint64 frame  # Frame counter~%~%CtrlCmd command  # Vehicle control command~%~%bool sensor_capture  # true: capture sensor data this frame~%~%================================================================================~%MSG: morai_msgs/CtrlCmd~%# CtrlCmd~%# Control command signals for steering, moving, and stopping the ego vehicle.~%# Topic: /ctrl_cmd~%~%int32 longlCmdType  # Control method index (1: Throttle, 2: Velocity, 3: Acceleration)~%~%float64 accel  # Accelerator pedal input, range 0~~1~%float64 brake  # Brake pedal input, range 0~~1~%float64 front_steer  # Front wheel steer angle [rad]~%float64 rear_steer  # Rear wheel steer angle [rad]~%~%float64 velocity  # Target velocity, active when longlCmdType == 2 [km/h]~%float64 acceleration  # Target acceleration, active when longlCmdType == 3 [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SyncModeCtrlCmd)))
  "Returns full string definition for message of type 'SyncModeCtrlCmd"
  (cl:format cl:nil "# SyncModeCtrlCmd~%# Vehicle control command for synchronous simulation mode.~%~%uint64 frame  # Frame counter~%~%CtrlCmd command  # Vehicle control command~%~%bool sensor_capture  # true: capture sensor data this frame~%~%================================================================================~%MSG: morai_msgs/CtrlCmd~%# CtrlCmd~%# Control command signals for steering, moving, and stopping the ego vehicle.~%# Topic: /ctrl_cmd~%~%int32 longlCmdType  # Control method index (1: Throttle, 2: Velocity, 3: Acceleration)~%~%float64 accel  # Accelerator pedal input, range 0~~1~%float64 brake  # Brake pedal input, range 0~~1~%float64 front_steer  # Front wheel steer angle [rad]~%float64 rear_steer  # Rear wheel steer angle [rad]~%~%float64 velocity  # Target velocity, active when longlCmdType == 2 [km/h]~%float64 acceleration  # Target acceleration, active when longlCmdType == 3 [m/s^2]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SyncModeCtrlCmd>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'command))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SyncModeCtrlCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'SyncModeCtrlCmd
    (cl:cons ':frame (frame msg))
    (cl:cons ':command (command msg))
    (cl:cons ':sensor_capture (sensor_capture msg))
))
