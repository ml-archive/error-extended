import XCTest
@testable import error_extended

class error_extendedTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(error_extended().text, "Hello, World!")
    }


    static var allTests : [(String, (error_extendedTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
