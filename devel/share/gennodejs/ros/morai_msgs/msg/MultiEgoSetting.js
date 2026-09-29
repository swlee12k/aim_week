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

class MultiEgoSetting {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.number_of_ego_vehicle = null;
      this.camera_index = null;
      this.ego_index = null;
      this.global_position_x = null;
      this.global_position_y = null;
      this.global_position_z = null;
      this.global_roll = null;
      this.global_pitch = null;
      this.global_yaw = null;
      this.velocity = null;
      this.gear = null;
      this.ctrl_mode = null;
      this.steering_angle = null;
      this.vehicle_speed = null;
      this.turn_signal = null;
      this.brake_light = null;
    }
    else {
      if (initObj.hasOwnProperty('number_of_ego_vehicle')) {
        this.number_of_ego_vehicle = initObj.number_of_ego_vehicle
      }
      else {
        this.number_of_ego_vehicle = 0;
      }
      if (initObj.hasOwnProperty('camera_index')) {
        this.camera_index = initObj.camera_index
      }
      else {
        this.camera_index = 0;
      }
      if (initObj.hasOwnProperty('ego_index')) {
        this.ego_index = initObj.ego_index
      }
      else {
        this.ego_index = [];
      }
      if (initObj.hasOwnProperty('global_position_x')) {
        this.global_position_x = initObj.global_position_x
      }
      else {
        this.global_position_x = [];
      }
      if (initObj.hasOwnProperty('global_position_y')) {
        this.global_position_y = initObj.global_position_y
      }
      else {
        this.global_position_y = [];
      }
      if (initObj.hasOwnProperty('global_position_z')) {
        this.global_position_z = initObj.global_position_z
      }
      else {
        this.global_position_z = [];
      }
      if (initObj.hasOwnProperty('global_roll')) {
        this.global_roll = initObj.global_roll
      }
      else {
        this.global_roll = [];
      }
      if (initObj.hasOwnProperty('global_pitch')) {
        this.global_pitch = initObj.global_pitch
      }
      else {
        this.global_pitch = [];
      }
      if (initObj.hasOwnProperty('global_yaw')) {
        this.global_yaw = initObj.global_yaw
      }
      else {
        this.global_yaw = [];
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = [];
      }
      if (initObj.hasOwnProperty('gear')) {
        this.gear = initObj.gear
      }
      else {
        this.gear = [];
      }
      if (initObj.hasOwnProperty('ctrl_mode')) {
        this.ctrl_mode = initObj.ctrl_mode
      }
      else {
        this.ctrl_mode = [];
      }
      if (initObj.hasOwnProperty('steering_angle')) {
        this.steering_angle = initObj.steering_angle
      }
      else {
        this.steering_angle = [];
      }
      if (initObj.hasOwnProperty('vehicle_speed')) {
        this.vehicle_speed = initObj.vehicle_speed
      }
      else {
        this.vehicle_speed = [];
      }
      if (initObj.hasOwnProperty('turn_signal')) {
        this.turn_signal = initObj.turn_signal
      }
      else {
        this.turn_signal = [];
      }
      if (initObj.hasOwnProperty('brake_light')) {
        this.brake_light = initObj.brake_light
      }
      else {
        this.brake_light = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MultiEgoSetting
    // Serialize message field [number_of_ego_vehicle]
    bufferOffset = _serializer.int32(obj.number_of_ego_vehicle, buffer, bufferOffset);
    // Serialize message field [camera_index]
    bufferOffset = _serializer.int32(obj.camera_index, buffer, bufferOffset);
    // Serialize message field [ego_index]
    bufferOffset = _arraySerializer.int32(obj.ego_index, buffer, bufferOffset, null);
    // Serialize message field [global_position_x]
    bufferOffset = _arraySerializer.float64(obj.global_position_x, buffer, bufferOffset, null);
    // Serialize message field [global_position_y]
    bufferOffset = _arraySerializer.float64(obj.global_position_y, buffer, bufferOffset, null);
    // Serialize message field [global_position_z]
    bufferOffset = _arraySerializer.float64(obj.global_position_z, buffer, bufferOffset, null);
    // Serialize message field [global_roll]
    bufferOffset = _arraySerializer.float32(obj.global_roll, buffer, bufferOffset, null);
    // Serialize message field [global_pitch]
    bufferOffset = _arraySerializer.float32(obj.global_pitch, buffer, bufferOffset, null);
    // Serialize message field [global_yaw]
    bufferOffset = _arraySerializer.float32(obj.global_yaw, buffer, bufferOffset, null);
    // Serialize message field [velocity]
    bufferOffset = _arraySerializer.float32(obj.velocity, buffer, bufferOffset, null);
    // Serialize message field [gear]
    bufferOffset = _arraySerializer.int8(obj.gear, buffer, bufferOffset, null);
    // Serialize message field [ctrl_mode]
    bufferOffset = _arraySerializer.int8(obj.ctrl_mode, buffer, bufferOffset, null);
    // Serialize message field [steering_angle]
    bufferOffset = _arraySerializer.float32(obj.steering_angle, buffer, bufferOffset, null);
    // Serialize message field [vehicle_speed]
    bufferOffset = _arraySerializer.float32(obj.vehicle_speed, buffer, bufferOffset, null);
    // Serialize message field [turn_signal]
    bufferOffset = _arraySerializer.uint32(obj.turn_signal, buffer, bufferOffset, null);
    // Serialize message field [brake_light]
    bufferOffset = _arraySerializer.bool(obj.brake_light, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultiEgoSetting
    let len;
    let data = new MultiEgoSetting(null);
    // Deserialize message field [number_of_ego_vehicle]
    data.number_of_ego_vehicle = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [camera_index]
    data.camera_index = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ego_index]
    data.ego_index = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [global_position_x]
    data.global_position_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [global_position_y]
    data.global_position_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [global_position_z]
    data.global_position_z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [global_roll]
    data.global_roll = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [global_pitch]
    data.global_pitch = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [global_yaw]
    data.global_yaw = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [velocity]
    data.velocity = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [gear]
    data.gear = _arrayDeserializer.int8(buffer, bufferOffset, null)
    // Deserialize message field [ctrl_mode]
    data.ctrl_mode = _arrayDeserializer.int8(buffer, bufferOffset, null)
    // Deserialize message field [steering_angle]
    data.steering_angle = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [vehicle_speed]
    data.vehicle_speed = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [turn_signal]
    data.turn_signal = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [brake_light]
    data.brake_light = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.ego_index.length;
    length += 8 * object.global_position_x.length;
    length += 8 * object.global_position_y.length;
    length += 8 * object.global_position_z.length;
    length += 4 * object.global_roll.length;
    length += 4 * object.global_pitch.length;
    length += 4 * object.global_yaw.length;
    length += 4 * object.velocity.length;
    length += object.gear.length;
    length += object.ctrl_mode.length;
    length += 4 * object.steering_angle.length;
    length += 4 * object.vehicle_speed.length;
    length += 4 * object.turn_signal.length;
    length += object.brake_light.length;
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'morai_msgs/MultiEgoSetting';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3e8bbb30459c32caa67e324bd44dff5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # MultiEgoSetting
    # Control multiple ego vehicles in the scene with external controllers.
    # Topic: /ego_setting
    
    int32 number_of_ego_vehicle  # Number of multi-ego vehicles
    int32 camera_index  # Unique index of the viewed vehicle
    int32[] ego_index  # Unique indices of multi-ego vehicles to control
    float64[] global_position_x  # X-axis position of each multi-ego
    float64[] global_position_y  # Y-axis position of each multi-ego
    float64[] global_position_z  # Z-axis position (elevation) of each multi-ego
    float32[] global_roll  # Roll angle of each multi-ego
    float32[] global_pitch  # Pitch angle of each multi-ego
    float32[] global_yaw  # Heading angle of each multi-ego
    float32[] velocity  # Velocity of each multi-ego
    int8[] gear  # Gear (1: Parking, 2: Reverse, 3: Neutral, 4: Drive)
    int8[] ctrl_mode  # Control mode (1: keyboard, 16: auto)
    
    float32[] steering_angle  # Steering angle [deg]
    float32[] vehicle_speed  # Vehicle speed [km/h]
    uint32[] turn_signal  # Turn signal (0: off, 1: left, 2: right, 3: hazard)
    bool[] brake_light  # Brake light (false: off, true: on)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultiEgoSetting(null);
    if (msg.number_of_ego_vehicle !== undefined) {
      resolved.number_of_ego_vehicle = msg.number_of_ego_vehicle;
    }
    else {
      resolved.number_of_ego_vehicle = 0
    }

    if (msg.camera_index !== undefined) {
      resolved.camera_index = msg.camera_index;
    }
    else {
      resolved.camera_index = 0
    }

    if (msg.ego_index !== undefined) {
      resolved.ego_index = msg.ego_index;
    }
    else {
      resolved.ego_index = []
    }

    if (msg.global_position_x !== undefined) {
      resolved.global_position_x = msg.global_position_x;
    }
    else {
      resolved.global_position_x = []
    }

    if (msg.global_position_y !== undefined) {
      resolved.global_position_y = msg.global_position_y;
    }
    else {
      resolved.global_position_y = []
    }

    if (msg.global_position_z !== undefined) {
      resolved.global_position_z = msg.global_position_z;
    }
    else {
      resolved.global_position_z = []
    }

    if (msg.global_roll !== undefined) {
      resolved.global_roll = msg.global_roll;
    }
    else {
      resolved.global_roll = []
    }

    if (msg.global_pitch !== undefined) {
      resolved.global_pitch = msg.global_pitch;
    }
    else {
      resolved.global_pitch = []
    }

    if (msg.global_yaw !== undefined) {
      resolved.global_yaw = msg.global_yaw;
    }
    else {
      resolved.global_yaw = []
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = []
    }

    if (msg.gear !== undefined) {
      resolved.gear = msg.gear;
    }
    else {
      resolved.gear = []
    }

    if (msg.ctrl_mode !== undefined) {
      resolved.ctrl_mode = msg.ctrl_mode;
    }
    else {
      resolved.ctrl_mode = []
    }

    if (msg.steering_angle !== undefined) {
      resolved.steering_angle = msg.steering_angle;
    }
    else {
      resolved.steering_angle = []
    }

    if (msg.vehicle_speed !== undefined) {
      resolved.vehicle_speed = msg.vehicle_speed;
    }
    else {
      resolved.vehicle_speed = []
    }

    if (msg.turn_signal !== undefined) {
      resolved.turn_signal = msg.turn_signal;
    }
    else {
      resolved.turn_signal = []
    }

    if (msg.brake_light !== undefined) {
      resolved.brake_light = msg.brake_light;
    }
    else {
      resolved.brake_light = []
    }

    return resolved;
    }
};

module.exports = MultiEgoSetting;
