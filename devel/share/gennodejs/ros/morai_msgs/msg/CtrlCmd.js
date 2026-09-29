// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CtrlCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.longlCmdType = null;
      this.accel = null;
      this.brake = null;
      this.front_steer = null;
      this.rear_steer = null;
      this.velocity = null;
      this.acceleration = null;
    }
    else {
      if (initObj.hasOwnProperty('longlCmdType')) {
        this.longlCmdType = initObj.longlCmdType
      }
      else {
        this.longlCmdType = 0;
      }
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = 0.0;
      }
      if (initObj.hasOwnProperty('brake')) {
        this.brake = initObj.brake
      }
      else {
        this.brake = 0.0;
      }
      if (initObj.hasOwnProperty('front_steer')) {
        this.front_steer = initObj.front_steer
      }
      else {
        this.front_steer = 0.0;
      }
      if (initObj.hasOwnProperty('rear_steer')) {
        this.rear_steer = initObj.rear_steer
      }
      else {
        this.rear_steer = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration')) {
        this.acceleration = initObj.acceleration
      }
      else {
        this.acceleration = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CtrlCmd
    // Serialize message field [longlCmdType]
    bufferOffset = _serializer.int32(obj.longlCmdType, buffer, bufferOffset);
    // Serialize message field [accel]
    bufferOffset = _serializer.float64(obj.accel, buffer, bufferOffset);
    // Serialize message field [brake]
    bufferOffset = _serializer.float64(obj.brake, buffer, bufferOffset);
    // Serialize message field [front_steer]
    bufferOffset = _serializer.float64(obj.front_steer, buffer, bufferOffset);
    // Serialize message field [rear_steer]
    bufferOffset = _serializer.float64(obj.rear_steer, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float64(obj.velocity, buffer, bufferOffset);
    // Serialize message field [acceleration]
    bufferOffset = _serializer.float64(obj.acceleration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CtrlCmd
    let len;
    let data = new CtrlCmd(null);
    // Deserialize message field [longlCmdType]
    data.longlCmdType = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [accel]
    data.accel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [brake]
    data.brake = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [front_steer]
    data.front_steer = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rear_steer]
    data.rear_steer = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [acceleration]
    data.acceleration = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/CtrlCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b36ceb480d187645a32b95c2be82bf56';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CtrlCmd(null);
    if (msg.longlCmdType !== undefined) {
      resolved.longlCmdType = msg.longlCmdType;
    }
    else {
      resolved.longlCmdType = 0
    }

    if (msg.accel !== undefined) {
      resolved.accel = msg.accel;
    }
    else {
      resolved.accel = 0.0
    }

    if (msg.brake !== undefined) {
      resolved.brake = msg.brake;
    }
    else {
      resolved.brake = 0.0
    }

    if (msg.front_steer !== undefined) {
      resolved.front_steer = msg.front_steer;
    }
    else {
      resolved.front_steer = 0.0
    }

    if (msg.rear_steer !== undefined) {
      resolved.rear_steer = msg.rear_steer;
    }
    else {
      resolved.rear_steer = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.acceleration !== undefined) {
      resolved.acceleration = msg.acceleration;
    }
    else {
      resolved.acceleration = 0.0
    }

    return resolved;
    }
};

module.exports = CtrlCmd;
