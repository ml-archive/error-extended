import XCTest
@testable import ErrorExtended
import Vapor
import HTTP

class AbortExtendedTests: XCTestCase {

    static var allTests : [(String, (AbortExtendedTests) -> () throws -> Void)] {
        return [
            ("testDefaultValues", testDefaultValues),
            ("testCustomValues", testCustomValues)
        ]
    }


    // MARK: - Initialization.

    func testDefaultValues() {
        let error = AbortExtended.custom()
        XCTAssertEqual(error.status, .internalServerError, "Default status is wrong.")
        XCTAssertEqual(error.code, 0, "Default code is wrong.")
        XCTAssertEqual(error.reason, Status.internalServerError.reasonPhrase, "Default message is wrong")
        XCTAssertEqual(error.metadata, Node(["report": true]), "Default metadata is wrong")
    }

    func testCustomValues() {
        let error = AbortExtended.custom(
            status: .badGateway,
            code: 1337,
            metadata: Node(["key": "value"]),
            reason: "My custom error message",
            report: false
        )
        XCTAssertEqual(error.status, .badGateway, "Default status is wrong.")
        XCTAssertEqual(error.code, 1337, "Default code is wrong.")
        XCTAssertEqual(error.reason, "My custom error message", "Default message is wrong")
        XCTAssertEqual(error.metadata, Node(["key": "value", "report": false]), "Default metadata is wrong")
    }
}
