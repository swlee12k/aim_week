// Auto-generated. Do not edit!

// (in-package morai_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MoraiSimProcHandle = require('../msg/MoraiSimProcHandle.js');

//-----------------------------------------------------------

let MoraiSrvResponse = require('../msg/MoraiSrvResponse.js');

//-----------------------------------------------------------

class MoraiSimProcSrvRequest {
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
        this.request = new MoraiSimProcHandle();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoraiSimProcSrvRequest
    // Serialize message field [request]
    bufferOffset = MoraiSimProcHandle.serialize(obj.request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiSimProcSrvRequest
    let len;
    let data = new MoraiSimProcSrvRequest(null);
    // Deserialize message field [request]
    data.request = MoraiSimProcHandle.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MoraiSimProcHandle.getMessageSize(object.request);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiSimProcSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '63aeb3f26afc04a3d784ec3b35914d16';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MoraiSimProcHandle request
    
    ================================================================================
    MSG: morai_msgs/MoraiSimProcHandle
    # MoraiSimProcHandle
    # Playback commands and conditions for rosbag replay.
    
    uint8 sim_process_status  # Process status (1: Playing, 2: Paused, 32: Stopped)
    
    int16 replay_option  # Bitmask (0x0001: load file, 0x0010: designate target, 0x0100: set start time, 0x1000: set speed)
    string rosbag_file_name  # Filename of the rosbag file to load
    int16 replay_target_option  # Bitmask (0x0001: ego vehicle, 0x0010: NPC vehicle, 0x0100: pedestrian)
    
    int32 replay_speed  # Playback speed multiplier (e.g., 1, 2)
    int32 start_time  # Start time [ms]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoraiSimProcSrvRequest(null);
    if (msg.request !== undefined) {
      resolved.request = MoraiSimProcHandle.Resolve(msg.request)
    }
    else {
      resolved.request = new MoraiSimProcHandle()
    }

    return resolved;
    }
};

class MoraiSimProcSrvResponse {
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
        this.response = new MoraiSrvResponse();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoraiSimProcSrvResponse
    // Serialize message field [response]
    bufferOffset = MoraiSrvResponse.serialize(obj.response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiSimProcSrvResponse
    let len;
    let data = new MoraiSimProcSrvResponse(null);
    // Deserialize message field [response]
    data.response = MoraiSrvResponse.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiSimProcSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4039c80fa74cc3be5f583706bf97e6b0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MoraiSrvResponse response
    
    
    ================================================================================
    MSG: morai_msgs/MoraiSrvResponse
    # MoraiSrvResponse
    # Generic service response indicating success or failure.
    
    bool result  # true: success, false: failure
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoraiSimProcSrvResponse(null);
    if (msg.response !== undefined) {
      resolved.response = MoraiSrvResponse.Resolve(msg.response)
    }
    else {
      resolved.response = new MoraiSrvResponse()
    }

    return resolved;
    }
};

module.exports = {
  Request: MoraiSimProcSrvRequest,
  Response: MoraiSimProcSrvResponse,
  md5sum() { return '6d340598acf4b7d6e6f913c45512bf48'; },
  datatype() { return 'morai_msgs/MoraiSimProcSrv'; }
};
