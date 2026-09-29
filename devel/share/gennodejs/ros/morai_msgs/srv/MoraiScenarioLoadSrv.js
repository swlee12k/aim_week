// Auto-generated. Do not edit!

// (in-package morai_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ScenarioLoad = require('../msg/ScenarioLoad.js');

//-----------------------------------------------------------

let MoraiSrvResponse = require('../msg/MoraiSrvResponse.js');

//-----------------------------------------------------------

class MoraiScenarioLoadSrvRequest {
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
        this.request = new ScenarioLoad();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoraiScenarioLoadSrvRequest
    // Serialize message field [request]
    bufferOffset = ScenarioLoad.serialize(obj.request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiScenarioLoadSrvRequest
    let len;
    let data = new MoraiScenarioLoadSrvRequest(null);
    // Deserialize message field [request]
    data.request = ScenarioLoad.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += ScenarioLoad.getMessageSize(object.request);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiScenarioLoadSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1091998df38b6bfaae34dd6c930bb6b1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ScenarioLoad request
    
    ================================================================================
    MSG: morai_msgs/ScenarioLoad
    # ScenarioLoad
    # Load a scenario file and configure which data to include.
    # Topic: /ScenarioLoad
    
    string file_name  # Scenario file name to load
    bool load_network_connection_data  # true: load network connection data, false: skip
    bool delete_all  # true: delete existing and load excluding ego vehicle, false: load all
    bool load_ego_vehicle_data  # true: load ego vehicle data, false: skip
    bool load_surrounding_vehicle_data  # true: load NPC vehicle data, false: skip
    bool load_pedestrian_data  # true: load pedestrian data, false: skip
    bool load_obstacle_data  # true: load obstacle data, false: skip
    bool set_pause  # true: pause after loading, false: play immediately
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoraiScenarioLoadSrvRequest(null);
    if (msg.request !== undefined) {
      resolved.request = ScenarioLoad.Resolve(msg.request)
    }
    else {
      resolved.request = new ScenarioLoad()
    }

    return resolved;
    }
};

class MoraiScenarioLoadSrvResponse {
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
    // Serializes a message object of type MoraiScenarioLoadSrvResponse
    // Serialize message field [response]
    bufferOffset = MoraiSrvResponse.serialize(obj.response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiScenarioLoadSrvResponse
    let len;
    let data = new MoraiScenarioLoadSrvResponse(null);
    // Deserialize message field [response]
    data.response = MoraiSrvResponse.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiScenarioLoadSrvResponse';
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
    const resolved = new MoraiScenarioLoadSrvResponse(null);
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
  Request: MoraiScenarioLoadSrvRequest,
  Response: MoraiScenarioLoadSrvResponse,
  md5sum() { return '25b7997ab4e17f67a86b3d83c84ac51d'; },
  datatype() { return 'morai_msgs/MoraiScenarioLoadSrv'; }
};
