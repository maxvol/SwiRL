import XCTest
@testable import SwiRL

final class SwiRLTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiRL().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
