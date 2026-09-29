// Auto-generated. Do not edit!

// (in-package morai_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MapSpecIndex = require('../msg/MapSpecIndex.js');

//-----------------------------------------------------------

let MapSpec = require('../msg/MapSpec.js');

//-----------------------------------------------------------

class MoraiMapSpecSrvRequest {
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
        this.request = new MapSpecIndex();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoraiMapSpecSrvRequest
    // Serialize message field [request]
    bufferOffset = MapSpecIndex.serialize(obj.request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiMapSpecSrvRequest
    let len;
    let data = new MoraiMapSpecSrvRequest(null);
    // Deserialize message field [request]
    data.request = MapSpecIndex.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiMapSpecSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '70ff63378fe8f24cafd7c26339994774';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MapSpecIndex request
    
    ================================================================================
    MSG: morai_msgs/MapSpecIndex
    # MapSpecIndex
    # Map specification query request.
    # Service: /Service_MoraiMapSpec (request)
    
    bool load_map_data  # Flag to query map data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoraiMapSpecSrvRequest(null);
    if (msg.request !== undefined) {
      resolved.request = MapSpecIndex.Resolve(msg.request)
    }
    else {
      resolved.request = new MapSpecIndex()
    }

    return resolved;
    }
};

class MoraiMapSpecSrvResponse {
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
        this.response = new MapSpec();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoraiMapSpecSrvResponse
    // Serialize message field [response]
    bufferOffset = MapSpec.serialize(obj.response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoraiMapSpecSrvResponse
    let len;
    let data = new MoraiMapSpecSrvResponse(null);
    // Deserialize message field [response]
    data.response = MapSpec.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapSpec.getMessageSize(object.response);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'morai_msgs/MoraiMapSpecSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3ece60c7ec9cd22d0f3d7405c24531d1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MapSpec response
    
    ================================================================================
    MSG: morai_msgs/MapSpec
    # MapSpec
    # Map coordinate system specification.
    # Service: /Service_MoraiMapSpec (response)
    
    int32 plane_coordinate_system  # Coordinate system type (0: UTM CRS, 1: TM CRS)
    int32 utm_num  # UTM zone number, range 1~60
    
    geometry_msgs/Vector3 utm_offset  # Local offset [x, y, z]
    
    string ellipse  # Ellipsoid type (e.g., WGS84, GRS80)
    float64 central_latitude  # Central latitude (x-axis origin)
    float64 central_meridian  # Central longitude (y-axis origin)
    float64 scale_factor  # Scale multiplier, typically 1.0
    float64 false_easting  # Additional x-axis offset
    float64 false_northing  # Additional y-axis offset
    
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
    const resolved = new MoraiMapSpecSrvResponse(null);
    if (msg.response !== undefined) {
      resolved.response = MapSpec.Resolve(msg.response)
    }
    else {
      resolved.response = new MapSpec()
    }

    return resolved;
    }
};

module.exports = {
  Request: MoraiMapSpecSrvRequest,
  Response: MoraiMapSpecSrvResponse,
  md5sum() { return '05d746a24a1f7725a363510d4264a323'; },
  datatype() { return 'morai_msgs/MoraiMapSpecSrv'; }
};
