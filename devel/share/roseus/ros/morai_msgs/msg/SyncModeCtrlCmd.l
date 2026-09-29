;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::SyncModeCtrlCmd)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'SyncModeCtrlCmd (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::SYNCMODECTRLCMD")
  (make-package "MORAI_MSGS::SYNCMODECTRLCMD"))

(in-package "ROS")
;;//! \htmlinclude SyncModeCtrlCmd.msg.html


(defclass morai_msgs::SyncModeCtrlCmd
  :super ros::object
  :slots (_frame _command _sensor_capture ))

(defmethod morai_msgs::SyncModeCtrlCmd
  (:init
   (&key
    ((:frame __frame) 0)
    ((:command __command) (instance morai_msgs::CtrlCmd :init))
    ((:sensor_capture __sensor_capture) nil)
    )
   (send-super :init)
   (setq _frame (round __frame))
   (setq _command __command)
   (setq _sensor_capture __sensor_capture)
   self)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:command
   (&rest __command)
   (if (keywordp (car __command))
       (send* _command __command)
     (progn
       (if __command (setq _command (car __command)))
       _command)))
  (:sensor_capture
   (&optional (__sensor_capture :null))
   (if (not (eq __sensor_capture :null)) (setq _sensor_capture __sensor_capture)) _sensor_capture)
  (:serialization-length
   ()
   (+
    ;; uint64 _frame
    8
    ;; morai_msgs/CtrlCmd _command
    (send _command :serialization-length)
    ;; bool _sensor_capture
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _frame
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _frame (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _frame) (= (length (_frame . bv)) 2)) ;; bignum
              (write-long (ash (elt (_frame . bv) 0) 0) s)
              (write-long (ash (elt (_frame . bv) 1) -1) s))
             ((and (class _frame) (= (length (_frame . bv)) 1)) ;; big1
              (write-long (elt (_frame . bv) 0) s)
              (write-long (if (>= _frame 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _frame s)(write-long (if (>= _frame 0) 0 #xffffffff) s)))
     ;; morai_msgs/CtrlCmd _command
       (send _command :serialize s)
     ;; bool _sensor_capture
       (if _sensor_capture (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _frame
     
#+(or :alpha :irix6 :x86_64)
      (setf _frame (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _frame (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; morai_msgs/CtrlCmd _command
     (send _command :deserialize buf ptr-) (incf ptr- (send _command :serialization-length))
   ;; bool _sensor_capture
     (setq _sensor_capture (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get morai_msgs::SyncModeCtrlCmd :md5sum-) "9bab2fd41aaffffe3e4fd625ac8bd37f")
(setf (get morai_msgs::SyncModeCtrlCmd :datatype-) "morai_msgs/SyncModeCtrlCmd")
(setf (get morai_msgs::SyncModeCtrlCmd :definition-)
      "# SyncModeCtrlCmd
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

")



(provide :morai_msgs/SyncModeCtrlCmd "9bab2fd41aaffffe3e4fd625ac8bd37f")


