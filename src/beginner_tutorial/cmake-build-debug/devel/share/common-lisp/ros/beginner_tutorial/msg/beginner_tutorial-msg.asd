
(cl:in-package :asdf)

(defsystem "beginner_tutorial-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CustomMessage" :depends-on ("_package_CustomMessage"))
    (:file "_package_CustomMessage" :depends-on ("_package"))
  ))