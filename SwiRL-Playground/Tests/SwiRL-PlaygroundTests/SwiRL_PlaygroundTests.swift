import XCTest
@testable import SwiRL_Playground

final class SwiRL_PlaygroundTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiRL_Playground().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
