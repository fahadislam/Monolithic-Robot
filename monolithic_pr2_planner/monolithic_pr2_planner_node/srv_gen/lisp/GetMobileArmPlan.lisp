; Auto-generated. Do not edit!


(cl:in-package monolithic_pr2_planner_node-srv)


;//! \htmlinclude GetMobileArmPlan-request.msg.html

(cl:defclass <GetMobileArmPlan-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (underspecified_start
    :reader underspecified_start
    :initarg :underspecified_start
    :type cl:boolean
    :initform cl:nil)
   (planning_mode
    :reader planning_mode
    :initarg :planning_mode
    :type cl:fixnum
    :initform 0)
   (allocated_planning_time
    :reader allocated_planning_time
    :initarg :allocated_planning_time
    :type cl:float
    :initform 0.0)
   (rarm_start
    :reader rarm_start
    :initarg :rarm_start
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (larm_start
    :reader larm_start
    :initarg :larm_start
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (body_start
    :reader body_start
    :initarg :body_start
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (rarm_goal
    :reader rarm_goal
    :initarg :rarm_goal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (larm_goal
    :reader larm_goal
    :initarg :larm_goal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (body_goal
    :reader body_goal
    :initarg :body_goal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (goal
    :reader goal
    :initarg :goal
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (xyz_tolerance
    :reader xyz_tolerance
    :initarg :xyz_tolerance
    :type cl:float
    :initform 0.0)
   (roll_tolerance
    :reader roll_tolerance
    :initarg :roll_tolerance
    :type cl:float
    :initform 0.0)
   (pitch_tolerance
    :reader pitch_tolerance
    :initarg :pitch_tolerance
    :type cl:float
    :initform 0.0)
   (yaw_tolerance
    :reader yaw_tolerance
    :initarg :yaw_tolerance
    :type cl:float
    :initform 0.0)
   (rarm_object
    :reader rarm_object
    :initarg :rarm_object
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (larm_object
    :reader larm_object
    :initarg :larm_object
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (initial_eps
    :reader initial_eps
    :initarg :initial_eps
    :type cl:float
    :initform 0.0)
   (final_eps
    :reader final_eps
    :initarg :final_eps
    :type cl:float
    :initform 0.0)
   (dec_eps
    :reader dec_eps
    :initarg :dec_eps
    :type cl:float
    :initform 0.0)
   (planner_type
    :reader planner_type
    :initarg :planner_type
    :type cl:fixnum
    :initform 0)
   (meta_search_type
    :reader meta_search_type
    :initarg :meta_search_type
    :type cl:fixnum
    :initform 0)
   (use_ompl
    :reader use_ompl
    :initarg :use_ompl
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GetMobileArmPlan-request (<GetMobileArmPlan-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMobileArmPlan-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMobileArmPlan-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name monolithic_pr2_planner_node-srv:<GetMobileArmPlan-request> is deprecated: use monolithic_pr2_planner_node-srv:GetMobileArmPlan-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:start-val is deprecated.  Use monolithic_pr2_planner_node-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'underspecified_start-val :lambda-list '(m))
(cl:defmethod underspecified_start-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:underspecified_start-val is deprecated.  Use monolithic_pr2_planner_node-srv:underspecified_start instead.")
  (underspecified_start m))

(cl:ensure-generic-function 'planning_mode-val :lambda-list '(m))
(cl:defmethod planning_mode-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:planning_mode-val is deprecated.  Use monolithic_pr2_planner_node-srv:planning_mode instead.")
  (planning_mode m))

(cl:ensure-generic-function 'allocated_planning_time-val :lambda-list '(m))
(cl:defmethod allocated_planning_time-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:allocated_planning_time-val is deprecated.  Use monolithic_pr2_planner_node-srv:allocated_planning_time instead.")
  (allocated_planning_time m))

(cl:ensure-generic-function 'rarm_start-val :lambda-list '(m))
(cl:defmethod rarm_start-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:rarm_start-val is deprecated.  Use monolithic_pr2_planner_node-srv:rarm_start instead.")
  (rarm_start m))

(cl:ensure-generic-function 'larm_start-val :lambda-list '(m))
(cl:defmethod larm_start-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:larm_start-val is deprecated.  Use monolithic_pr2_planner_node-srv:larm_start instead.")
  (larm_start m))

(cl:ensure-generic-function 'body_start-val :lambda-list '(m))
(cl:defmethod body_start-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:body_start-val is deprecated.  Use monolithic_pr2_planner_node-srv:body_start instead.")
  (body_start m))

(cl:ensure-generic-function 'rarm_goal-val :lambda-list '(m))
(cl:defmethod rarm_goal-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:rarm_goal-val is deprecated.  Use monolithic_pr2_planner_node-srv:rarm_goal instead.")
  (rarm_goal m))

(cl:ensure-generic-function 'larm_goal-val :lambda-list '(m))
(cl:defmethod larm_goal-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:larm_goal-val is deprecated.  Use monolithic_pr2_planner_node-srv:larm_goal instead.")
  (larm_goal m))

(cl:ensure-generic-function 'body_goal-val :lambda-list '(m))
(cl:defmethod body_goal-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:body_goal-val is deprecated.  Use monolithic_pr2_planner_node-srv:body_goal instead.")
  (body_goal m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:goal-val is deprecated.  Use monolithic_pr2_planner_node-srv:goal instead.")
  (goal m))

(cl:ensure-generic-function 'xyz_tolerance-val :lambda-list '(m))
(cl:defmethod xyz_tolerance-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:xyz_tolerance-val is deprecated.  Use monolithic_pr2_planner_node-srv:xyz_tolerance instead.")
  (xyz_tolerance m))

(cl:ensure-generic-function 'roll_tolerance-val :lambda-list '(m))
(cl:defmethod roll_tolerance-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:roll_tolerance-val is deprecated.  Use monolithic_pr2_planner_node-srv:roll_tolerance instead.")
  (roll_tolerance m))

(cl:ensure-generic-function 'pitch_tolerance-val :lambda-list '(m))
(cl:defmethod pitch_tolerance-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:pitch_tolerance-val is deprecated.  Use monolithic_pr2_planner_node-srv:pitch_tolerance instead.")
  (pitch_tolerance m))

(cl:ensure-generic-function 'yaw_tolerance-val :lambda-list '(m))
(cl:defmethod yaw_tolerance-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:yaw_tolerance-val is deprecated.  Use monolithic_pr2_planner_node-srv:yaw_tolerance instead.")
  (yaw_tolerance m))

(cl:ensure-generic-function 'rarm_object-val :lambda-list '(m))
(cl:defmethod rarm_object-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:rarm_object-val is deprecated.  Use monolithic_pr2_planner_node-srv:rarm_object instead.")
  (rarm_object m))

(cl:ensure-generic-function 'larm_object-val :lambda-list '(m))
(cl:defmethod larm_object-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:larm_object-val is deprecated.  Use monolithic_pr2_planner_node-srv:larm_object instead.")
  (larm_object m))

(cl:ensure-generic-function 'initial_eps-val :lambda-list '(m))
(cl:defmethod initial_eps-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:initial_eps-val is deprecated.  Use monolithic_pr2_planner_node-srv:initial_eps instead.")
  (initial_eps m))

(cl:ensure-generic-function 'final_eps-val :lambda-list '(m))
(cl:defmethod final_eps-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:final_eps-val is deprecated.  Use monolithic_pr2_planner_node-srv:final_eps instead.")
  (final_eps m))

(cl:ensure-generic-function 'dec_eps-val :lambda-list '(m))
(cl:defmethod dec_eps-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:dec_eps-val is deprecated.  Use monolithic_pr2_planner_node-srv:dec_eps instead.")
  (dec_eps m))

(cl:ensure-generic-function 'planner_type-val :lambda-list '(m))
(cl:defmethod planner_type-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:planner_type-val is deprecated.  Use monolithic_pr2_planner_node-srv:planner_type instead.")
  (planner_type m))

(cl:ensure-generic-function 'meta_search_type-val :lambda-list '(m))
(cl:defmethod meta_search_type-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:meta_search_type-val is deprecated.  Use monolithic_pr2_planner_node-srv:meta_search_type instead.")
  (meta_search_type m))

(cl:ensure-generic-function 'use_ompl-val :lambda-list '(m))
(cl:defmethod use_ompl-val ((m <GetMobileArmPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:use_ompl-val is deprecated.  Use monolithic_pr2_planner_node-srv:use_ompl instead.")
  (use_ompl m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMobileArmPlan-request>) ostream)
  "Serializes a message object of type '<GetMobileArmPlan-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'underspecified_start) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'planning_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'allocated_planning_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rarm_start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'rarm_start))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'larm_start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'larm_start))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'body_start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'body_start))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rarm_goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'rarm_goal))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'larm_goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'larm_goal))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'body_goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'body_goal))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'xyz_tolerance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'roll_tolerance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch_tolerance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw_tolerance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rarm_object) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'larm_object) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'initial_eps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'final_eps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dec_eps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'planner_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'meta_search_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'use_ompl) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMobileArmPlan-request>) istream)
  "Deserializes a message object of type '<GetMobileArmPlan-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start) istream)
    (cl:setf (cl:slot-value msg 'underspecified_start) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planning_mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'allocated_planning_time) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rarm_start) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rarm_start)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'larm_start) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'larm_start)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'body_start) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'body_start)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rarm_goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rarm_goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'larm_goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'larm_goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'body_goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'body_goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xyz_tolerance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll_tolerance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_tolerance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_tolerance) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rarm_object) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'larm_object) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initial_eps) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'final_eps) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dec_eps) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planner_type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'meta_search_type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'use_ompl) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMobileArmPlan-request>)))
  "Returns string type for a service object of type '<GetMobileArmPlan-request>"
  "monolithic_pr2_planner_node/GetMobileArmPlanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMobileArmPlan-request)))
  "Returns string type for a service object of type 'GetMobileArmPlan-request"
  "monolithic_pr2_planner_node/GetMobileArmPlanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMobileArmPlan-request>)))
  "Returns md5sum for a message object of type '<GetMobileArmPlan-request>"
  "ca80c20ca7a1caf76ab297b863eb4514")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMobileArmPlan-request)))
  "Returns md5sum for a message object of type 'GetMobileArmPlan-request"
  "ca80c20ca7a1caf76ab297b863eb4514")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMobileArmPlan-request>)))
  "Returns full string definition for message of type '<GetMobileArmPlan-request>"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped start~%~%bool underspecified_start~%int8 planning_mode~%float64 allocated_planning_time~%~%float64[] rarm_start~%float64[] larm_start~%float64[] body_start~%float64[] rarm_goal~%float64[] larm_goal~%float64[] body_goal~%~%geometry_msgs/PoseStamped goal~%~%float64 xyz_tolerance~%float64 roll_tolerance~%float64 pitch_tolerance~%float64 yaw_tolerance~%~%geometry_msgs/PoseStamped rarm_object~%~%geometry_msgs/PoseStamped larm_object~%float64 initial_eps~%float64 final_eps~%float64 dec_eps~%int8 planner_type~%int8 meta_search_type~%bool use_ompl~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMobileArmPlan-request)))
  "Returns full string definition for message of type 'GetMobileArmPlan-request"
  (cl:format cl:nil "~%geometry_msgs/PoseStamped start~%~%bool underspecified_start~%int8 planning_mode~%float64 allocated_planning_time~%~%float64[] rarm_start~%float64[] larm_start~%float64[] body_start~%float64[] rarm_goal~%float64[] larm_goal~%float64[] body_goal~%~%geometry_msgs/PoseStamped goal~%~%float64 xyz_tolerance~%float64 roll_tolerance~%float64 pitch_tolerance~%float64 yaw_tolerance~%~%geometry_msgs/PoseStamped rarm_object~%~%geometry_msgs/PoseStamped larm_object~%float64 initial_eps~%float64 final_eps~%float64 dec_eps~%int8 planner_type~%int8 meta_search_type~%bool use_ompl~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMobileArmPlan-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start))
     1
     1
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rarm_start) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'larm_start) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'body_start) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rarm_goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'larm_goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'body_goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
     8
     8
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rarm_object))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'larm_object))
     8
     8
     8
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMobileArmPlan-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMobileArmPlan-request
    (cl:cons ':start (start msg))
    (cl:cons ':underspecified_start (underspecified_start msg))
    (cl:cons ':planning_mode (planning_mode msg))
    (cl:cons ':allocated_planning_time (allocated_planning_time msg))
    (cl:cons ':rarm_start (rarm_start msg))
    (cl:cons ':larm_start (larm_start msg))
    (cl:cons ':body_start (body_start msg))
    (cl:cons ':rarm_goal (rarm_goal msg))
    (cl:cons ':larm_goal (larm_goal msg))
    (cl:cons ':body_goal (body_goal msg))
    (cl:cons ':goal (goal msg))
    (cl:cons ':xyz_tolerance (xyz_tolerance msg))
    (cl:cons ':roll_tolerance (roll_tolerance msg))
    (cl:cons ':pitch_tolerance (pitch_tolerance msg))
    (cl:cons ':yaw_tolerance (yaw_tolerance msg))
    (cl:cons ':rarm_object (rarm_object msg))
    (cl:cons ':larm_object (larm_object msg))
    (cl:cons ':initial_eps (initial_eps msg))
    (cl:cons ':final_eps (final_eps msg))
    (cl:cons ':dec_eps (dec_eps msg))
    (cl:cons ':planner_type (planner_type msg))
    (cl:cons ':meta_search_type (meta_search_type msg))
    (cl:cons ':use_ompl (use_ompl msg))
))
;//! \htmlinclude GetMobileArmPlan-response.msg.html

(cl:defclass <GetMobileArmPlan-response> (roslisp-msg-protocol:ros-message)
  ((trajectory
    :reader trajectory
    :initarg :trajectory
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory))
   (body_trajectory
    :reader body_trajectory
    :initarg :body_trajectory
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory))
   (stats_field_names
    :reader stats_field_names
    :initarg :stats_field_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (stats
    :reader stats
    :initarg :stats
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass GetMobileArmPlan-response (<GetMobileArmPlan-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMobileArmPlan-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMobileArmPlan-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name monolithic_pr2_planner_node-srv:<GetMobileArmPlan-response> is deprecated: use monolithic_pr2_planner_node-srv:GetMobileArmPlan-response instead.")))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <GetMobileArmPlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:trajectory-val is deprecated.  Use monolithic_pr2_planner_node-srv:trajectory instead.")
  (trajectory m))

(cl:ensure-generic-function 'body_trajectory-val :lambda-list '(m))
(cl:defmethod body_trajectory-val ((m <GetMobileArmPlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:body_trajectory-val is deprecated.  Use monolithic_pr2_planner_node-srv:body_trajectory instead.")
  (body_trajectory m))

(cl:ensure-generic-function 'stats_field_names-val :lambda-list '(m))
(cl:defmethod stats_field_names-val ((m <GetMobileArmPlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:stats_field_names-val is deprecated.  Use monolithic_pr2_planner_node-srv:stats_field_names instead.")
  (stats_field_names m))

(cl:ensure-generic-function 'stats-val :lambda-list '(m))
(cl:defmethod stats-val ((m <GetMobileArmPlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monolithic_pr2_planner_node-srv:stats-val is deprecated.  Use monolithic_pr2_planner_node-srv:stats instead.")
  (stats m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMobileArmPlan-response>) ostream)
  "Serializes a message object of type '<GetMobileArmPlan-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'body_trajectory) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'stats_field_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'stats_field_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'stats))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'stats))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMobileArmPlan-response>) istream)
  "Deserializes a message object of type '<GetMobileArmPlan-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'body_trajectory) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'stats_field_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'stats_field_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'stats) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'stats)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMobileArmPlan-response>)))
  "Returns string type for a service object of type '<GetMobileArmPlan-response>"
  "monolithic_pr2_planner_node/GetMobileArmPlanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMobileArmPlan-response)))
  "Returns string type for a service object of type 'GetMobileArmPlan-response"
  "monolithic_pr2_planner_node/GetMobileArmPlanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMobileArmPlan-response>)))
  "Returns md5sum for a message object of type '<GetMobileArmPlan-response>"
  "ca80c20ca7a1caf76ab297b863eb4514")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMobileArmPlan-response)))
  "Returns md5sum for a message object of type 'GetMobileArmPlan-response"
  "ca80c20ca7a1caf76ab297b863eb4514")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMobileArmPlan-response>)))
  "Returns full string definition for message of type '<GetMobileArmPlan-response>"
  (cl:format cl:nil "~%trajectory_msgs/JointTrajectory trajectory~%trajectory_msgs/JointTrajectory body_trajectory~%~%string[] stats_field_names~%float64[] stats~%~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMobileArmPlan-response)))
  "Returns full string definition for message of type 'GetMobileArmPlan-response"
  (cl:format cl:nil "~%trajectory_msgs/JointTrajectory trajectory~%trajectory_msgs/JointTrajectory body_trajectory~%~%string[] stats_field_names~%float64[] stats~%~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%float64[] positions~%float64[] velocities~%float64[] accelerations~%duration time_from_start~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMobileArmPlan-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'body_trajectory))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'stats_field_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'stats) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMobileArmPlan-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMobileArmPlan-response
    (cl:cons ':trajectory (trajectory msg))
    (cl:cons ':body_trajectory (body_trajectory msg))
    (cl:cons ':stats_field_names (stats_field_names msg))
    (cl:cons ':stats (stats msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetMobileArmPlan)))
  'GetMobileArmPlan-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetMobileArmPlan)))
  'GetMobileArmPlan-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMobileArmPlan)))
  "Returns string type for a service object of type '<GetMobileArmPlan>"
  "monolithic_pr2_planner_node/GetMobileArmPlan")