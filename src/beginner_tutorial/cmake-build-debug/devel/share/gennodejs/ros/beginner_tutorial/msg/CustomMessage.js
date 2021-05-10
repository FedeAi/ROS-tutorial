// Auto-generated. Do not edit!

// (in-package beginner_tutorial.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class CustomMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.im_true = null;
      this.means = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('im_true')) {
        this.im_true = initObj.im_true
      }
      else {
        this.im_true = false;
      }
      if (initObj.hasOwnProperty('means')) {
        this.means = initObj.means
      }
      else {
        this.means = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CustomMessage
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [im_true]
    bufferOffset = _serializer.bool(obj.im_true, buffer, bufferOffset);
    // Check that the constant length array field [means] has the right length
    if (obj.means.length !== 4) {
      throw new Error('Unable to serialize array field means - length must be 4')
    }
    // Serialize message field [means]
    bufferOffset = _arraySerializer.float64(obj.means, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CustomMessage
    let len;
    let data = new CustomMessage(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [im_true]
    data.im_true = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [means]
    data.means = _arrayDeserializer.float64(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorial/CustomMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4f6f12475d5f3b00d1c1cc40fe235cbb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool im_true
    float64[4] means
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
    const resolved = new CustomMessage(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.im_true !== undefined) {
      resolved.im_true = msg.im_true;
    }
    else {
      resolved.im_true = false
    }

    if (msg.means !== undefined) {
      resolved.means = msg.means;
    }
    else {
      resolved.means = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = CustomMessage;
