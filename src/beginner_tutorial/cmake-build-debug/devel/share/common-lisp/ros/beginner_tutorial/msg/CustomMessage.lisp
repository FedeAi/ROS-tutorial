; Auto-generated. Do not edit!


(cl:in-package beginner_tutorial-msg)


;//! \htmlinclude CustomMessage.msg.html

(cl:defclass <CustomMessage> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (im_true
    :reader im_true
    :initarg :im_true
    :type cl:boolean
    :initform cl:nil)
   (means
    :reader means
    :initarg :means
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass CustomMessage (<CustomMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorial-msg:<CustomMessage> is deprecated: use beginner_tutorial-msg:CustomMessage instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CustomMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorial-msg:header-val is deprecated.  Use beginner_tutorial-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'im_true-val :lambda-list '(m))
(cl:defmethod im_true-val ((m <CustomMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorial-msg:im_true-val is deprecated.  Use beginner_tutorial-msg:im_true instead.")
  (im_true m))

(cl:ensure-generic-function 'means-val :lambda-list '(m))
(cl:defmethod means-val ((m <CustomMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorial-msg:means-val is deprecated.  Use beginner_tutorial-msg:means instead.")
  (means m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomMessage>) ostream)
  "Serializes a message object of type '<CustomMessage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'im_true) 1 0)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'means))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomMessage>) istream)
  "Deserializes a message object of type '<CustomMessage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'im_true) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'means) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'means)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomMessage>)))
  "Returns string type for a message object of type '<CustomMessage>"
  "beginner_tutorial/CustomMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomMessage)))
  "Returns string type for a message object of type 'CustomMessage"
  "beginner_tutorial/CustomMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomMessage>)))
  "Returns md5sum for a message object of type '<CustomMessage>"
  "4f6f12475d5f3b00d1c1cc40fe235cbb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomMessage)))
  "Returns md5sum for a message object of type 'CustomMessage"
  "4f6f12475d5f3b00d1c1cc40fe235cbb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomMessage>)))
  "Returns full string definition for message of type '<CustomMessage>"
  (cl:format cl:nil "Header header~%bool im_true~%float64[4] means~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomMessage)))
  "Returns full string definition for message of type 'CustomMessage"
  (cl:format cl:nil "Header header~%bool im_true~%float64[4] means~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomMessage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'means) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomMessage
    (cl:cons ':header (header msg))
    (cl:cons ':im_true (im_true msg))
    (cl:cons ':means (means msg))
))
