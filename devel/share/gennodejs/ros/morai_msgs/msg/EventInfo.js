// Auto-generated. Do not edit!

// (in-package morai_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Lamps = require('./Lamps.js');

//-----------------------------------------------------------

class EventInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.option = null;
      this.ctrl_mode = null;
      this.gear = null;
      this.lamps = null;
      this.set_pause = null;
    }
    else {
      if (initObj.hasOwnProperty('option')) {
        this.option = initObj.option
      }
      else {
        this.option = 0;
      }
      if (initObj.hasOwnProperty('ctrl_mode')) {
        this.ctrl_mode = initObj.ctrl_mode
      }
      else {
        this.ctrl_mode = 0;
      }
      if (initObj.hasOwnProperty('gear')) {
        this.gear = initObj.gear
      }
      else {
        this.gear = 0;
      }
      if (initObj.hasOwnProperty('lamps')) {
        this.lamps = initObj.lamps
      }
      else {
        this.lamps = new Lamps();
      }
      if (initObj.hasOwnProperty('set_pause')) {
        this.set_pause = initObj.set_pause
      }
      else {
        this.set_pause = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EventInfo
    // Serialize message field [option]
    bufferOffset = _serializer.int8(obj.option, buffer, bufferOffset);
    // Serialize message field [ctrl_mode]
    bufferOffset = _serializer.int32(obj.ctrl_mode, buffer, bufferOffset);
    // Serialize message field [gear]
    bufferOffset = _serializer.int32(obj.gear, buffer, bufferOffset);
    // Serialize message field [lamps]
    bufferOffset = Lamps.serialize(obj.lamps, buffer, bufferOffset);
    // Serialize message field [set_pause]
    bufferOffset = _serializer.bool(obj.set_pause, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EventInfo
    let len;
    let data = new EventInfo(null);
    // Deserialize message field [option]
    data.option = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [ctrl_mode]
    data.ctrl_mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [gear]
    data.gear = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lamps]
    data.lamps = Lamps.deserialize(buffer, bufferOffset);
    // Deserialize message field [set_pause]
    data.set_pause = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Lamps.getMessageSize(object.lamps);
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/EventInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3525edb8661dfd06b6e59bbcb7d475b5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # EventInfo
    # One-time event control for vehicle state changes.
    # Service: /Service_MoraiEventCmd (request/response)
    
    int8 option  # Bitmask for fields to apply (0x0001: ctrl_mode, 0x0010: gear, 0x0100: lamps, 0x1000: set_pause)
    int32 ctrl_mode  # Control mode (1: Keyboard, 2: Gamepad, 3: External, 6: Auto agent controlled)
    int32 gear  # Gear selection (-1: No change, 1: Parking, 2: Reverse, 3: Neutral, 4: Drive)
    Lamps lamps  # Vehicle lamp controls
    bool set_pause  # true: pause simulation, false: continue
    
    ================================================================================
    MSG: morai_msgs/Lamps
    # Lamps
    # Vehicle turn signal and emergency lamp control.
    # Topic: /lamps
    
    Header header
    
    int8 turnSignal  # Turn signal (0: No signal, 1: Left, 2: Right)
    int8 emergencySignal  # Emergency signal (0: No signal, 1: Emergency lamps on)
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EventInfo(null);
    if (msg.option !== undefined) {
      resolved.option = msg.option;
    }
    else {
      resolved.option = 0
    }

    if (msg.ctrl_mode !== undefined) {
      resolved.ctrl_mode = msg.ctrl_mode;
    }
    else {
      resolved.ctrl_mode = 0
    }

    if (msg.gear !== undefined) {
      resolved.gear = msg.gear;
    }
    else {
      resolved.gear = 0
    }

    if (msg.lamps !== undefined) {
      resolved.lamps = Lamps.Resolve(msg.lamps)
    }
    else {
      resolved.lamps = new Lamps()
    }

    if (msg.set_pause !== undefined) {
      resolved.set_pause = msg.set_pause;
    }
    else {
      resolved.set_pause = false
    }

    return resolved;
    }
};

module.exports = EventInfo;
