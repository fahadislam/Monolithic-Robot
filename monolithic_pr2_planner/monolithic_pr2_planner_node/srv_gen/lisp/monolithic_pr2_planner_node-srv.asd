
(cl:in-package :asdf)

(defsystem "monolithic_pr2_planner_node-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "GetMobileArmPlan" :depends-on ("_package_GetMobileArmPlan"))
    (:file "_package_GetMobileArmPlan" :depends-on ("_package"))
  ))