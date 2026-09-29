// Auto-generated. Do not edit!

// (in-package aim_week1.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CustomMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.float_data = null;
      this.double_data = null;
      this.float_array = null;
    }
    else {
      if (initObj.hasOwnProperty('float_data')) {
        this.float_data = initObj.float_data
      }
      else {
        this.float_data = 0.0;
      }
      if (initObj.hasOwnProperty('double_data')) {
        this.double_data = initObj.double_data
      }
      else {
        this.double_data = 0.0;
      }
      if (initObj.hasOwnProperty('float_array')) {
        this.float_array = initObj.float_array
      }
      else {
        this.float_array = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CustomMsg
    // Serialize message field [float_data]
    bufferOffset = _serializer.float32(obj.float_data, buffer, bufferOffset);
    // Serialize message field [double_data]
    bufferOffset = _serializer.float64(obj.double_data, buffer, bufferOffset);
    // Serialize message field [float_array]
    bufferOffset = _arraySerializer.float32(obj.float_array, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CustomMsg
    let len;
    let data = new CustomMsg(null);
    // Deserialize message field [float_data]
    data.float_data = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [double_data]
    data.double_data = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [float_array]
    data.float_array = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.float_array.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'aim_week1/CustomMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '85e53a95a789917d4fe5c58d9212cdda';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 float_data
    float64 double_data
    float32[] float_array
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CustomMsg(null);
    if (msg.float_data !== undefined) {
      resolved.float_data = msg.float_data;
    }
    else {
      resolved.float_data = 0.0
    }

    if (msg.double_data !== undefined) {
      resolved.double_data = msg.double_data;
    }
    else {
      resolved.double_data = 0.0
    }

    if (msg.float_array !== undefined) {
      resolved.float_array = msg.float_array;
    }
    else {
      resolved.float_array = []
    }

    return resolved;
    }
};

module.exports = CustomMsg;
