// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ObjectStatusExtended = require('./ObjectStatusExtended.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ObjectStatusListExtended {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.num_of_npcs = null;
      this.num_of_pedestrian = null;
      this.num_of_obstacle = null;
      this.npc_list = null;
      this.pedestrian_list = null;
      this.obstacle_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('num_of_npcs')) {
        this.num_of_npcs = initObj.num_of_npcs
      }
      else {
        this.num_of_npcs = 0;
      }
      if (initObj.hasOwnProperty('num_of_pedestrian')) {
        this.num_of_pedestrian = initObj.num_of_pedestrian
      }
      else {
        this.num_of_pedestrian = 0;
      }
      if (initObj.hasOwnProperty('num_of_obstacle')) {
        this.num_of_obstacle = initObj.num_of_obstacle
      }
      else {
        this.num_of_obstacle = 0;
      }
      if (initObj.hasOwnProperty('npc_list')) {
        this.npc_list = initObj.npc_list
      }
      else {
        this.npc_list = [];
      }
      if (initObj.hasOwnProperty('pedestrian_list')) {
        this.pedestrian_list = initObj.pedestrian_list
      }
      else {
        this.pedestrian_list = [];
      }
      if (initObj.hasOwnProperty('obstacle_list')) {
        this.obstacle_list = initObj.obstacle_list
      }
      else {
        this.obstacle_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObjectStatusListExtended
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [num_of_npcs]
    bufferOffset = _serializer.int32(obj.num_of_npcs, buffer, bufferOffset);
    // Serialize message field [num_of_pedestrian]
    bufferOffset = _serializer.int32(obj.num_of_pedestrian, buffer, bufferOffset);
    // Serialize message field [num_of_obstacle]
    bufferOffset = _serializer.int32(obj.num_of_obstacle, buffer, bufferOffset);
    // Serialize message field [npc_list]
    // Serialize the length for message field [npc_list]
    bufferOffset = _serializer.uint32(obj.npc_list.length, buffer, bufferOffset);
    obj.npc_list.forEach((val) => {
      bufferOffset = ObjectStatusExtended.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [pedestrian_list]
    // Serialize the length for message field [pedestrian_list]
    bufferOffset = _serializer.uint32(obj.pedestrian_list.length, buffer, bufferOffset);
    obj.pedestrian_list.forEach((val) => {
      bufferOffset = ObjectStatusExtended.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [obstacle_list]
    // Serialize the length for message field [obstacle_list]
    bufferOffset = _serializer.uint32(obj.obstacle_list.length, buffer, bufferOffset);
    obj.obstacle_list.forEach((val) => {
      bufferOffset = ObjectStatusExtended.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObjectStatusListExtended
    let len;
    let data = new ObjectStatusListExtended(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [num_of_npcs]
    data.num_of_npcs = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [num_of_pedestrian]
    data.num_of_pedestrian = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [num_of_obstacle]
    data.num_of_obstacle = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [npc_list]
    // Deserialize array length for message field [npc_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.npc_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.npc_list[i] = ObjectStatusExtended.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [pedestrian_list]
    // Deserialize array length for message field [pedestrian_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pedestrian_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pedestrian_list[i] = ObjectStatusExtended.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [obstacle_list]
    // Deserialize array length for message field [obstacle_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacle_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacle_list[i] = ObjectStatusExtended.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.npc_list.forEach((val) => {
      length += ObjectStatusExtended.getMessageSize(val);
    });
    object.pedestrian_list.forEach((val) => {
      length += ObjectStatusExtended.getMessageSize(val);
    });
    object.obstacle_list.forEach((val) => {
      length += ObjectStatusExtended.getMessageSize(val);
    });
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/ObjectStatusListExtended';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c74a5b5ee3ba424f5d334390beb3ffc3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ObjectStatusListExtended
    # Extended object status list with additional orientation and lane data.
    
    Header header
    
    int32 num_of_npcs  # Number of NPC vehicles
    int32 num_of_pedestrian  # Number of pedestrians
    int32 num_of_obstacle  # Number of static obstacles
    
    ObjectStatusExtended[] npc_list  # Extended NPC vehicle information
    ObjectStatusExtended[] pedestrian_list  # Extended pedestrian information
    ObjectStatusExtended[] obstacle_list  # Extended obstacle information
    
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
    MSG: morai_msgs/ObjectStatusExtended
    # ObjectStatusExtended
    # Extended state information for a single object, including orientation and lane data.
    
    int32 unique_id  # Object unique id
    int32 type  # Object type (0: Pedestrian, 1: NPC vehicle, 2: Static object, -1: Ego vehicle)
    string name  # Object name
    float64 heading  # Object heading [deg]
    
    geometry_msgs/Vector3 velocity  # Velocity vector [km/h]
    geometry_msgs/Vector3 acceleration  # Acceleration vector [m/s^2]
    geometry_msgs/Vector3 size  # Bounding box size (width, length, height) [m]
    geometry_msgs/Vector3 position  # Position in ENU coordinates [m]
    
    geometry_msgs/Quaternion orientation  # Object orientation as quaternion
    int32 turn_signal  # Turn signal state (0: off, 1: left, 2: right, 3: hazard)
    string[] global_path_info  # Global path information
    int32 lane_departure  # Lane departure status
    float32 distance_left_lane  # Distance to left lane boundary [m]
    float32 distance_right_lane  # Distance to right lane boundary [m]
    float32 object_yaw_rate  # Object yaw rate [rad/s]
    
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
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObjectStatusListExtended(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.num_of_npcs !== undefined) {
      resolved.num_of_npcs = msg.num_of_npcs;
    }
    else {
      resolved.num_of_npcs = 0
    }

    if (msg.num_of_pedestrian !== undefined) {
      resolved.num_of_pedestrian = msg.num_of_pedestrian;
    }
    else {
      resolved.num_of_pedestrian = 0
    }

    if (msg.num_of_obstacle !== undefined) {
      resolved.num_of_obstacle = msg.num_of_obstacle;
    }
    else {
      resolved.num_of_obstacle = 0
    }

    if (msg.npc_list !== undefined) {
      resolved.npc_list = new Array(msg.npc_list.length);
      for (let i = 0; i < resolved.npc_list.length; ++i) {
        resolved.npc_list[i] = ObjectStatusExtended.Resolve(msg.npc_list[i]);
      }
    }
    else {
      resolved.npc_list = []
    }

    if (msg.pedestrian_list !== undefined) {
      resolved.pedestrian_list = new Array(msg.pedestrian_list.length);
      for (let i = 0; i < resolved.pedestrian_list.length; ++i) {
        resolved.pedestrian_list[i] = ObjectStatusExtended.Resolve(msg.pedestrian_list[i]);
      }
    }
    else {
      resolved.pedestrian_list = []
    }

    if (msg.obstacle_list !== undefined) {
      resolved.obstacle_list = new Array(msg.obstacle_list.length);
      for (let i = 0; i < resolved.obstacle_list.length; ++i) {
        resolved.obstacle_list[i] = ObjectStatusExtended.Resolve(msg.obstacle_list[i]);
      }
    }
    else {
      resolved.obstacle_list = []
    }

    return resolved;
    }
};

module.exports = ObjectStatusListExtended;
