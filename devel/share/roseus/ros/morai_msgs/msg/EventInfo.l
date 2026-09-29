;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::EventInfo)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'EventInfo (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::EVENTINFO")
  (make-package "MORAI_MSGS::EVENTINFO"))

(in-package "ROS")
;;//! \htmlinclude EventInfo.msg.html


(defclass morai_msgs::EventInfo
  :super ros::object
  :slots (_option _ctrl_mode _gear _lamps _set_pause ))

(defmethod morai_msgs::EventInfo
  (:init
   (&key
    ((:option __option) 0)
    ((:ctrl_mode __ctrl_mode) 0)
    ((:gear __gear) 0)
    ((:lamps __lamps) (instance morai_msgs::Lamps :init))
    ((:set_pause __set_pause) nil)
    )
   (send-super :init)
   (setq _option (round __option))
   (setq _ctrl_mode (round __ctrl_mode))
   (setq _gear (round __gear))
   (setq _lamps __lamps)
   (setq _set_pause __set_pause)
   self)
  (:option
   (&optional __option)
   (if __option (setq _option __option)) _option)
  (:ctrl_mode
   (&optional __ctrl_mode)
   (if __ctrl_mode (setq _ctrl_mode __ctrl_mode)) _ctrl_mode)
  (:gear
   (&optional __gear)
   (if __gear (setq _gear __gear)) _gear)
  (:lamps
   (&rest __lamps)
   (if (keywordp (car __lamps))
       (send* _lamps __lamps)
     (progn
       (if __lamps (setq _lamps (car __lamps)))
       _lamps)))
  (:set_pause
   (&optional (__set_pause :null))
   (if (not (eq __set_pause :null)) (setq _set_pause __set_pause)) _set_pause)
  (:serialization-length
   ()
   (+
    ;; int8 _option
    1
    ;; int32 _ctrl_mode
    4
    ;; int32 _gear
    4
    ;; morai_msgs/Lamps _lamps
    (send _lamps :serialization-length)
    ;; bool _set_pause
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _option
       (write-byte _option s)
     ;; int32 _ctrl_mode
       (write-long _ctrl_mode s)
     ;; int32 _gear
       (write-long _gear s)
     ;; morai_msgs/Lamps _lamps
       (send _lamps :serialize s)
     ;; bool _set_pause
       (if _set_pause (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _option
     (setq _option (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _option 127) (setq _option (- _option 256)))
   ;; int32 _ctrl_mode
     (setq _ctrl_mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _gear
     (setq _gear (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; morai_msgs/Lamps _lamps
     (send _lamps :deserialize buf ptr-) (incf ptr- (send _lamps :serialization-length))
   ;; bool _set_pause
     (setq _set_pause (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get morai_msgs::EventInfo :md5sum-) "3525edb8661dfd06b6e59bbcb7d475b5")
(setf (get morai_msgs::EventInfo :datatype-) "morai_msgs/EventInfo")
(setf (get morai_msgs::EventInfo :definition-)
      "# EventInfo
# One-time event control for vehicle state changes.
# Service: /Service_MoraiEventCmd (request/response)

int8 option  # Bitmask for fields to apply (0x0001: ctrl_mode, 0x0010: gear, 0x0100: lamps, 0x1000: set_pause)
int32 ctrl_mode  # Control mode (1: Keyboard, 2: Gamepad, 3: External, 6: Auto agent controlled)
int32 gear  # Gear selection (-1: No change, 1: Parking, 2: Reverse, 3: Neutral, 4: Drive)
Lamps lamps  # Vehicle lamp controls
bool set_pause  # true: pause simulation, false: continue

================================================================================
MSG: morai_msgs/Lamps
# Lamps
# Vehicle turn signal and emergency lamp control.
# Topic: /lamps

Header header

int8 turnSignal  # Turn signal (0: No signal, 1: Left, 2: Right)
int8 emergencySignal  # Emergency signal (0: No signal, 1: Emergency lamps on)

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

")



(provide :morai_msgs/EventInfo "3525edb8661dfd06b6e59bbcb7d475b5")


