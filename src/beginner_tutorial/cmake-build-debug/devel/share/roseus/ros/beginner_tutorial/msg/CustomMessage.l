;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorial::CustomMessage)
  (if (not (find-package "BEGINNER_TUTORIAL"))
    (make-package "BEGINNER_TUTORIAL"))
  (shadow 'CustomMessage (find-package "BEGINNER_TUTORIAL")))
(unless (find-package "BEGINNER_TUTORIAL::CUSTOMMESSAGE")
  (make-package "BEGINNER_TUTORIAL::CUSTOMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude CustomMessage.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass beginner_tutorial::CustomMessage
  :super ros::object
  :slots (_header _im_true _means ))

(defmethod beginner_tutorial::CustomMessage
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:im_true __im_true) nil)
    ((:means __means) (make-array 4 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _im_true __im_true)
   (setq _means __means)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:im_true
   (&optional __im_true)
   (if __im_true (setq _im_true __im_true)) _im_true)
  (:means
   (&optional __means)
   (if __means (setq _means __means)) _means)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _im_true
    1
    ;; float64[4] _means
    (* 8    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _im_true
       (if _im_true (write-byte -1 s) (write-byte 0 s))
     ;; float64[4] _means
     (dotimes (i 4)
       (sys::poke (elt _means i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _im_true
     (setq _im_true (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64[4] _means
   (dotimes (i (length _means))
     (setf (elt _means i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get beginner_tutorial::CustomMessage :md5sum-) "4f6f12475d5f3b00d1c1cc40fe235cbb")
(setf (get beginner_tutorial::CustomMessage :datatype-) "beginner_tutorial/CustomMessage")
(setf (get beginner_tutorial::CustomMessage :definition-)
      "Header header
bool im_true
float64[4] means
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



(provide :beginner_tutorial/CustomMessage "4f6f12475d5f3b00d1c1cc40fe235cbb")


