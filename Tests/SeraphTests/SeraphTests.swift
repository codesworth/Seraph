import XCTest
@testable import Seraph

final class SeraphTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Seraph().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
