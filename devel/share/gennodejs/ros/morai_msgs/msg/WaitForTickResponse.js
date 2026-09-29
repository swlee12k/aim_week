// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let EgoVehicleStatus = require('./EgoVehicleStatus.js');

//-----------------------------------------------------------

class WaitForTickResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tick_status = null;
      this.pause_status = null;
      this.frame = null;
      this.vehicle_status = null;
      this.time = null;
    }
    else {
      if (initObj.hasOwnProperty('tick_status')) {
        this.tick_status = initObj.tick_status
      }
      else {
        this.tick_status = false;
      }
      if (initObj.hasOwnProperty('pause_status')) {
        this.pause_status = initObj.pause_status
      }
      else {
        this.pause_status = false;
      }
      if (initObj.hasOwnProperty('frame')) {
        this.frame = initObj.frame
      }
      else {
        this.frame = 0;
      }
      if (initObj.hasOwnProperty('vehicle_status')) {
        this.vehicle_status = initObj.vehicle_status
      }
      else {
        this.vehicle_status = new EgoVehicleStatus();
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WaitForTickResponse
    // Serialize message field [tick_status]
    bufferOffset = _serializer.bool(obj.tick_status, buffer, bufferOffset);
    // Serialize message field [pause_status]
    bufferOffset = _serializer.bool(obj.pause_status, buffer, bufferOffset);
    // Serialize message field [frame]
    bufferOffset = _serializer.uint64(obj.frame, buffer, bufferOffset);
    // Serialize message field [vehicle_status]
    bufferOffset = EgoVehicleStatus.serialize(obj.vehicle_status, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.string(obj.time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WaitForTickResponse
    let len;
    let data = new WaitForTickResponse(null);
    // Deserialize message field [tick_status]
    data.tick_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pause_status]
    data.pause_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [frame]
    data.frame = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [vehicle_status]
    data.vehicle_status = EgoVehicleStatus.deserialize(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += EgoVehicleStatus.getMessageSize(object.vehicle_status);
    length += _getByteLength(object.time);
    return length + 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/WaitForTickResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fcaf263771473ddaa95a4748655aaf9e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # WaitForTickResponse
    # Response after a simulation tick completes in synchronous mode.
    
    bool tick_status  # Tick completion status
    bool pause_status  # Simulation pause status
    uint64 frame  # Current frame number
    
    EgoVehicleStatus vehicle_status  # Ego vehicle state after tick
    string time  # Simulation timestamp
    
    ================================================================================
    MSG: morai_msgs/EgoVehicleStatus
    # EgoVehicleStatus
    # Status telemetry of the ego vehicle for closed-loop control.
    # Topic: /Ego_topic
    
    Header header
    int32 unique_id  # Object unique id
    geometry_msgs/Vector3 acceleration  # Acceleration vector [m/s^2]
    geometry_msgs/Vector3 position  # Current position in ENU coordinates [m]
    geometry_msgs/Vector3 velocity  # Velocity vector [m/s]
    geometry_msgs/Vector3 angular_velocity  # [deg/s] 
    
    float64 heading  # Vehicle heading [deg]
    float32 accel  # Accelerator pedal, range 0~1
    float32 brake  # Brake pedal, range 0~1
    float32 front_steer_angle  # Front wheel angle [deg]
    float32 rear_steer_angle  # Rear wheel angle [deg]
    float32 lateral_offset  # Lateral offset from reference
    
    float32 tire_lateral_force_fl  # Front-left tire lateral force
    float32 tire_lateral_force_fr  # Front-right tire lateral force
    float32 tire_lateral_force_rl  # Rear-left tire lateral force
    float32 tire_lateral_force_rr  # Rear-right tire lateral force
    
    float32 side_slip_angle_fl  # Front-left side slip angle
    float32 side_slip_angle_fr  # Front-right side slip angle
    float32 side_slip_angle_rl  # Rear-left side slip angle
    float32 side_slip_angle_rr  # Rear-right side slip angle
    
    float32 tire_cornering_stiffness_fl  # Front-left cornering stiffness
    float32 tire_cornering_stiffness_fr  # Front-right cornering stiffness
    float32 tire_cornering_stiffness_rl  # Rear-left cornering stiffness
    float32 tire_cornering_stiffness_rr  # Rear-right cornering stiffness
    
    float32 distance_left_lane_boundary  # Distance from left lane boundary [m]
    float32 distance_right_lane_boundary  # Distance from right lane boundary [m]
    float32 cross_track_error  # Distance from lane center, right-positive [m]
    
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
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WaitForTickResponse(null);
    if (msg.tick_status !== undefined) {
      resolved.tick_status = msg.tick_status;
    }
    else {
      resolved.tick_status = false
    }

    if (msg.pause_status !== undefined) {
      resolved.pause_status = msg.pause_status;
    }
    else {
      resolved.pause_status = false
    }

    if (msg.frame !== undefined) {
      resolved.frame = msg.frame;
    }
    else {
      resolved.frame = 0
    }

    if (msg.vehicle_status !== undefined) {
      resolved.vehicle_status = EgoVehicleStatus.Resolve(msg.vehicle_status)
    }
    else {
      resolved.vehicle_status = new EgoVehicleStatus()
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = ''
    }

    return resolved;
    }
};

module.exports = WaitForTickResponse;
