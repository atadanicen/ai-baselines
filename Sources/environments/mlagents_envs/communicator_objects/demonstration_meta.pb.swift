// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: mlagents_envs/communicator_objects/demonstration_meta.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct CommunicatorObjects_DemonstrationMetaProto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var apiVersion: Int32 = 0

  var demonstrationName: String = String()

  var numberSteps: Int32 = 0

  var numberEpisodes: Int32 = 0

  var meanReward: Float = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "communicator_objects"

extension CommunicatorObjects_DemonstrationMetaProto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DemonstrationMetaProto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "api_version"),
    2: .standard(proto: "demonstration_name"),
    3: .standard(proto: "number_steps"),
    4: .standard(proto: "number_episodes"),
    5: .standard(proto: "mean_reward"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.apiVersion)
      case 2: try decoder.decodeSingularStringField(value: &self.demonstrationName)
      case 3: try decoder.decodeSingularInt32Field(value: &self.numberSteps)
      case 4: try decoder.decodeSingularInt32Field(value: &self.numberEpisodes)
      case 5: try decoder.decodeSingularFloatField(value: &self.meanReward)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.apiVersion != 0 {
      try visitor.visitSingularInt32Field(value: self.apiVersion, fieldNumber: 1)
    }
    if !self.demonstrationName.isEmpty {
      try visitor.visitSingularStringField(value: self.demonstrationName, fieldNumber: 2)
    }
    if self.numberSteps != 0 {
      try visitor.visitSingularInt32Field(value: self.numberSteps, fieldNumber: 3)
    }
    if self.numberEpisodes != 0 {
      try visitor.visitSingularInt32Field(value: self.numberEpisodes, fieldNumber: 4)
    }
    if self.meanReward != 0 {
      try visitor.visitSingularFloatField(value: self.meanReward, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CommunicatorObjects_DemonstrationMetaProto, rhs: CommunicatorObjects_DemonstrationMetaProto) -> Bool {
    if lhs.apiVersion != rhs.apiVersion {return false}
    if lhs.demonstrationName != rhs.demonstrationName {return false}
    if lhs.numberSteps != rhs.numberSteps {return false}
    if lhs.numberEpisodes != rhs.numberEpisodes {return false}
    if lhs.meanReward != rhs.meanReward {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}