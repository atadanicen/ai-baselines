import XCTest
@testable import environments

class IntChannel: SideChannel {
    var intList = [Int32]()

    init() {
        super.init(channelId: UUID(uuidString: "a85ba5c0-4f87-11ea-a517-784f4387d1f7")!)
    }

    override func onMessageReceived(msg: IncomingMessage) -> Void {
        let intVal = msg.readInt32()
        intList.append(intVal)
    }

    func sendInt(_ intVal: Int32) -> Void {
        let msg = OutgoingMessage()
        msg.writeInt32(intVal)
        super.queueMessageToSend(msg: msg)
    }
}

class SideChannelTest: XCTestCase {
    func testIntChannel() throws {
        let sender = IntChannel()
        let receiver = IntChannel()
        sender.sendInt(5)
        sender.sendInt(6)
        let data = try SideChannelManager(sideChannels: [sender]).generateSideChannelMessages()
        try SideChannelManager(sideChannels: [receiver]).processSideChannelMessage(message: data)
        XCTAssertEqual(receiver.intList[0], 5)
        XCTAssertEqual(receiver.intList[1], 6)
    }

    func testMessageBool() throws {
        let vals = [true, false]
        let msgOut = OutgoingMessage()
        for v in vals {
            msgOut.writeBool(v)
        }
        let msgIn = IncomingMessage(buffer: msgOut.buffer)
        var readVals = [Bool]()
        for _ in vals {
            readVals.append(msgIn.readBool())
        }
        XCTAssertEqual(vals, readVals)

        //Test reading with defaults
        XCTAssertFalse(msgIn.readBool())
        XCTAssertTrue(msgIn.readBool(defaultValue: true))
    }

    func testMessageInt32() throws {
        let val: Int32 = 1337
        let msgOut = OutgoingMessage()
        msgOut.writeInt32(val)
        let msgIn = IncomingMessage(buffer: msgOut.buffer)
        let readVal = msgIn.readInt32()
        XCTAssertEqual(val, readVal)

        //Test reading with defaults
        XCTAssertEqual(0, msgIn.readInt32())
        XCTAssertEqual(val, msgIn.readInt32(defaultValue: val))
    }

    func testMessageFloat32() throws {
        let val: Float32 = 42.0
        let msgOut = OutgoingMessage()
        msgOut.writeFloat32(val)
        let msgIn = IncomingMessage(buffer: msgOut.buffer)
        let readVal = msgIn.readFloat32()
        XCTAssertEqual(val, readVal)

        //Test reading with defaults
        XCTAssertEqual(0.0, msgIn.readFloat32())
        XCTAssertEqual(val, msgIn.readFloat32(defaultValue: val))
    }

    func testMessageString() throws {
        let val = "mlagents!"
        let msgOut = OutgoingMessage()
        try msgOut.writeString(val)
        let msgIn = IncomingMessage(buffer: msgOut.buffer)
        let readVal = msgIn.readString()
        XCTAssertEqual(val, readVal)

        //Test reading with defaults
        XCTAssertEqual("", msgIn.readString())
        XCTAssertEqual(val, msgIn.readString(defaultValue: val))
    }

    func testMessageFloat32List() throws {
        let val: [Float32] = [1.0, 3.0, 9.0]
        let msgOut = OutgoingMessage()
        msgOut.writeFloat32List(val)
        let msgIn = IncomingMessage(buffer: msgOut.buffer)
        let readVal = msgIn.readFloat32List()
        XCTAssertEqual(val, readVal)

        //Test reading with defaults
        XCTAssertEqual([], msgIn.readFloat32List())
        XCTAssertEqual(val, msgIn.readFloat32List(defaultValue: val))
    }
}