;; Auto-generated. Do not edit!


(when (boundp 'aim_week1::CustomMsg)
  (if (not (find-package "AIM_WEEK1"))
    (make-package "AIM_WEEK1"))
  (shadow 'CustomMsg (find-package "AIM_WEEK1")))
(unless (find-package "AIM_WEEK1::CUSTOMMSG")
  (make-package "AIM_WEEK1::CUSTOMMSG"))

(in-package "ROS")
;;//! \htmlinclude CustomMsg.msg.html


(defclass aim_week1::CustomMsg
  :super ros::object
  :slots (_float_data _double_data _float_array ))

(defmethod aim_week1::CustomMsg
  (:init
   (&key
    ((:float_data __float_data) 0.0)
    ((:double_data __double_data) 0.0)
    ((:float_array __float_array) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _float_data (float __float_data))
   (setq _double_data (float __double_data))
   (setq _float_array __float_array)
   self)
  (:float_data
   (&optional __float_data)
   (if __float_data (setq _float_data __float_data)) _float_data)
  (:double_data
   (&optional __double_data)
   (if __double_data (setq _double_data __double_data)) _double_data)
  (:float_array
   (&optional __float_array)
   (if __float_array (setq _float_array __float_array)) _float_array)
  (:serialization-length
   ()
   (+
    ;; float32 _float_data
    4
    ;; float64 _double_data
    8
    ;; float32[] _float_array
    (* 4    (length _float_array)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _float_data
       (sys::poke _float_data (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _double_data
       (sys::poke _double_data (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32[] _float_array
     (write-long (length _float_array) s)
     (dotimes (i (length _float_array))
       (sys::poke (elt _float_array i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _float_data
     (setq _float_data (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _double_data
     (setq _double_data (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32[] _float_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _float_array (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _float_array i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get aim_week1::CustomMsg :md5sum-) "85e53a95a789917d4fe5c58d9212cdda")
(setf (get aim_week1::CustomMsg :datatype-) "aim_week1/CustomMsg")
(setf (get aim_week1::CustomMsg :definition-)
      "float32 float_data
float64 double_data
float32[] float_array


")



(provide :aim_week1/CustomMsg "85e53a95a789917d4fe5c58d9212cdda")


