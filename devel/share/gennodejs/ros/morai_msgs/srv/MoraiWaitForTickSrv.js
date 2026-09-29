// Auto-generated. Do not edit!

// (in-package morai_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let WaitForTick = require('../msg/WaitForTick.js');

//-----------------------------------------------------------

let WaitForTickResponse = require('../msg/WaitForTickResponse.js');

//-----------------------------------------------------------

class MoraiWaitForTickSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.request = null;
    }
    else {
      if (initObj.hasOwnProperty('request')) {
        this.request = initObj.request
      }
      else {
        this.request = new WaitForTick();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoraiWaitForTickSrvRequest
    // Serialize message field [request]
    bufferOffset = WaitForTick.serialize(obj.request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiWaitForTickSrvRequest
    let len;
    let data = new MoraiWaitForTickSrvRequest(null);
    // Deserialize message field [request]
    data.request = WaitForTick.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += WaitForTick.getMessageSize(object.request);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiWaitForTickSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '77331daf5459fbd0382fad85fbd00b0f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    WaitForTick request
    
    ================================================================================
    MSG: morai_msgs/WaitForTick
    # WaitForTick
    # Request to wait for the next simulation tick in synchronous mode.
    
    string user_id  # User identifier
    uint64 frame  # Current frame number
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoraiWaitForTickSrvRequest(null);
    if (msg.request !== undefined) {
      resolved.request = WaitForTick.Resolve(msg.request)
    }
    else {
      resolved.request = new WaitForTick()
    }

    return resolved;
    }
};

class MoraiWaitForTickSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response = null;
    }
    else {
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = new WaitForTickResponse();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoraiWaitForTickSrvResponse
    // Serialize message field [response]
    bufferOffset = WaitForTickResponse.serialize(obj.response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiWaitForTickSrvResponse
    let len;
    let data = new MoraiWaitForTickSrvResponse(null);
    // Deserialize message field [response]
    data.response = WaitForTickResponse.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += WaitForTickResponse.getMessageSize(object.response);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiWaitForTickSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd3e870eaeeef51ae05e735f139f5a34a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    WaitForTickResponse response
    
    
    ================================================================================
    MSG: morai_msgs/WaitForTickResponse
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
    const resolved = new MoraiWaitForTickSrvResponse(null);
    if (msg.response !== undefined) {
      resolved.response = WaitForTickResponse.Resolve(msg.response)
    }
    else {
      resolved.response = new WaitForTickResponse()
    }

    return resolved;
    }
};

module.exports = {
  Request: MoraiWaitForTickSrvRequest,
  Response: MoraiWaitForTickSrvResponse,
  md5sum() { return '3eb0a3f62d91d9466c06193a806b0d89'; },
  datatype() { return 'morai_msgs/MoraiWaitForTickSrv'; }
};
